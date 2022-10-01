package com.hoanglinhplus.CareerSocialNetwork.controllers.api;

import com.hoanglinhplus.CareerSocialNetwork.dto.company.FollowCompanyDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.services.FollowCompanyService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/follow-company")
public class FollowCompanyController {
  private final FollowCompanyService followCompanyService;

  public FollowCompanyController(FollowCompanyService followCompanyService) {
    this.followCompanyService = followCompanyService;
  }

  @PostMapping
  public ResponseEntity<ResponseObjectDTO> followCompany(@RequestBody FollowCompanyDTO followCompanyDTO){
    return followCompanyService.followCompany(followCompanyDTO);
  }

  @GetMapping("/have-follow-company")
  public ResponseEntity<ResponseObjectDTO> haveFollowCompany(@RequestParam Long companyId){
    return followCompanyService.haveFollowCompany(companyId);
  }

  @GetMapping("/get-number-of-follow-company")
  public ResponseEntity<ResponseObjectDTO> getNumberOfFollows(@RequestParam Long companyId){
    return followCompanyService.getNumberOfFollow(companyId);
  }
}
