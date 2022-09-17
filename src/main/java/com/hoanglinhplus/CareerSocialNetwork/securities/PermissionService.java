package com.hoanglinhplus.CareerSocialNetwork.securities;

import com.hoanglinhplus.CareerSocialNetwork.models.Company;
import com.hoanglinhplus.CareerSocialNetwork.models.Job;
import com.hoanglinhplus.CareerSocialNetwork.services.CompanyService;
import com.hoanglinhplus.CareerSocialNetwork.services.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

@Service
public class PermissionService {
  private final CompanyService companyService;
  private final JobService  jobService;
  @Autowired
  public PermissionService(CompanyService companyService, JobService jobService) {
    this.companyService = companyService;
    this.jobService = jobService;
  }

  public boolean isAdmin(){
    return SecurityContextHolder.getContext().getAuthentication().getAuthorities().stream()
      .map(GrantedAuthority::getAuthority)
      .anyMatch(role -> role.equals("ADMIN"));
  }
  public boolean isUser() {
    return SecurityContextHolder.getContext().getAuthentication().getAuthorities().stream()
     .map(GrantedAuthority::getAuthority)
     .anyMatch(role -> role.equals("USER"));
  }
  public boolean isOwnerCompany(Long userId, Long companyId) {
    Company company = companyService.getCompany(companyId);
    return company.getCreatedUser().getUserId().longValue() == userId.longValue();
  }

  public boolean isOwnerJob(Long userId, Long jobId) {
    Job job = jobService.getJob(jobId);
    return job.getCompany().getCreatedUser().getUserId().longValue() == userId.longValue();
  }
}
