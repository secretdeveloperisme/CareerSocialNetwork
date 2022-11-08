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
@RequestMapping("/company")
public class CompanyViewController {
  private final CompanyService companyService;
  private final AuthenticationTokenUtil authenticationTokenUtil;
  private final JobService jobService;
  private final UserService userService;
  private final PermissionService permissionService;

  public CompanyViewController(CompanyService companyService, AuthenticationTokenUtil authenticationTokenUtil, JobService jobService, UserService userService, PermissionService permissionService) {
    this.companyService = companyService;
    this.authenticationTokenUtil = authenticationTokenUtil;
    this.jobService = jobService;
    this.userService = userService;
    this.permissionService = permissionService;
  }

  @GetMapping("/create")
  public String createCompany(HttpServletRequest request, Model model){
    List<OrganizationSize> organizationSizeList = companyService.getOrganizationSizes();
    List<Industry> industries = companyService.getIndustries();
    Map<String, Object> principal = authenticationTokenUtil.getPrincipalFromToken(request);
    User user = null;
    if (principal != null) {
      user = userService.getUser(((Integer)principal.get("userId")).longValue()) ;
    }
    model.addAttribute("organizationSizes", organizationSizeList);
    model.addAttribute("industries", industries);
    model.addAttribute("user", user);
    return "company/create_company";
  }

  @GetMapping("/edit/{companyId}")
  public String editCompany(@PathVariable Long companyId, HttpServletRequest request, Model model){
    Company company = companyService.getCompany(companyId);
    List<OrganizationSize> organizationSizeList = companyService.getOrganizationSizes();
    List<Industry> industries = companyService.getIndustries();
    Map<String, Object> principal = authenticationTokenUtil.getPrincipalFromToken(request);
    User user = null;
    if (principal == null) {
      return "error/401";
    }
    user = userService.getUser(((Integer)principal.get("userId")).longValue()) ;
    if(!user.isAdmin()){
      if(!permissionService.isOwnerCompany(company)){
        return "error/401";
      }
    }
    model.addAttribute("company", company);
    model.addAttribute("organizationSizes", organizationSizeList);
    model.addAttribute("industries", industries);
    model.addAttribute("user", user);
    return "company/edit_company";
  }

  @GetMapping("/{companyId}")
  public String getCompany(HttpServletRequest request, Model model, @PathVariable("companyId") Long companyId) {
    Company company = companyService.getCompany(companyId);
    CompanyStatistics companyStatistics = companyService.getCompanyStatistics(companyId);
    List<Job> jobs = jobService.getJobs(JobFilterDTO.builder().companyId(companyId).build(),
      new PageableDTO()
      ).getContent();
    Map<String, Object> principal = authenticationTokenUtil.getPrincipalFromToken(request);
    User user = null;
    if (principal != null) {
      user = userService.getUser(((Integer)principal.get("userId")).longValue()) ;
    }
    model.addAttribute("company", company);
    model.addAttribute("user", user);
    model.addAttribute("jobs", jobs);
    model.addAttribute("isFollowed", companyService.isCurrentUserFollowed(companyId));
    model.addAttribute("companyStatistics", companyStatistics);
    return "company/get_company";
  }
  @GetMapping("/{companyId}/jobs")
  public String companies(@PathVariable("companyId") Long companyId,HttpServletRequest request, Model model){
    User user = null;
    Map<String, Object> principal = authenticationTokenUtil.getPrincipalFromToken(request);
    if (principal == null) {
      throw new PermissionDeniedException("You don't have permission to create job question");
    }
    user = userService.getUser(((Integer)principal.get("userId")).longValue()) ;
    Company company = companyService.getCompany(companyId);
    if(!user.isAdmin()){
      if(!permissionService.isOwnerCompany(company))
        throw new PermissionDeniedException("You do not have permission to manage company");
    }
    model.addAttribute("user", user);
    model.addAttribute("company", company);
    return "company/get_jobs";
  }

}
