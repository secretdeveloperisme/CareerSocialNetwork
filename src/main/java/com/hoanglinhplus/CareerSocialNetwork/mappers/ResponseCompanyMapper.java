package com.hoanglinhplus.CareerSocialNetwork.mappers;

import com.hoanglinhplus.CareerSocialNetwork.dto.company.CompanyCreationDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.models.Company;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Component
public class ResponseCompanyMapper {
  public static ResponseObjectDTO toDTO(Page<Company> companyPage){
    List<CompanyCreationDTO> usersDTO = companyPage.getContent().stream().map(CompanyMapper::toDTO).collect(Collectors.toList());
    Map<String, Object> responseData = new HashMap<>();
    responseData.put("users", usersDTO);
    responseData.put("totalPages", companyPage.getTotalPages());
    responseData.put("size", companyPage.getSize());
    responseData.put("totalElements", companyPage.getTotalElements());
    responseData.put("page", companyPage.getNumber());
    responseData.put("numberOfElements", companyPage.getNumberOfElements());
    return new ResponseObjectDTO("get all companies successfully",responseData);
  }
}