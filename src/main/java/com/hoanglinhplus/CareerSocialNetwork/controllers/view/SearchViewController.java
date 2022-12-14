package com.hoanglinhplus.CareerSocialNetwork.controllers.view;

import com.hoanglinhplus.CareerSocialNetwork.dto.PageableDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.job.JobFilterDTO;
import com.hoanglinhplus.CareerSocialNetwork.models.*;
import com.hoanglinhplus.CareerSocialNetwork.services.CompanyService;
import com.hoanglinhplus.CareerSocialNetwork.services.JobService;
import com.hoanglinhplus.CareerSocialNetwork.services.TagService;
import com.hoanglinhplus.CareerSocialNetwork.services.UserService;
import com.hoanglinhplus.CareerSocialNetwork.utils.AuthenticationTokenUtil;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/search")
public class SearchViewController {
  private final UserService userService;
  private final TagService tagService;
  private final CompanyService companyService;
  private final JobService jobService;
  private final AuthenticationTokenUtil authenticationTokenUtil;
  public SearchViewController(UserService userService, TagService tagService, CompanyService companyService, JobService jobService, AuthenticationTokenUtil authenticationTokenUtil) {
    this.userService = userService;
    this.tagService = tagService;
    this.companyService = companyService;
    this.jobService = jobService;
    this.authenticationTokenUtil = authenticationTokenUtil;
  }
  @GetMapping
  public String getSearch(HttpServletRequest request, Model model) {
    List<Job> jobs = null;
    List<Skill> skills = jobService.getAllSkills();
    List<Tag> tags = tagService.getAllTags();
    List<WorkPlace> workPlaces = jobService.getAllWorkPlaces();
    List<Position> positions = jobService.getAllPositions();
    List<Company> companies = companyService.getAllCompanies();
    List<EmploymentType> employmentTypes = companyService.getAllEmploymentTypes();
    Map<String, Object> principal = authenticationTokenUtil.getPrincipalFromToken(request);
    User user = null;
    if (principal != null) {
      user = userService.getUser(((Integer)principal.get("userId")).longValue()) ;
//      jobs = jobService.getFollowedJobs(new PageableDTO(), user.getUserId());
    }
    else {
      Page<Job> jobPage = jobService.getJobs(new JobFilterDTO(), new PageableDTO());
//      jobs  = jobPage.getContent();
    }
    model.addAttribute("jobs", null);
    model.addAttribute("user", user);
    model.addAttribute("tags", tags);
    model.addAttribute("companies", companies);
    model.addAttribute("skills", skills);
    model.addAttribute("workPlaces", workPlaces);
    model.addAttribute("positions", positions);
    model.addAttribute("employmentTypes", employmentTypes);

    return "search/search";
  }
}
