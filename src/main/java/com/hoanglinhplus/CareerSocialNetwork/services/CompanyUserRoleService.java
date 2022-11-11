package com.hoanglinhplus.CareerSocialNetwork.services;

import com.hoanglinhplus.CareerSocialNetwork.constants.CompanyRoleId;
import com.hoanglinhplus.CareerSocialNetwork.constants.PageConstant;
import com.hoanglinhplus.CareerSocialNetwork.dto.PageableDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.company_user_role.CompanyUserRoleDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.company_user_role.CompanyUserRoleFilterDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseDataDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.PermissionDeniedException;
import com.hoanglinhplus.CareerSocialNetwork.mappers.CompanyUserRoleMapper;
import com.hoanglinhplus.CareerSocialNetwork.mappers.ResponseCompanyUserRoleMapper;
import com.hoanglinhplus.CareerSocialNetwork.models.CompanyUserRole;
import com.hoanglinhplus.CareerSocialNetwork.models.CompanyUserRole_;
import com.hoanglinhplus.CareerSocialNetwork.repositories.CompanyUserRoleRepository;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.CompanyUserRoleSpecification;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.SearchCriteria;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.SearchOperator;
import com.hoanglinhplus.CareerSocialNetwork.securities.MyUserDetailsService;
import com.hoanglinhplus.CareerSocialNetwork.securities.PermissionService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CompanyUserRoleService {
  private final CompanyUserRoleRepository companyUserRoleRepository;
  private final MyUserDetailsService myUserDetailsService;
  private final PermissionService permissionService;

  public CompanyUserRoleService(CompanyUserRoleRepository companyUserRoleRepository, MyUserDetailsService myUserDetailsService, PermissionService permissionService) {
    this.companyUserRoleRepository = companyUserRoleRepository;
    this.myUserDetailsService = myUserDetailsService;
    this.permissionService = permissionService;
  }
  public Page<CompanyUserRole> getCompanyUserRolePage(CompanyUserRoleFilterDTO companyUserRoleFilterDTO, PageableDTO pageableDTO){
    CompanyUserRoleSpecification companyUserRoleSpecification = new CompanyUserRoleSpecification();
    Long userId = companyUserRoleFilterDTO.getUserId();
    Long companyId = companyUserRoleFilterDTO.getCompanyId();
    Long companyRoleId =  companyUserRoleFilterDTO.getCompanyRoleId();
    if( userId != null){
      SearchCriteria<CompanyUserRole, Long> criteria = new SearchCriteria<>(CompanyUserRole_.userId, userId, SearchOperator.EQUAL);
      companyUserRoleSpecification.getConditions().add(criteria);
    }
    if( companyId != null){
      SearchCriteria<CompanyUserRole, Long> criteria = new SearchCriteria<>(CompanyUserRole_.companyId, companyId, SearchOperator.EQUAL);
      companyUserRoleSpecification.getConditions().add(criteria);
    }
    if(companyRoleId != null){
      SearchCriteria<CompanyUserRole, Long> criteria = new SearchCriteria<>(CompanyUserRole_.companyRoleId, companyRoleId, SearchOperator.EQUAL);
      companyUserRoleSpecification.getConditions().add(criteria);
    }
    List<Sort.Order> orders = new ArrayList<>();
    if(pageableDTO.getSort() != null){
      pageableDTO.getSort().forEach(s->{
        String[] sortParams = s.split("[\\-_\\.]");
        if(sortParams.length == PageConstant.SORT_ARGUMENT_SIZE){
          if(sortParams[1].equalsIgnoreCase(PageConstant.DESCENDING)){
            orders.add(Sort.Order.by(sortParams[0]).with(Sort.Direction.DESC));
          }else
            orders.add(Sort.Order.by(sortParams[0]).with(Sort.Direction.ASC));
        }
        else if(sortParams.length == 1){
          orders.add(Sort.Order.by(sortParams[0]).with(Sort.Direction.ASC));
        }
      });
    }
    Pageable pageable = PageRequest.of(pageableDTO.getPage() - 1 ,pageableDTO.getSize(),Sort.by(orders));
    return companyUserRoleRepository.findAll(companyUserRoleSpecification, pageable);
  }
  public ResponseEntity<ResponseDataDTO<CompanyUserRoleDTO>> responseGetCompanyUserRole(Long companyId, PageableDTO pageableDTO){
    if(!checkRoleUserInCompany(myUserDetailsService.getCurrentUserId(), companyId, null)){
      throw new PermissionDeniedException("You don't have permission to watch this company user roles");
    }
    return ResponseEntity.ok(ResponseCompanyUserRoleMapper.toDTO(getCompanyUserRolePage(CompanyUserRoleFilterDTO.builder().companyId(companyId).build(), pageableDTO)));
  }
  public ResponseEntity<ResponseDataDTO<CompanyUserRoleDTO>> responseGetAllCompanyUserRole(CompanyUserRoleFilterDTO companyUserRoleFilterDTO, PageableDTO pageableDTO){
    return ResponseEntity.ok(ResponseCompanyUserRoleMapper.toDTO(getCompanyUserRolePage(companyUserRoleFilterDTO, pageableDTO)));
  }
  public boolean checkRoleUserInCompany(Long userId,Long companyId, Long companyRoleId){
    List<CompanyUserRole> companyUserRoles = getCompanyUserRolePage(CompanyUserRoleFilterDTO
      .builder().userId(userId).companyId(companyId).companyRoleId(companyRoleId).build(),new PageableDTO()).getContent();
    return !companyUserRoles.isEmpty();
  }
  public ResponseEntity<ResponseObjectDTO> responseAddCompanyUserRole(CompanyUserRoleDTO companyUserRoleDTO){
    Map<String, Object> responseData = new HashMap<>();
    responseData.put("companyUserRole", addCompanyUserRole(companyUserRoleDTO, false));
    return ResponseEntity.ok(new ResponseObjectDTO("Add Company User Role Successfully", responseData));
  }
  public CompanyUserRoleDTO addCompanyUserRole(CompanyUserRoleDTO companyUserRoleDTO, boolean isCompanyCreated){
    if(!isCompanyCreated){
      if(!checkRoleUserInCompany(myUserDetailsService.getCurrentUserId(), companyUserRoleDTO.getCompanyId(), CompanyRoleId.CREATOR.getValue())){
        throw new PermissionDeniedException("You do have permission to add role");
      }
    }
    CompanyUserRole companyUserRole = CompanyUserRoleMapper.toEntity(companyUserRoleDTO);
    CompanyUserRole savedCompanyUserRole = companyUserRoleRepository.save(companyUserRole);
    return CompanyUserRoleMapper.toDTO(savedCompanyUserRole);
  }
}
