package com.hoanglinhplus.CareerSocialNetwork.controllers.api;

import com.hoanglinhplus.CareerSocialNetwork.dto.PageableDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.company_user_role.CompanyUserRoleDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.company_user_role.CompanyUserRoleFilterDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.company_user_role.UpdateCompanyUserRoleDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseDataDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.services.CompanyUserRoleService;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.persistence.PersistenceUnit;

@RestController
@RequestMapping("/api/company-user-role")
public class CompanyUserRoleController {
  private final CompanyUserRoleService companyUserRoleService;

  public CompanyUserRoleController(CompanyUserRoleService companyUserRoleService) {
    this.companyUserRoleService = companyUserRoleService;
  }

  @GetMapping(value = "/get-all-company-user-roles")
  @PreAuthorize("hasAnyAuthority('ADMIN','USER')")
  public ResponseEntity<ResponseDataDTO<CompanyUserRoleDTO>> getAllCompanyUserRoles(CompanyUserRoleFilterDTO companyUserRoleFilterDTO
  , PageableDTO pageableDTO){
    return companyUserRoleService.responseGetAllCompanyUserRole(companyUserRoleFilterDTO, pageableDTO);
  }
  @GetMapping(value = "/get-company-user-roles")
  @PreAuthorize("hasAnyAuthority('ADMIN','USER')")
  public ResponseEntity<ResponseDataDTO<CompanyUserRoleDTO>> responseGetCompanyUserRole(Long companyId
    , PageableDTO pageableDTO){
    return companyUserRoleService.responseGetCompanyUserRole(companyId, pageableDTO);
  }
  @PostMapping
  @PreAuthorize("hasAnyAuthority('ADMIN','USER')")
  public ResponseEntity<ResponseObjectDTO> addCompanyUserRole(@RequestBody CompanyUserRoleDTO companyUserRoleDTO){
    return companyUserRoleService.responseAddCompanyUserRole(companyUserRoleDTO);
  }
  @PutMapping
  @PreAuthorize("hasAnyAuthority('ADMIN','USER')")
  public ResponseEntity<ResponseObjectDTO> updateCompanyUserRole(@RequestBody UpdateCompanyUserRoleDTO updateCompanyUserRoleDTO){
    return companyUserRoleService.updateCompanyUserRole(updateCompanyUserRoleDTO);
  }
}
