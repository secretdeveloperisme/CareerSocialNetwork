package com.hoanglinhplus.CareerSocialNetwork.controllers.view;

import com.hoanglinhplus.CareerSocialNetwork.dto.PageableDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.tag.TagDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.company.CompanyCreationDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.job.JobFilterDTO;
import com.hoanglinhplus.CareerSocialNetwork.models.Job;
import com.hoanglinhplus.CareerSocialNetwork.models.User;
import com.hoanglinhplus.CareerSocialNetwork.services.CompanyService;
import com.hoanglinhplus.CareerSocialNetwork.services.JobService;
import com.hoanglinhplus.CareerSocialNetwork.services.TagService;
import com.hoanglinhplus.CareerSocialNetwork.services.UserService;
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
  private final CompanyService companyService;
  private final JobService jobService;
  private final AuthenticationTokenUtil authenticationTokenUtil;
  public CommonController(UserService userService, TagService tagService, CompanyService companyService, JobService jobService, AuthenticationTokenUtil authenticationTokenUtil) {
    this.userService = userService;
    this.tagService = tagService;
    this.companyService = companyService;
    this.jobService = jobService;
    this.authenticationTokenUtil = authenticationTokenUtil;
  }
  @GetMapping("/")
  public String getHome(HttpServletRequest request, Model model) {
    Page<Job> jobPage = jobService.getJobs(new JobFilterDTO(), new PageableDTO());
    List<Job> jobs = jobPage.getContent();
    List<Job> popularJobs = jobService.getPopularJobs();
    List<TagDTO> popTags = tagService.getPopularTags();
    List<CompanyCreationDTO> popCompanies = companyService.getPopularCompanies();
    Map<String, Object> principal = authenticationTokenUtil.getPrincipalFromToken(request);
    User user = null;
    if (principal != null) {
      user = userService.getUser(((Integer)principal.get("userId")).longValue()) ;
    }
    model.addAttribute("jobs", jobs);
    model.addAttribute("tags", popTags);
    model.addAttribute("companies", popCompanies);
    model.addAttribute("popularJobs", popularJobs);
    model.addAttribute("user", user);
    return "site/home";
  }
}
