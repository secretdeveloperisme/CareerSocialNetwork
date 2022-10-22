package com.hoanglinhplus.CareerSocialNetwork.controllers.view;

import com.hoanglinhplus.CareerSocialNetwork.dto.PageableDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.job.JobFilterDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.stastistic.CompanyStatistics;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.PermissionDeniedException;
import com.hoanglinhplus.CareerSocialNetwork.models.*;
import com.hoanglinhplus.CareerSocialNetwork.securities.PermissionService;
import com.hoanglinhplus.CareerSocialNetwork.services.CompanyService;
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
@RequestMapping("/user")
public class UserViewController {
  private final CompanyService companyService;
  private final AuthenticationTokenUtil authenticationTokenUtil;
  private final JobService jobService;
  private final UserService userService;
  private final PermissionService permissionService;

  public UserViewController(CompanyService companyService, AuthenticationTokenUtil authenticationTokenUtil, JobService jobService, UserService userService, PermissionService permissionService) {
    this.companyService = companyService;
    this.authenticationTokenUtil = authenticationTokenUtil;
    this.jobService = jobService;
    this.userService = userService;
    this.permissionService = permissionService;
  }

  @GetMapping("/{userId}")
  public String getCompany(HttpServletRequest request, Model model, @PathVariable("userId") Long userId) {
    User targetUser = userService.getUser(userId);
    Map<String, Object> principal = authenticationTokenUtil.getPrincipalFromToken(request);
    User user = null;
    if (principal != null) {
      user = userService.getUser(((Integer)principal.get("userId")).longValue()) ;
    }
    model.addAttribute("user", user);
    model.addAttribute("targetUser", targetUser);
    return "user/get_user";
  }

}
