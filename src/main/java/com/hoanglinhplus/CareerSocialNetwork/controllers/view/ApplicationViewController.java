package com.hoanglinhplus.CareerSocialNetwork.controllers.view;

import com.hoanglinhplus.CareerSocialNetwork.dto.job.ApplicationDTO;
import com.hoanglinhplus.CareerSocialNetwork.services.ApplicationService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@RequestMapping("/application")
public class ApplicationViewController {
  private final ApplicationService applicationService;

  public ApplicationViewController(ApplicationService applicationService) {
    this.applicationService = applicationService;
  }

  @PostMapping
  public String apply(@RequestParam Long jobId){
    Map<String, Object> data = applicationService.apply(ApplicationDTO.builder().jobId(jobId).build());
    return "";
  }
}
