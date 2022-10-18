package com.hoanglinhplus.CareerSocialNetwork.controllers.view;

import com.hoanglinhplus.CareerSocialNetwork.exceptions.PermissionDeniedException;
import com.hoanglinhplus.CareerSocialNetwork.models.User;
import com.hoanglinhplus.CareerSocialNetwork.services.ApplicationService;
import com.hoanglinhplus.CareerSocialNetwork.services.CompanyService;
import com.hoanglinhplus.CareerSocialNetwork.services.TagService;
import com.hoanglinhplus.CareerSocialNetwork.services.UserService;
import com.hoanglinhplus.CareerSocialNetwork.utils.AuthenticationTokenUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@RequestMapping("/me")
public class MeViewController {
  private final CompanyService companyService;
  private final UserService userService;
  private final TagService tagService;
  private final ApplicationService applicationService;
  private final AuthenticationTokenUtil authenticationTokenUtil;

  public MeViewController(CompanyService companyService, UserService userService, TagService tagService, ApplicationService applicationService, AuthenticationTokenUtil authenticationTokenUtil) {
    this.companyService = companyService;
    this.userService = userService;
    this.tagService = tagService;
    this.applicationService = applicationService;
    this.authenticationTokenUtil = authenticationTokenUtil;
  }

  @GetMapping("/company")
  public String companies(HttpServletRequest request, Model model){
    User user = null;
    Map<String, Object> principal = authenticationTokenUtil.getPrincipalFromToken(request);
    if (principal == null) {
      throw new PermissionDeniedException("You don't have permission to create job question");
    }
    user = userService.getUser(((Integer)principal.get("userId")).longValue()) ;
    long amountOfCompanies = companyService.getAmountOfCompanies(user.getUserId(),false);
    long amountOfDeletedCompanies = companyService.getAmountOfCompanies(user.getUserId(),true);
    long amountOfFollowedCompanies = companyService.getAmountOfFollowedCompanies(user.getUserId());
    long amountOfFollowedTags = tagService.getAmountOfTagFollow(user.getUserId());
    long amountOfApplications = applicationService.getNumberOfUserApplications(user.getUserId());
    model.addAttribute("user", user);
    model.addAttribute("amountOfCompanies", amountOfCompanies);
    model.addAttribute("amountOfFollowedTags", amountOfFollowedTags);
    model.addAttribute("amountOfFollowedCompanies", amountOfFollowedCompanies);
    model.addAttribute("amountOfDeletedCompanies", amountOfDeletedCompanies);
    model.addAttribute("amountOfApplications", amountOfApplications);
    return "me/companies";
  }
}
