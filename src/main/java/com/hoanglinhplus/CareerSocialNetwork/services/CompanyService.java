package com.hoanglinhplus.CareerSocialNetwork.services;

import com.hoanglinhplus.CareerSocialNetwork.constants.PageConstant;
import com.hoanglinhplus.CareerSocialNetwork.dto.PageableDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.company.CompanyCreationDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.company.CompanyFilterDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.InputNotValidException;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.NotFoundException;
import com.hoanglinhplus.CareerSocialNetwork.mappers.CompanyMapper;
import com.hoanglinhplus.CareerSocialNetwork.mappers.ResponseCompanyMapper;
import com.hoanglinhplus.CareerSocialNetwork.models.*;
import com.hoanglinhplus.CareerSocialNetwork.models.Company_;
import com.hoanglinhplus.CareerSocialNetwork.repositories.CompanyRepository;
import com.hoanglinhplus.CareerSocialNetwork.repositories.OrganizationSizeRepository;
import com.hoanglinhplus.CareerSocialNetwork.repositories.UserRepository;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.CompanySpecification;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.SearchCriteria;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.SearchOperator;
import com.hoanglinhplus.CareerSocialNetwork.securities.MyUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.*;


@Service
public class CompanyService {
  private final UserRepository userRepository;
  private final CompanyRepository companyRepository;
  private final MyUserDetailsService myUserDetailsService;
  private final AuthService authService;

  @Autowired
  public CompanyService(UserRepository userRepository, CompanyRepository companyRepository, OrganizationSizeRepository organizationSizeRepository, MyUserDetailsService myUserDetailsService, AuthService authService){
    this.userRepository = userRepository;
    this.companyRepository = companyRepository;
    this.myUserDetailsService = myUserDetailsService;
    this.authService = authService;
  }
  public ResponseEntity<ResponseObjectDTO> responseGetCompany(Long companyId) {
    Company company = getCompany(companyId);
    CompanyCreationDTO companyCreationDTO = CompanyMapper.toDTO(company);
    Map<String, Object> responseData = new HashMap<>();
    responseData.put("company", companyCreationDTO);
    return ResponseEntity.ok(new ResponseObjectDTO("get company successfully ",responseData));
  }
  public Company getCompany(Long companyId){
    Optional<Company> companyOptional = companyRepository.findById(companyId);
    if(companyOptional.isPresent()){
      return companyOptional.get();
    }
    throw new NotFoundException("companyId not found", "id", companyId.toString());
  }
  public ResponseEntity<ResponseObjectDTO> getAllCompanies(CompanyFilterDTO companyFilterDTO, PageableDTO pageableDTO){
    CompanySpecification companySpecification = new CompanySpecification();
    String companyName = companyFilterDTO.getName();
    Long industryId = companyFilterDTO.getIndustryId();
    Long organizationId = companyFilterDTO.getOrganizationId();
    if( companyName != null && !companyName.isEmpty()){
      SearchCriteria<Company, String> criteria = new SearchCriteria<>(Company_.name, companyName, SearchOperator.LIKE);
      companySpecification.getConditions().add(criteria);
    }
    if(industryId != null){
      Industry industry = Industry.builder().industryId(industryId).build();
      SearchCriteria<Company, Industry> criteria = new SearchCriteria<>(Company_.industry, industry, SearchOperator.EQUAL);
      companySpecification.getConditions().add(criteria);
    }
    if(organizationId != null){
      OrganizationSize organizationSize = OrganizationSize.builder().organizationId(organizationId).build();
      SearchCriteria<Company, OrganizationSize> criteria = new SearchCriteria<>(Company_.organizationSize, organizationSize, SearchOperator.EQUAL);
      companySpecification.getConditions().add(criteria);
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
    Page<Company> companyPage;
    Pageable pageable = PageRequest.of(pageableDTO.getPage(),pageableDTO.getSize(),Sort.by(orders));
    if(!companySpecification.getConditions().isEmpty()){
      companyPage = companyRepository.findAll(companySpecification, pageable);
    }
    else{
      companyPage = companyRepository.findAll(pageable);
    }
    return ResponseEntity.ok(ResponseCompanyMapper.toDTO(companyPage));
  }
  public ResponseEntity<ResponseObjectDTO> createCompany(CompanyCreationDTO companyCreationDTO){
    Company company = CompanyMapper.toEntity(companyCreationDTO);
    Long userId = myUserDetailsService.getCurrentUserId();
    Optional<User> userOptional = userRepository.findById(userId);
    if(userOptional.isPresent()){
      company.setCreatedUser(userOptional.get());
      Company savedCompany = companyRepository.save(company);
      Map<String, Object> responseData = new HashMap<>();
      CompanyCreationDTO savedCompanyDTO = CompanyMapper.toDTO(savedCompany);
      responseData.put("createdCompany", savedCompanyDTO);
      ResponseObjectDTO responseObjectDTO = new ResponseObjectDTO(
        "create user successfully"
        ,responseData);
      return ResponseEntity.ok(responseObjectDTO);
    }
    else {
      throw new NotFoundException("userId is not found", userId.toString(),"userId");
    }
  }

  public ResponseEntity<ResponseObjectDTO> updateCompany(CompanyCreationDTO companyUpdateDTO){
    Company company = CompanyMapper.toEntity(companyUpdateDTO);
    Optional<Company> companyOptional = companyRepository.findById(company.getCompanyId());
    if(companyOptional.isPresent()){
      Company targetCompany = companyOptional.get();
      authService.checkPermission(targetCompany.getCreatedUser().getUserId());
      if(company.getName() != null){
        targetCompany.setName(company.getName());
      }
      if(company.getWebsite() != null){
        targetCompany.setWebsite(company.getWebsite());
      }
      if(company.getLogo() != null){
        targetCompany.setLogo(company.getLogo());
      }
      if(company.getTagLine() != null){
        targetCompany.setTagLine(company.getTagLine());
      }
      if(company.getOrganizationSize() != null){
        targetCompany.setOrganizationSizes(company.getOrganizationSize());
      }
      if(company.getIndustry() != null){
        targetCompany.setIndustry(company.getIndustry());
      }
      Company updatedCompany =  companyRepository.save(targetCompany);
      Map<String, Object> responseData = new HashMap<>();
      CompanyCreationDTO updatedCompanyDTO = CompanyMapper.toDTO(updatedCompany);
      responseData.put("updatedCompany", updatedCompanyDTO);
      ResponseObjectDTO responseObjectDTO = new ResponseObjectDTO(
        "update company successfully"
        ,responseData);
      return ResponseEntity.ok(responseObjectDTO);
    }
    else {
      throw new NotFoundException("company is not found", company.getCompanyId().toString(), "id");
    }
  }
  @Transactional
  public ResponseEntity<ResponseObjectDTO> deleteCompanies(List<Long> ids) {
    List<Long> notExistIds = new ArrayList<>();
    List<Long> existedIds = companyRepository.findExistedIds(ids);
    ids.forEach(id->{
      if(!existedIds.contains(id))
        notExistIds.add(id);
    });
    if(notExistIds.size() == 0){
      ids.forEach(this::deleteCompanyById);
      Map<String, Object> responseData = new HashMap<>();
      responseData.put("deletedIds", ids);
      ResponseObjectDTO responseObjectDTO = new ResponseObjectDTO(
        "delete companies successfully "
        ,responseData);
      return ResponseEntity.ok(responseObjectDTO);
    }
    else{
      InputNotValidException inputNotValidException = new InputNotValidException("some ids is not found");
      inputNotValidException.getCauses().put("invalidIds", notExistIds);
      throw inputNotValidException;
    }
  }
  @Transactional
  public ResponseEntity<ResponseObjectDTO> deleteCompany(Long id) {
    Map<String, Object> responseData = new HashMap<>();
    Optional<Company> companyOptional = companyRepository.findById(id);
    if (companyOptional.isPresent()) {
      Company company = companyOptional.get();
      Long ownerId = company.getCreatedUser().getUserId();
      authService.checkPermission(ownerId);
      deleteCompany(company);
      CompanyCreationDTO companyCreationDTO = CompanyMapper.toDTO(company);
      responseData.put("deletedCompany", companyCreationDTO);
      ResponseObjectDTO responseObjectDTO = new ResponseObjectDTO(
        "delete company successfully "
        ,responseData);
      return ResponseEntity.ok(responseObjectDTO);
      }
    else{
      InputNotValidException inputNotValidException = new InputNotValidException("companyId is not found");
      inputNotValidException.getCauses().put("invalidId", id);
      throw inputNotValidException;
    }
  }
  public void deleteCompany(Company company) {
    company.removeAllRelationShip();
    companyRepository.delete(company);
  }
  public void deleteCompanyById(Long id) {
    Optional<Company> companyOptional = companyRepository.findById(id);
    if(companyOptional.isPresent()){
      Company company = companyOptional.get();
      company.removeAllRelationShip();
      companyRepository.delete(company);
    }
  }
}