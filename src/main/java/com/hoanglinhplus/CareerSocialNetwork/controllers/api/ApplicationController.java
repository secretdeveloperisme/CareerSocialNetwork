package com.hoanglinhplus.CareerSocialNetwork.controllers.api;

import com.hoanglinhplus.CareerSocialNetwork.dto.job.ApplicationDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.job.ApplicationInfoDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.services.ApplicationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/application")
public class ApplicationController {
  private final ApplicationService applicationService;

  @Autowired
  public ApplicationController(ApplicationService applicationService) {
    this.applicationService = applicationService;
  }

  @PostMapping
  public ResponseEntity<ResponseObjectDTO> apply(@RequestBody ApplicationDTO applicationDTO){
    return applicationService.responseApply(applicationDTO);
  }
  @PutMapping
  public ResponseEntity<ResponseObjectDTO> updateStatus(@RequestBody ApplicationDTO applicationDTO){
    return applicationService.responseUpdateStatus(applicationDTO);
  }
  @GetMapping("/get-number-of-applications")
  public ResponseEntity<ResponseObjectDTO> getNumberOfApplications(Long jobId){
    return applicationService.responseGetNumberOfApplications(jobId);
  }

  @GetMapping("/get-job-applications")
  public ResponseEntity<List<ApplicationInfoDTO>> getJobApplications(ApplicationDTO applicationDTO){
    return applicationService.responseGetJobApplication(applicationDTO);
  }
  @GetMapping("/have-application")
  public ResponseEntity<ResponseObjectDTO> haveApplication(Long jobId){
    return applicationService.haveApplication(jobId);
  }

}
