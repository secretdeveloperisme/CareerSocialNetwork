package com.hoanglinhplus.CareerSocialNetwork.mappers;

import com.hoanglinhplus.CareerSocialNetwork.dto.company_user_role.CompanyUserRoleDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseDataDTO;
import com.hoanglinhplus.CareerSocialNetwork.models.CompanyUserRole;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class ResponseCompanyUserRoleMapper {
  public static ResponseDataDTO<CompanyUserRoleDTO> toDTO(Page<CompanyUserRole> companyUserRolePage){
    List<CompanyUserRoleDTO> usersDTO = companyUserRolePage.getContent().stream().map(CompanyUserRoleMapper::toDTO).collect(Collectors.toList());
    return new ResponseDataDTO<>("Get All Company User Roles Successfully"
      ,usersDTO, (long) companyUserRolePage.getTotalPages(), companyUserRolePage.getTotalElements() );
  }
}