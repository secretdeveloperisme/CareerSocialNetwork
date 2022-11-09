package com.hoanglinhplus.CareerSocialNetwork.controllers.view;

import com.hoanglinhplus.CareerSocialNetwork.dto.stastistic.AdminStatistics;
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
  private final PostService postService;
  private final AuthenticationTokenUtil authenticationTokenUtil;
  private User user;
  private void loadAuthenticatedUser(HttpServletRequest request){
    Map<String, Object> principal = authenticationTokenUtil.getPrincipalFromToken(request);
    if (principal == null) {
      throw new PermissionDeniedException("You don't have permission access this site");
    }
    user = userService.getUser(((Integer)principal.get("userId")).longValue());
    if(!user.isAdmin())
      throw new PermissionDeniedException("You don't have permission access this site");
  }

  public AdminViewController(CompanyService companyService, UserService userService, TagService tagService, JobService jobService, ApplicationService applicationService, PostService postService, AuthenticationTokenUtil authenticationTokenUtil) {
    this.companyService = companyService;
    this.userService = userService;
    this.tagService = tagService;
    this.jobService = jobService;
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
  @GetMapping("/dashboard")
  public String dashboard(HttpServletRequest request, Model model){
    loadAuthenticatedUser(request);
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
  @GetMapping("/users")
  public String users(HttpServletRequest request, Model model){
    loadAuthenticatedUser(request);
    model.addAttribute("user", user);
    return "admin/users";
  }
  @GetMapping("/jobs")
  public String jobs(HttpServletRequest request, Model model){
    loadAuthenticatedUser(request);
    model.addAttribute("user", user);
    return "admin/jobs";
  }
  @GetMapping("/companies")
  public String companies(HttpServletRequest request, Model model){
    loadAuthenticatedUser(request);
    model.addAttribute("user", user);
    return "admin/companies";
  }
  @GetMapping("/posts")
  public String posts(HttpServletRequest request, Model model){
    loadAuthenticatedUser(request);
    model.addAttribute("user", user);
    return "admin/posts";
  }
  @GetMapping("/tags")
  public String tags(HttpServletRequest request, Model model){
    loadAuthenticatedUser(request);
    model.addAttribute("user", user);
    return "admin/tags";
  }
}
