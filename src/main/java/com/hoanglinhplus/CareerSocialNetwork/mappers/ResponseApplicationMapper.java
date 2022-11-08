package com.hoanglinhplus.CareerSocialNetwork.mappers;

import com.hoanglinhplus.CareerSocialNetwork.dto.job.ApplicationInfoDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseDataDTO;
import com.hoanglinhplus.CareerSocialNetwork.models.Application;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class ResponseApplicationMapper {
  public static ResponseDataDTO<ApplicationInfoDTO> toDTO(Page<Application> companyPage){
    List<ApplicationInfoDTO> applicationInfoDTOS = companyPage.getContent().stream()
      .map(ApplicationMapper::toInfoDTO).collect(Collectors.toList());
    ResponseDataDTO<ApplicationInfoDTO> responseData = new ResponseDataDTO<>(
      "get all applications successfully"
    , applicationInfoDTOS
    ,(long)companyPage.getTotalPages(), companyPage.getTotalElements());
    return responseData;
  }
}