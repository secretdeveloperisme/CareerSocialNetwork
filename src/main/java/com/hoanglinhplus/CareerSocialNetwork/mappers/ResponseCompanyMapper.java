package com.hoanglinhplus.CareerSocialNetwork.mappers;

import com.hoanglinhplus.CareerSocialNetwork.dto.company.CompanyCreationDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseDataDTO;
import com.hoanglinhplus.CareerSocialNetwork.models.Company;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class ResponseCompanyMapper {
  public static ResponseDataDTO<CompanyCreationDTO> toDTO(Page<Company> companyPage){
    List<CompanyCreationDTO> companyCreationDTOS = companyPage.getContent().stream().map(CompanyMapper::toDTO).collect(Collectors.toList());
    ResponseDataDTO<CompanyCreationDTO> responseData = new ResponseDataDTO<>(
      "get all companies successfully"
    , companyCreationDTOS
    ,(long)companyPage.getTotalPages());
    return responseData;
  }
}