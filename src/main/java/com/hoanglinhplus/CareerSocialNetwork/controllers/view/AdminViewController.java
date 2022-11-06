package com.hoanglinhplus.CareerSocialNetwork.controllers.view;

import com.hoanglinhplus.CareerSocialNetwork.dto.stastistic.AdminStatistics;
import com.hoanglinhplus.CareerSocialNetwork.dto.stastistic.MeStatistics;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.PermissionDeniedException;
import com.hoanglinhplus.CareerSocialNetwork.models.User;
import com.hoanglinhplus.CareerSocialNetwork.models.projection.PopularCompanyInfo;
import com.hoanglinhplus.CareerSocialNetwork.models.projection.PopularJobInfo;
import com.hoanglinhplus.CareerSocialNetwork.models.projection.PopularPostInfo;
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
@RequestMapping("/admin")
public class AdminViewController {
  private final CompanyService companyService;
  private final UserService userService;
  private final TagService tagService;
  private final JobService jobService;
  private final ApplicationService applicationService;
  private final PostService postService;
  private final AuthenticationTokenUtil authenticationTokenUtil;

  public AdminViewController(CompanyService companyService, UserService userService, TagService tagService, JobService jobService, ApplicationService applicationService, PostService postService, AuthenticationTokenUtil authenticationTokenUtil) {
    this.companyService = companyService;
    this.userService = userService;
    this.tagService = tagService;
    this.jobService = jobService;
    this.applicationService = applicationService;
    this.postService = postService;
    this.authenticationTokenUtil = authenticationTokenUtil;
  }
  public AdminStatistics getStatistics(){
    long amountOfCompanies = companyService.getAmountOfAllCompanies();
    long amountOfJobs = jobService.getAmountOfAllJobs();
    long amountOfUser = userService.getAmountOfAllUsers();
    long amountOfTags = tagService.getAmountOfAllTags();
    long amountOfPosts = postService.getAmountOfAllPosts();
    return new AdminStatistics(amountOfCompanies,amountOfJobs, amountOfUser, amountOfPosts, amountOfTags);
  }
  @GetMapping
  public String dashboard(HttpServletRequest request, Model model){
    User user = null;
    Map<String, Object> principal = authenticationTokenUtil.getPrincipalFromToken(request);
    if (principal == null) {
      throw new PermissionDeniedException("You don't have permission access this site");
    }
    user = userService.getUser(((Integer)principal.get("userId")).longValue());
    if(!user.isAdmin())
      throw new PermissionDeniedException("You don't have permission access this site");
    AdminStatistics adminStatistics = getStatistics();
    List<PopularCompanyInfo> popularCompanyInfos = companyService.getPopularCompanies();
    List<PopularJobInfo> popularJobInfos = jobService.getPopularJobsInfo();
    List<PopularPostInfo> popularPostInfos = postService.getPopularPostsInfo();
    model.addAttribute("adminStatistics", adminStatistics);
    model.addAttribute("popularCompanyInfos", popularCompanyInfos);
    model.addAttribute("popularJobInfos", popularJobInfos);
    model.addAttribute("popularPostInfos", popularPostInfos);
    model.addAttribute("user", user);
    return "admin/dashboard";
  }
//  @GetMapping("/post")
//  public String posts(HttpServletRequest request, Model model){
//    User user = null;
//    Map<String, Object> principal = authenticationTokenUtil.getPrincipalFromToken(request);
//    if (principal == null) {
//      throw new PermissionDeniedException("You don't have permission to watch posts");
//    }
//    user = userService.getUser(((Integer)principal.get("userId")).longValue()) ;
//    MeStatistics meStatistics = getMeStatistics(user);
//    model.addAttribute("meStatistics", meStatistics);
//    model.addAttribute("user", user);
//    return "me/posts";
//  }
//  @GetMapping("/application")
//  public String applications(HttpServletRequest request, Model model){
//    User user = null;
//    Map<String, Object> principal = authenticationTokenUtil.getPrincipalFromToken(request);
//    if (principal == null) {
//      throw new PermissionDeniedException("You don't have permission to watch application");
//    }
//    user = userService.getUser(((Integer)principal.get("userId")).longValue()) ;
//    MeStatistics meStatistics = getMeStatistics(user);
//    model.addAttribute("meStatistics", meStatistics);
//    model.addAttribute("user", user);
//    return "me/my_applications";
//  }
//  @GetMapping("/tags")
//  public String getFollowedTags(HttpServletRequest request, Model model){
//    User user = null;
//    Map<String, Object> principal = authenticationTokenUtil.getPrincipalFromToken(request);
//    if (principal == null) {
//      throw new PermissionDeniedException("You don't have permission to watch tag ");
//    }
//    user = userService.getUser(((Integer)principal.get("userId")).longValue()) ;
//
//    List<Tag> followedTags = user.getTags();
//    MeStatistics meStatistics = getMeStatistics(user);
//    model.addAttribute("meStatistics", meStatistics);
//    model.addAttribute("user", user);
//    model.addAttribute("followedTags", followedTags);
//    return "me/tags";
//  }
//
//  @GetMapping("/following_companies")
//  public String getFollowedCompanies(HttpServletRequest request, Model model){
//    User user = null;
//    Map<String, Object> principal = authenticationTokenUtil.getPrincipalFromToken(request);
//    if (principal == null) {
//      throw new PermissionDeniedException("You don't have permission to watch tag ");
//    }
//    user = userService.getUser(((Integer)principal.get("userId")).longValue()) ;
//    List<Company> followedCompanies = user.getFollowCompanies();
//    MeStatistics meStatistics = getMeStatistics(user);
//    model.addAttribute("meStatistics", meStatistics);
//    model.addAttribute("user", user);
//    model.addAttribute("followedCompanies", followedCompanies);
//    return "me/follow_companies";
//  }
//  @GetMapping("/following_users")
//  public String getFollowedUsers(HttpServletRequest request, Model model){
//    User user = null;
//    Map<String, Object> principal = authenticationTokenUtil.getPrincipalFromToken(request);
//    if (principal == null) {
//      throw new PermissionDeniedException("You don't have permission to watch tag ");
//    }
//    user = userService.getUser(((Integer)principal.get("userId")).longValue()) ;
//    List<User> followedUsers = user.getFollowed_users();
//    MeStatistics meStatistics = getMeStatistics(user);
//    model.addAttribute("meStatistics", meStatistics);
//    model.addAttribute("user", user);
//    model.addAttribute("followedUsers", followedUsers);
//    return "me/follow_users";
//  }
//  @GetMapping("/company/trash")
//  public String companiesTrash(HttpServletRequest request, Model model){
//    User user = null;
//    Map<String, Object> principal = authenticationTokenUtil.getPrincipalFromToken(request);
//    if (principal == null) {
//      throw new PermissionDeniedException("You don't have permission to watch companies");
//    }
//    user = userService.getUser(((Integer)principal.get("userId")).longValue()) ;
//    MeStatistics meStatistics = getMeStatistics(user);
//    model.addAttribute("meStatistics", meStatistics);
//    model.addAttribute("user", user);
//    return "me/companies_trash";
//  }
}
