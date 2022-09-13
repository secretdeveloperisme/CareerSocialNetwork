package com.hoanglinhplus.CareerSocialNetwork.controllers;


import com.hoanglinhplus.CareerSocialNetwork.dto.PageableDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.job.JobCreationDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.job.JobFilterDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.services.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import java.util.List;
import java.util.Map;


@RestController
@RequestMapping("/job")
@Validated
public class JobController {
  private final JobService jobService;

  @Autowired
  JobController(JobService jobService){
    this.jobService = jobService;
  }
  @PreAuthorize("hasAuthority('USER') or hasAuthority('ADMIN')")
  @GetMapping("/get-all-jobs")
  public ResponseEntity<?> getAllJobs(
    @Valid JobFilterDTO jobFilterDTO, @Valid PageableDTO pageableDTO
  ){
    return jobService.getJobs(jobFilterDTO, pageableDTO);
  }

  @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
  @GetMapping("/get-job")
  public ResponseEntity<ResponseObjectDTO> getJob(
    @RequestParam @NotNull Long id){
    return jobService.getJob(id);
  }
  @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
  @PostMapping(produces = MediaType.APPLICATION_JSON_VALUE)
  public ResponseEntity<ResponseObjectDTO> createCompany(@RequestBody @Valid JobCreationDTO jobCreationDTO){
    return jobService.createJob(jobCreationDTO);
  }
  @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
  @PutMapping(produces = MediaType.APPLICATION_JSON_VALUE)
  public ResponseEntity<ResponseObjectDTO> updateCompany(@RequestBody @Valid JobCreationDTO jobCreationDTO){
    return jobService.updateJob(jobCreationDTO);
  }
  @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
  @DeleteMapping(produces = MediaType.APPLICATION_JSON_VALUE)
  public ResponseEntity<ResponseObjectDTO> deleteJob(@RequestBody @NotNull Map<String, Long> params){
    return jobService.deleteJob(params.get("jobId"));
  }
  @PreAuthorize("hasAuthority('ADMIN')")
  @DeleteMapping(path = "/many",produces = MediaType.APPLICATION_JSON_VALUE)
  public ResponseEntity<ResponseObjectDTO> deleteJobs(@RequestBody List<Long> ids) {
    return jobService.deleteJobs(ids);
  }

}