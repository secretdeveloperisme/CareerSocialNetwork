package com.hoanglinhplus.CareerSocialNetwork.controllers;

import com.hoanglinhplus.CareerSocialNetwork.dto.job.ApplicationDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.services.ApplicationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/application")
public class ApplicationController {
  private final ApplicationService applicationService;

  @Autowired
  public ApplicationController(ApplicationService applicationService) {
    this.applicationService = applicationService;
  }

  @PostMapping
  public ResponseEntity<ResponseObjectDTO> apply(@RequestBody ApplicationDTO applicationDTO){
    return applicationService.apply(applicationDTO);
  }

  @GetMapping("/get-number-of-applications")
  public ResponseEntity<ResponseObjectDTO> getNumberOfApplications(Long jobId){
    return applicationService.getNumberOfApplications(jobId);
  }

  @GetMapping("/have-application")
  public ResponseEntity<ResponseObjectDTO> haveApplication(Long jobId){
    return applicationService.haveApplication(jobId);
  }

}
