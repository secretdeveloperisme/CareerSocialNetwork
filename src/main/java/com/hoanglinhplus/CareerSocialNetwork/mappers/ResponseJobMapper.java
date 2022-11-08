package com.hoanglinhplus.CareerSocialNetwork.mappers;

import com.hoanglinhplus.CareerSocialNetwork.dto.job.JobCreationDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseDataDTO;
import com.hoanglinhplus.CareerSocialNetwork.models.Job;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.stream.Collectors;

public class ResponseJobMapper {
  public static ResponseDataDTO<JobCreationDTO> toDTO(Page<Job> jobPage){
    List<JobCreationDTO> jobCreationDTOS = jobPage.getContent().stream().map(JobMapper::toDTO).collect(Collectors.toList());
    ResponseDataDTO<JobCreationDTO> responseData =
      new ResponseDataDTO<>("get all jobs successfully", jobCreationDTOS,(long) jobPage.getTotalPages(), jobPage.getTotalElements());
    return responseData;
  }
}
