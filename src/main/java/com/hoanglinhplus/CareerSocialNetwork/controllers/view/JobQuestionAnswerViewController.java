package com.hoanglinhplus.CareerSocialNetwork.controllers.view;

import com.hoanglinhplus.CareerSocialNetwork.exceptions.PermissionDeniedException;
import com.hoanglinhplus.CareerSocialNetwork.models.*;
import com.hoanglinhplus.CareerSocialNetwork.models.projection.AnswerQuestionInfo;
import com.hoanglinhplus.CareerSocialNetwork.securities.PermissionService;
import com.hoanglinhplus.CareerSocialNetwork.services.AnswerService;
import com.hoanglinhplus.CareerSocialNetwork.services.JobService;
import com.hoanglinhplus.CareerSocialNetwork.services.UserService;
import com.hoanglinhplus.CareerSocialNetwork.utils.AuthenticationTokenUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/question-answer")
public class JobQuestionAnswerViewController {
  private final JobService jobService;
  private final AuthenticationTokenUtil authenticationTokenUtil;
  private final PermissionService permissionService;
  private final UserService userService;
  private final AnswerService answerService;
  public JobQuestionAnswerViewController(JobService jobService, AuthenticationTokenUtil authenticationTokenUtil, PermissionService permissionService, UserService userService, AnswerService answerService) {
    this.jobService = jobService;
    this.authenticationTokenUtil = authenticationTokenUtil;
    this.permissionService = permissionService;
    this.userService = userService;
    this.answerService = answerService;
  }

  @GetMapping("/questions/create/{jobId}")
  public String createJobQuestions(@PathVariable("jobId") Long jobId, HttpServletRequest request, Model model){
    User user = null;
    Job job = jobService.getJob(jobId);
    Company company = job.getCompany();
    List<JobQuestion> jobQuestions = job.getJobQuestion();
    Map<String, Object> principal = authenticationTokenUtil.getPrincipalFromToken(request);
    if (principal == null) {
      throw new PermissionDeniedException("You don't have permission to create job question");
    }
    user = userService.getUser(((Integer)principal.get("userId")).longValue()) ;
    if(!permissionService.isOwnerJob(user.getUserId(),job.getJobId())){
      throw new PermissionDeniedException("You don't have permission to create job question");
    }
    model.addAttribute("user", user);
    model.addAttribute("job", job);
    model.addAttribute("company",company);
    model.addAttribute("jobQuestions", jobQuestions);
    return "question_answer/create_job_questions";
  }
  @GetMapping("answer/create/{jobId}")
  public String createJobAnswers(@PathVariable("jobId") Long jobId, HttpServletRequest request, Model model){
    User user = null;
    Job job = jobService.getJob(jobId);
    Company company = job.getCompany();
    Map<String, Object> principal = authenticationTokenUtil.getPrincipalFromToken(request);
    if (principal == null) {
      throw new PermissionDeniedException("You don't have permission to create job question");
    }
    user = userService.getUser(((Integer)principal.get("userId")).longValue()) ;
    List<AnswerQuestionInfo> answerQuestions = answerService.getAnswerQuestions(user.getUserId(), jobId);
    model.addAttribute("user", user);
    model.addAttribute("job", job);
    model.addAttribute("company",company);
    model.addAttribute("answerQuestions", answerQuestions);
    return "question_answer/create_job_answers";
  }
}
