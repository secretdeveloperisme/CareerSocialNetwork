package com.hoanglinhplus.CareerSocialNetwork.controllers.view;

import com.hoanglinhplus.CareerSocialNetwork.dto.PageableDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.job.JobFilterDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.stastistic.TagStatistics;
import com.hoanglinhplus.CareerSocialNetwork.models.*;
import com.hoanglinhplus.CareerSocialNetwork.securities.PermissionService;
import com.hoanglinhplus.CareerSocialNetwork.services.TagService;
import com.hoanglinhplus.CareerSocialNetwork.services.JobService;
import com.hoanglinhplus.CareerSocialNetwork.services.UserService;
import com.hoanglinhplus.CareerSocialNetwork.utils.AuthenticationTokenUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Collections;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/tag")
public class TagViewController {
  private final TagService tagService;
  private final AuthenticationTokenUtil authenticationTokenUtil;
  private final JobService jobService;
  private final UserService userService;
  private final PermissionService permissionService;

  public TagViewController(TagService tagService, AuthenticationTokenUtil authenticationTokenUtil, JobService jobService, UserService userService, PermissionService permissionService) {
    this.tagService = tagService;
    this.authenticationTokenUtil = authenticationTokenUtil;
    this.jobService = jobService;
    this.userService = userService;
    this.permissionService = permissionService;
  }

  @GetMapping("/{tagName}")
  public String getCompany(HttpServletRequest request, Model model, @PathVariable("tagName") String tagName) {
    Tag tag = tagService.getTag(tagName);
    TagStatistics tagStatistics = tagService.getTagStatistics(tag.getTagId());
    List<Job> jobs = jobService.getJobs(JobFilterDTO.builder().tagIds(Collections.singletonList(tag.getTagId())).build(),
      new PageableDTO()
      ).getContent();
    Map<String, Object> principal = authenticationTokenUtil.getPrincipalFromToken(request);
    User user = null;
    if (principal != null) {
      user = userService.getUser(((Integer)principal.get("userId")).longValue()) ;
    }
    model.addAttribute("tag", tag);
    model.addAttribute("user", user);
    model.addAttribute("jobs", jobs);
    model.addAttribute("isFollowed", tagService.isCurrentUserFollowed(tag.getTagId()));
    model.addAttribute("tagStatistics", tagStatistics);
    return "tag/get_tag";
  }

}
