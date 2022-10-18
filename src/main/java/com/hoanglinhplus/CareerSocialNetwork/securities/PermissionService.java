package com.hoanglinhplus.CareerSocialNetwork.securities;

import com.hoanglinhplus.CareerSocialNetwork.models.*;
import com.hoanglinhplus.CareerSocialNetwork.services.CompanyService;
import com.hoanglinhplus.CareerSocialNetwork.services.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

@Service
public class PermissionService {
  private final CompanyService companyService;
  private final JobService  jobService;
  private final MyUserDetailsService  myUserDetailsService;
  @Autowired
  public PermissionService(CompanyService companyService, JobService jobService, MyUserDetailsService myUserDetailsService) {
    this.companyService = companyService;
    this.jobService = jobService;
    this.myUserDetailsService = myUserDetailsService;
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
    return company.getCreatedUser().getUserId().equals(userId);
  }
  public boolean isOwnerCompany(Long companyId) {
    Long userId = myUserDetailsService.getCurrentUserId();
    Company company = companyService.getCompany(companyId);
    return company.getCreatedUser().getUserId().equals(userId);
  }


  public boolean isOwnerJob(Long userId, Long jobId) {
    Job job = jobService.getJob(jobId);
    return job.getCompany().getCreatedUser().getUserId().equals(userId);
  }
  public boolean isOwnerComment (Comment comment){
    Long userId = myUserDetailsService.getCurrentUserId();
    return comment.getUser().getUserId().equals(userId);
  }

  public boolean isOwnerAnswer (Answer answer){
    Long userId = myUserDetailsService.getCurrentUserId();
    return answer.getUserId().equals(userId);
  }
  public boolean isOwnerConversation(Conversation conversation) {
    Long userId = myUserDetailsService.getCurrentUserId();
    return conversation.getUser().getUserId().equals(userId);
  }
  public boolean isOwnerMessage(Message message) {
    Long userId = myUserDetailsService.getCurrentUserId();
    return message.getUser().getUserId().equals(userId);
  }
}
