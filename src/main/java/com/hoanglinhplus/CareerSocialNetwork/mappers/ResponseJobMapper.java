package com.hoanglinhplus.CareerSocialNetwork.mappers;

import com.hoanglinhplus.CareerSocialNetwork.dto.company.CompanyCreationDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.job.JobCreationDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.models.Company;
import com.hoanglinhplus.CareerSocialNetwork.models.Job;
import org.springframework.data.domain.Page;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class ResponseJobMapper {
  public static ResponseObjectDTO toDTO(Page<Job> jobPage){
    List<JobCreationDTO> usersDTO = jobPage.getContent().stream().map(JobMapper::toDTO).collect(Collectors.toList());
    Map<String, Object> responseData = new HashMap<>();
    responseData.put("users", usersDTO);
    responseData.put("totalPages", jobPage.getTotalPages());
    responseData.put("size", jobPage.getSize());
    responseData.put("totalElements", jobPage.getTotalElements());
    responseData.put("page", jobPage.getNumber());
    responseData.put("numberOfElements", jobPage.getNumberOfElements());
    return new ResponseObjectDTO("get all jobs successfully",responseData);
  }
}
