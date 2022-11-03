package com.hoanglinhplus.CareerSocialNetwork.controllers.view;

import com.hoanglinhplus.CareerSocialNetwork.dto.PageableDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.post.PostFilterDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.tag.TagDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.company.CompanyCreationDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.job.JobFilterDTO;
import com.hoanglinhplus.CareerSocialNetwork.models.Job;
import com.hoanglinhplus.CareerSocialNetwork.models.Post;
import com.hoanglinhplus.CareerSocialNetwork.models.User;
import com.hoanglinhplus.CareerSocialNetwork.services.*;
import com.hoanglinhplus.CareerSocialNetwork.utils.AuthenticationTokenUtil;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
public class CommonController {
  private final UserService userService;
  private final TagService tagService;
  private final PostService postService;
  private final CompanyService companyService;
  private final JobService jobService;
  private final AuthenticationTokenUtil authenticationTokenUtil;
  public CommonController(UserService userService, TagService tagService, PostService postService, CompanyService companyService, JobService jobService, AuthenticationTokenUtil authenticationTokenUtil) {
    this.userService = userService;
    this.tagService = tagService;
    this.postService = postService;
    this.companyService = companyService;
    this.jobService = jobService;
    this.authenticationTokenUtil = authenticationTokenUtil;
  }
  @GetMapping("/")
  public String getHome(HttpServletRequest request, Model model) {

    List<Job> jobs;
    List<Job> popularJobs = jobService.getPopularJobs();
    List<TagDTO> popTags = tagService.getPopularTags();
    List<CompanyCreationDTO> popCompanies = companyService.getPopularCompanies();
    Map<String, Object> principal = authenticationTokenUtil.getPrincipalFromToken(request);
    User user = null;
    if (principal != null) {
      user = userService.getUser(((Integer)principal.get("userId")).longValue()) ;
      jobs = jobService.getFollowedJobs(new PageableDTO(), user.getUserId());
    }
    else {
      Page<Job> jobPage = jobService.getJobs(new JobFilterDTO(), new PageableDTO());
      jobs = jobPage.getContent();
    }
    model.addAttribute("jobs", jobs);
    model.addAttribute("tags", popTags);
    model.addAttribute("companies", popCompanies);
    model.addAttribute("popularJobs", popularJobs);
    model.addAttribute("user", user);
    return "site/home";
  }
  @GetMapping("/forum")
  public String getForum(HttpServletRequest request, Model model) {
    List<Post> posts;
    List<Post> popularPosts = postService.getPopularPosts();
    List<TagDTO> popTags = tagService.getPopularTags();
    List<CompanyCreationDTO> popCompanies = companyService.getPopularCompanies();
    Map<String, Object> principal = authenticationTokenUtil.getPrincipalFromToken(request);
    User user = null;
    if (principal != null) {
      user = userService.getUser(((Integer)principal.get("userId")).longValue()) ;
      posts = postService.getFollowedPosts(new PageableDTO(), user.getUserId());
    }
    else {
      Page<Post> jobPage = postService.getPosts(new PostFilterDTO(), new PageableDTO());
      posts = jobPage.getContent();
    }
    model.addAttribute("posts", posts);
    model.addAttribute("tags", popTags);
    model.addAttribute("companies", popCompanies);
    model.addAttribute("popularPosts", popularPosts);
    model.addAttribute("user", user);
    return "site/forum";
  }
}
