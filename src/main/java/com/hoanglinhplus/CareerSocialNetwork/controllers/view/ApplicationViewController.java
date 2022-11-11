package com.hoanglinhplus.CareerSocialNetwork.controllers.view;

import com.hoanglinhplus.CareerSocialNetwork.dto.job.ApplicationDTO;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.PermissionDeniedException;
import com.hoanglinhplus.CareerSocialNetwork.models.Job;
import com.hoanglinhplus.CareerSocialNetwork.models.User;
import com.hoanglinhplus.CareerSocialNetwork.securities.PermissionService;
import com.hoanglinhplus.CareerSocialNetwork.services.ApplicationService;
import com.hoanglinhplus.CareerSocialNetwork.services.JobService;
import com.hoanglinhplus.CareerSocialNetwork.services.UserService;
import com.hoanglinhplus.CareerSocialNetwork.utils.AuthenticationTokenUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@RequestMapping("/application")
public class ApplicationViewController {
  private final ApplicationService applicationService;
  private final JobService jobService;
  private final AuthenticationTokenUtil authenticationTokenUtil;
  private final UserService userService;
  private final PermissionService permissionService;

  public ApplicationViewController(ApplicationService applicationService, JobService jobService, AuthenticationTokenUtil authenticationTokenUtil, UserService userService, PermissionService permissionService) {
    this.applicationService = applicationService;
    this.jobService = jobService;
    this.authenticationTokenUtil = authenticationTokenUtil;
    this.userService = userService;
    this.permissionService = permissionService;
  }

  @GetMapping("/get-applications/{jobId}")
  public String companies(@PathVariable("jobId") Long jobId, HttpServletRequest request, Model model){
    User user = null;
    Map<String, Object> principal = authenticationTokenUtil.getPrincipalFromToken(request);
    if (principal == null) {
      throw new PermissionDeniedException("You don't have permission to create job question");
    }
    user = userService.getUser(((Integer)principal.get("userId")).longValue()) ;
    Job job = jobService.getJob(jobId);
    if(!permissionService.isOwnerJob(user, job))
      throw new PermissionDeniedException("You do not have permission to manage job");

    model.addAttribute("user", user);
    model.addAttribute("job", job);
    return "application/applications";
  }
}
