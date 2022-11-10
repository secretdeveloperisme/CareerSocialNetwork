package com.hoanglinhplus.CareerSocialNetwork.services;

import com.hoanglinhplus.CareerSocialNetwork.dto.company.FollowCompanyDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.models.Company;
import com.hoanglinhplus.CareerSocialNetwork.models.User;
import com.hoanglinhplus.CareerSocialNetwork.repositories.UserRepository;
import com.hoanglinhplus.CareerSocialNetwork.securities.MyUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

;

@Service
public class FollowCompanyService {
  private final UserRepository userRepository;
  private final UserService userService;
  private final CompanyService companyService;
  private final MyUserDetailsService myUserDetailsService;
  @Autowired
  public FollowCompanyService(UserRepository userRepository, UserService userService, CompanyService companyService, MyUserDetailsService myUserDetailsService) {
    this.userRepository = userRepository;
    this.userService = userService;
    this.companyService = companyService;
    this.myUserDetailsService = myUserDetailsService;
  }


  public ResponseEntity<ResponseObjectDTO> followCompany(FollowCompanyDTO followCompanyDTO){
    Long currentUserId = myUserDetailsService.getCurrentUserId();
    User user = userService.getUser(currentUserId);
    List<Company> followCompanies = user.getFollowCompanies();
    Map<String, Object> responseData = new HashMap<>();
    Company followCompany = null;
    for (Company company : followCompanies) {
      if(company.getCompanyId().equals(followCompanyDTO.getCompanyId())){
        followCompany = company;
      }
    }
    if(followCompany != null){
      followCompanies.remove(followCompany);
      responseData.put("follow", false);
    }
    else{
      followCompanies.add(Company.builder().companyId(followCompanyDTO.getCompanyId()).build());
      responseData.put("follow", true);
    }
    user.setFollowCompanies(followCompanies);
    userRepository.save(user);
    responseData.put("amountOfFollowers", companyService.getAmountOfFollowers(followCompanyDTO.getCompanyId()));
    return ResponseEntity.ok(new ResponseObjectDTO("Follow Company Successfully",responseData));
  }
  public ResponseEntity<ResponseObjectDTO> haveFollowCompany(Long companyId){
    Long currentUserId = myUserDetailsService.getCurrentUserId();
    User user = userService.getUser(currentUserId);
    List<Company> followCompanies = user.getFollowCompanies();
    Map<String, Object> responseData = new HashMap<>();
    Company followCompany = null;
    for (Company company : followCompanies) {
      if(company.getCompanyId().equals(companyId)){
        followCompany = company;
      }
    }
    if(followCompany != null){
      responseData.put("follow", true);
    }
    else{
      responseData.put("follow", false);
    }
    return ResponseEntity.ok(new ResponseObjectDTO("Get Have Follow Successfully",responseData));
  }
  public ResponseEntity<ResponseObjectDTO> getNumberOfFollow(Long companyId){
    Company company = companyService.getCompany(companyId);
    Map<String, Object> responseData = new HashMap<>();
    responseData.put("numberOfFollows", company.getFollowCompanies().size());
    return ResponseEntity.ok(new ResponseObjectDTO("Get Number Of Follows Successfully",responseData));
  }
}
