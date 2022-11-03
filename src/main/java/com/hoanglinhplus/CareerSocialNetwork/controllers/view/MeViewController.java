package com.hoanglinhplus.CareerSocialNetwork.controllers.view;

import com.hoanglinhplus.CareerSocialNetwork.dto.stastistic.MeStatistics;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.PermissionDeniedException;
import com.hoanglinhplus.CareerSocialNetwork.models.Company;
import com.hoanglinhplus.CareerSocialNetwork.models.Tag;
import com.hoanglinhplus.CareerSocialNetwork.models.User;
import com.hoanglinhplus.CareerSocialNetwork.services.*;
import com.hoanglinhplus.CareerSocialNetwork.utils.AuthenticationTokenUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/me")
public class MeViewController {
  private final CompanyService companyService;
  private final UserService userService;
  private final TagService tagService;
  private final ApplicationService applicationService;
  private final PostService postService;
  private final AuthenticationTokenUtil authenticationTokenUtil;

  public MeViewController(CompanyService companyService, UserService userService, TagService tagService, ApplicationService applicationService, PostService postService, AuthenticationTokenUtil authenticationTokenUtil) {
    this.companyService = companyService;
    this.userService = userService;
    this.tagService = tagService;
    this.applicationService = applicationService;
    this.postService = postService;
    this.authenticationTokenUtil = authenticationTokenUtil;
  }
  public MeStatistics getMeStatistics(User user){
    long amountOfCompanies = companyService.getAmountOfCompanies(user.getUserId(),false);
    long amountOfDeletedCompanies = companyService.getAmountOfCompanies(user.getUserId(),true);
    long amountOfFollowedCompanies = companyService.getAmountOfFollowedCompanies(user.getUserId());
    long amountOfFollowedUsers = userService.getAmountOfFollowedUsers(user.getUserId());
    long amountOfFollowedTags = tagService.getAmountOfTagFollow(user.getUserId());
    long amountOfApplications = applicationService.getNumberOfUserApplications(user.getUserId());
    long amountOfPosts = postService.getAmountOfPosts(user.getUserId(), false);
    return new MeStatistics(amountOfCompanies, amountOfDeletedCompanies, amountOfFollowedCompanies,amountOfFollowedUsers,amountOfFollowedTags,
      amountOfApplications,amountOfPosts);
  }
  @GetMapping("/company")
  public String companies(HttpServletRequest request, Model model){
    User user = null;
    Map<String, Object> principal = authenticationTokenUtil.getPrincipalFromToken(request);
    if (principal == null) {
      throw new PermissionDeniedException("You don't have permission to watch companies");
    }
    user = userService.getUser(((Integer)principal.get("userId")).longValue()) ;
    MeStatistics meStatistics = getMeStatistics(user);
    model.addAttribute("meStatistics", meStatistics);
    model.addAttribute("user", user);
    return "me/companies";
  }
  @GetMapping("/post")
  public String posts(HttpServletRequest request, Model model){
    User user = null;
    Map<String, Object> principal = authenticationTokenUtil.getPrincipalFromToken(request);
    if (principal == null) {
      throw new PermissionDeniedException("You don't have permission to watch posts");
    }
    user = userService.getUser(((Integer)principal.get("userId")).longValue()) ;
    MeStatistics meStatistics = getMeStatistics(user);
    model.addAttribute("meStatistics", meStatistics);
    model.addAttribute("user", user);
    return "me/posts";
  }
  @GetMapping("/application")
  public String applications(HttpServletRequest request, Model model){
    User user = null;
    Map<String, Object> principal = authenticationTokenUtil.getPrincipalFromToken(request);
    if (principal == null) {
      throw new PermissionDeniedException("You don't have permission to watch application");
    }
    user = userService.getUser(((Integer)principal.get("userId")).longValue()) ;
    MeStatistics meStatistics = getMeStatistics(user);
    model.addAttribute("meStatistics", meStatistics);
    model.addAttribute("user", user);
    return "me/my_applications";
  }
  @GetMapping("/tags")
  public String getFollowedTags(HttpServletRequest request, Model model){
    User user = null;
    Map<String, Object> principal = authenticationTokenUtil.getPrincipalFromToken(request);
    if (principal == null) {
      throw new PermissionDeniedException("You don't have permission to watch tag ");
    }
    user = userService.getUser(((Integer)principal.get("userId")).longValue()) ;

    List<Tag> followedTags = user.getTags();
    MeStatistics meStatistics = getMeStatistics(user);
    model.addAttribute("meStatistics", meStatistics);
    model.addAttribute("user", user);
    model.addAttribute("followedTags", followedTags);
    return "me/tags";
  }

  @GetMapping("/following_companies")
  public String getFollowedCompanies(HttpServletRequest request, Model model){
    User user = null;
    Map<String, Object> principal = authenticationTokenUtil.getPrincipalFromToken(request);
    if (principal == null) {
      throw new PermissionDeniedException("You don't have permission to watch tag ");
    }
    user = userService.getUser(((Integer)principal.get("userId")).longValue()) ;
    List<Company> followedCompanies = user.getFollowCompanies();
    MeStatistics meStatistics = getMeStatistics(user);
    model.addAttribute("meStatistics", meStatistics);
    model.addAttribute("user", user);
    model.addAttribute("followedCompanies", followedCompanies);
    return "me/follow_companies";
  }
  @GetMapping("/following_users")
  public String getFollowedUsers(HttpServletRequest request, Model model){
    User user = null;
    Map<String, Object> principal = authenticationTokenUtil.getPrincipalFromToken(request);
    if (principal == null) {
      throw new PermissionDeniedException("You don't have permission to watch tag ");
    }
    user = userService.getUser(((Integer)principal.get("userId")).longValue()) ;
    List<User> followedUsers = user.getFollowed_users();
    MeStatistics meStatistics = getMeStatistics(user);
    model.addAttribute("meStatistics", meStatistics);
    model.addAttribute("user", user);
    model.addAttribute("followedUsers", followedUsers);
    return "me/follow_users";
  }
  @GetMapping("/company/trash")
  public String companiesTrash(HttpServletRequest request, Model model){
    User user = null;
    Map<String, Object> principal = authenticationTokenUtil.getPrincipalFromToken(request);
    if (principal == null) {
      throw new PermissionDeniedException("You don't have permission to watch companies");
    }
    user = userService.getUser(((Integer)principal.get("userId")).longValue()) ;
    MeStatistics meStatistics = getMeStatistics(user);
    model.addAttribute("meStatistics", meStatistics);
    model.addAttribute("user", user);
    return "me/companies_trash";
  }
}
