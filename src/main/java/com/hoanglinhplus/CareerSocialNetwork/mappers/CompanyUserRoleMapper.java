package com.hoanglinhplus.CareerSocialNetwork.mappers;

import com.hoanglinhplus.CareerSocialNetwork.dto.company_user_role.CompanyUserRoleDTO;
import com.hoanglinhplus.CareerSocialNetwork.models.CompanyUserRole;

public class CompanyUserRoleMapper extends ModelMapperConfig{
  public static CompanyUserRole toEntity(CompanyUserRoleDTO companyUserRoleDTO) {
    CompanyUserRole companyUserRole = modelMapper.map(companyUserRoleDTO, CompanyUserRole.class);
    return companyUserRole;
  }
  public static CompanyUserRoleDTO toDTO(CompanyUserRole companyUserRole) {
    CompanyUserRoleDTO companyUserRoleDTO = modelMapper.map(companyUserRole, CompanyUserRoleDTO.class);
    return companyUserRoleDTO;
  }

}
