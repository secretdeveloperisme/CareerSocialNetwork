package com.hoanglinhplus.CareerSocialNetwork.controllers.view;

import com.hoanglinhplus.CareerSocialNetwork.dto.comment.CommentFilterDTO;
import com.hoanglinhplus.CareerSocialNetwork.models.*;
import com.hoanglinhplus.CareerSocialNetwork.securities.PermissionService;
import com.hoanglinhplus.CareerSocialNetwork.services.*;
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
@RequestMapping("/job")
public class JobViewController {
  private final CompanyService companyService;
  private final JobService jobService;
  private final AuthenticationTokenUtil authenticationTokenUtil;
  private final UserService userService;
  private final JobActionService jobActionService;
  private final CommentService commentService;
  private final ApplicationService applicatonService;
  private final PermissionService permissionService;

  public JobViewController(CompanyService companyService, JobService jobService, AuthenticationTokenUtil authenticationTokenUtil, UserService userService, JobActionService jobActionService, CommentService commentService, ApplicationService applicatonService, PermissionService permissionService) {
    this.companyService = companyService;
    this.jobService = jobService;
    this.authenticationTokenUtil = authenticationTokenUtil;
    this.userService = userService;
    this.jobActionService = jobActionService;
    this.commentService = commentService;
    this.applicatonService = applicatonService;
    this.permissionService = permissionService;
  }

  @RequestMapping("/create/{companyId}")
  public String createJob(@PathVariable("companyId") Long companyId, Model model, HttpServletRequest request) {
    Company company = companyService.getCompany(companyId);
    List<Skill> skills = jobService.getAllSkills();
    List<Position> positions = jobService.getAllPositions();
    List<WorkPlace> workPlaces = jobService.getAllWorkPlaces();
    List<EmploymentType> employmentTypes = jobService.getAllEmploymentType();
    Map<String, Object> principal = authenticationTokenUtil.getPrincipalFromToken(request);
    User user = null;
    if (principal != null) {
      user = userService.getUser(((Integer)principal.get("userId")).longValue()) ;
    }
    assert user != null;
    if(!user.isAdmin()){
      if(!company.getCreatedUser().getUserId().equals(user.getUserId())) {
        return "error/401";
      }
    }
    model.addAttribute("company", company);
    model.addAttribute("user", user);
    model.addAttribute("skills", skills);
    model.addAttribute("positions", positions);
    model.addAttribute("workPlaces", workPlaces);
    model.addAttribute("employmentTypes", employmentTypes);
    return "job/create_job";
  }
  @GetMapping("/edit/{jobId}")
  public String editJob(@PathVariable("jobId") Long jobId, Model model, HttpServletRequest request) {
    Job job = jobService.getJob(jobId);
    List<Skill> skills = jobService.getAllSkills();
    List<Position> positions = jobService.getAllPositions();
    List<WorkPlace> workPlaces = jobService.getAllWorkPlaces();
    List<EmploymentType> employmentTypes = jobService.getAllEmploymentType();
    Map<String, Object> principal = authenticationTokenUtil.getPrincipalFromToken(request);
    User user = null;
    if (principal != null) {
      user = userService.getUser(((Integer)principal.get("userId")).longValue()) ;
    }
    assert user != null;
    if(!user.isAdmin()) {
      if (!permissionService.isOwnerJob(user, job)) {
        return "error/401";
      }
    }
    model.addAttribute("job", job);
    model.addAttribute("user", user);
    model.addAttribute("skills", skills);
    model.addAttribute("positions", positions);
    model.addAttribute("workPlaces", workPlaces);
    model.addAttribute("employmentTypes", employmentTypes);
    return "job/edit_job";
  }
  @RequestMapping("/{jobId}")
  public String getJob(@PathVariable("jobId") Long jobId, Model model, HttpServletRequest request) {
    Job job = jobService.getJob(jobId);
    List<Comment> comments = job.getComments();
    Company company = job.getCompany();
    Like like = null;
    boolean isBookmarked = false;
    Boolean isFollowed = null;
    Map<String,Long> numberOfReactions = jobActionService.getNumberOfLikes(jobId);
    long amountOfBookmarks = jobActionService.getNumberOfBookmarks(jobId);
    Map<String, Object> principal = authenticationTokenUtil.getPrincipalFromToken(request);
    Map<String,Object> commentsData = commentService.getAllComments(CommentFilterDTO.builder().jobId(jobId).build());
    long numberOfComments = (long) commentService.getAllComments(CommentFilterDTO.builder().jobId(jobId).build()).get("numberOfComments");
    Map<String, Object> numberOfApplications = applicatonService.getNumberOfApplications(jobId);
    User user = null;
    if (principal != null) {
      user = userService.getUser(((Integer)principal.get("userId")).longValue()) ;
      isBookmarked = jobActionService.getBookmarkJob(user.getUserId(),jobId);
      like = jobActionService.getReactionJob(user.getUserId(),jobId);
      isFollowed = companyService.isCurrentUserFollowed(company.getCompanyId());
    }

    model.addAttribute("numberOfReactions", numberOfReactions);
    model.addAttribute("company", company);
    model.addAttribute("comments",comments);
    model.addAttribute("user", user);
    model.addAttribute("like", like);
    model.addAttribute("numberOfComments", numberOfComments);
    model.addAttribute("job", job);
    model.addAttribute("isFollowed", isFollowed);
    model.addAttribute("isBookmarked", isBookmarked);
    model.addAttribute("amountOfBookmarks", amountOfBookmarks);
    model.addAttribute("commentsData", commentsData);
    model.addAttribute("numberOfApplications", numberOfApplications.get("numberOfPendingApplications"));

    return "job/get_job";
  }
}
