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
  private final MyUserDetailsService  myUserDetailsService;
  @Autowired
  public PermissionService(MyUserDetailsService myUserDetailsService) {
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

  public boolean isOwnerCompany(Company company) {
    Long userId = myUserDetailsService.getCurrentUserId();
    return company.getCreatedUser().getUserId().equals(userId);
  }

  public boolean isOwnerJob(User user, Job job) {
    return job.getCompany().getCreatedUser().getUserId().equals(user.getUserId());
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
  public boolean isOwnerEducation(Education education) {
    Long userId = myUserDetailsService.getCurrentUserId();
    return education.getUser().getUserId().equals(userId);
  }
  public boolean isOwnerPost(Post post) {
    Long userId = myUserDetailsService.getCurrentUserId();
    return post.getCreatedUser().getUserId().equals(userId);
  }
  public boolean isOwnerPost(Post post, User user) {
    Long userId = user.getUserId();
    return post.getCreatedUser().getUserId().equals(userId);
  }

}
