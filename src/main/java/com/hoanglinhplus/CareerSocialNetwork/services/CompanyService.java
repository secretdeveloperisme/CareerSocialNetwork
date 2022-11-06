package com.hoanglinhplus.CareerSocialNetwork.services;

import com.hoanglinhplus.CareerSocialNetwork.constants.PageConstant;
import com.hoanglinhplus.CareerSocialNetwork.dto.PageableDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.company.CompanyCreationDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.company.CompanyFilterDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseDataDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.stastistic.CompanyStatistics;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.InputNotValidException;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.NotFoundException;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.PermissionDeniedException;
import com.hoanglinhplus.CareerSocialNetwork.mappers.CompanyMapper;
import com.hoanglinhplus.CareerSocialNetwork.mappers.ResponseCompanyMapper;
import com.hoanglinhplus.CareerSocialNetwork.models.*;
import com.hoanglinhplus.CareerSocialNetwork.models.projection.PopularCompanyInfo;
import com.hoanglinhplus.CareerSocialNetwork.repositories.*;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.CompanySpecification;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.SearchCriteria;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.SearchOperator;
import com.hoanglinhplus.CareerSocialNetwork.securities.MyUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.*;


@Service
public class CompanyService {
  private final UserRepository userRepository;
  private final CompanyRepository companyRepository;
  private final MyUserDetailsService myUserDetailsService;
  private final IndustryRepository industryRepository;
  private final EmploymentTypeRepository employmentTypeRepository;
  private final AuthService authService;
  private final OrganizationSizeRepository organizationSizeRepository;

  @Autowired
  public CompanyService(UserRepository userRepository, CompanyRepository companyRepository, OrganizationSizeRepository organizationSizeRepository, MyUserDetailsService myUserDetailsService, IndustryRepository industryRepository, EmploymentTypeRepository employmentTypeRepository, AuthService authService, OrganizationSizeRepository organizationSizeRepository1){
    this.userRepository = userRepository;
    this.companyRepository = companyRepository;
    this.myUserDetailsService = myUserDetailsService;
    this.industryRepository = industryRepository;
    this.employmentTypeRepository = employmentTypeRepository;
    this.authService = authService;
    this.organizationSizeRepository = organizationSizeRepository1;
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
  public Page<Company> getOwnCompanies(CompanyFilterDTO companyFilterDTO,PageableDTO pageableDTO){
    companyFilterDTO.setUserId(myUserDetailsService.getCurrentUserId());
    return getAllCompanies(companyFilterDTO, pageableDTO);
  }
  public ResponseEntity<ResponseDataDTO<CompanyCreationDTO>> responseGetOwnCompanies(CompanyFilterDTO companyFilterDTO, PageableDTO pageableDTO){
    Page<Company> companyPage = getOwnCompanies(companyFilterDTO, pageableDTO);
    return ResponseEntity.ok(ResponseCompanyMapper.toDTO(companyPage));
  }
  public ResponseEntity<ResponseDataDTO<CompanyCreationDTO>> responseGetAllCompanies(CompanyFilterDTO companyFilterDTO,PageableDTO pageableDTO){
    Page<Company> allCompanyPage =  getAllCompanies(companyFilterDTO, pageableDTO);
    return ResponseEntity.ok(ResponseCompanyMapper.toDTO(allCompanyPage));
  }
  public Page<Company> getAllCompanies(CompanyFilterDTO companyFilterDTO, PageableDTO pageableDTO){
    CompanySpecification companySpecification = new CompanySpecification();
    String companyName = companyFilterDTO.getName();
    Long industryId = companyFilterDTO.getIndustryId();
    Long organizationId = companyFilterDTO.getOrganizationId();
    Long createdUser = companyFilterDTO.getUserId();
    Boolean isDeleted = companyFilterDTO.getIsDeleted();
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
    if(createdUser != null){
      User user = User.builder().userId(createdUser).build();
      SearchCriteria<Company, User> criteria = new SearchCriteria<>(Company_.createdUser, user, SearchOperator.EQUAL);
      companySpecification.getConditions().add(criteria);
    }
    SearchCriteria<Company, Date> criteria;
    if(isDeleted != null){
      criteria = new SearchCriteria<>(Company_.deletedAt, null, SearchOperator.NOT_NULL);
    }else {
      criteria = new SearchCriteria<>(Company_.deletedAt, null, SearchOperator.NULL);
    }
    companySpecification.getConditions().add(criteria);
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
    Pageable pageable = PageRequest.of(pageableDTO.getPage() - 1 ,pageableDTO.getSize(),Sort.by(orders));
    if(!companySpecification.getConditions().isEmpty()){
      companyPage = companyRepository.findAll(companySpecification, pageable);
    }
    else{
      companyPage = companyRepository.findAll(pageable);
    }
    return companyPage;
  }
  public List<Company> getAllCompanies(){
    return companyRepository.findAll();
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
        "create company successfully"
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
      if(company.getLogo() != null && !company.getLogo().isEmpty()){
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
  public ResponseEntity<ResponseObjectDTO> deleteCompanies(List<Long> ids, boolean isAdmin,boolean isDestroy) {
    List<Long> notExistIds = new ArrayList<>();
    List<Long> existedIds = companyRepository.findExistedIds(ids);
    ids.forEach(id->{
      if(!existedIds.contains(id))
        notExistIds.add(id);
    });

    if(notExistIds.size() == 0){
      if(!isAdmin){
        if(ids.stream().noneMatch(this::isOwnerCompany)){
          throw new PermissionDeniedException("you do not have permission");
        }
      }
      if(isDestroy)
        ids.forEach(this::destroyCompanyById);
      else
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
  public boolean isOwnerCompany(Long companyId) {
    Long userId = myUserDetailsService.getCurrentUserId();
    Company company = getCompany(companyId);
    return company.getCreatedUser().getUserId().equals(userId);
  }
  public void destroyCompanyById(Long id) {
    Optional<Company> companyOptional = companyRepository.findById(id);
    if(companyOptional.isPresent()){
      Company company = companyOptional.get();
      company.removeAllRelationShip();
      companyRepository.delete(company);
    }
  }
  public void deleteCompanyById(Long id) {
    Optional<Company> companyOptional = companyRepository.findById(id);
    if(companyOptional.isPresent()){
      Company company = companyOptional.get();
      company.setDeletedAt(new Date());
      companyRepository.save(company);
    }
  }
  public List<PopularCompanyInfo> getPopularCompanies(){
    List<PopularCompanyInfo> poplularCompany = companyRepository.getPopularCompanies();
    return poplularCompany;
  }
  
  public List<Industry> getIndustries(){
    return industryRepository.findAll();
  }
  public List<OrganizationSize> getOrganizationSizes() {
    return organizationSizeRepository.findAll();
  }
  public List<EmploymentType> getAllEmploymentTypes(){
    return employmentTypeRepository.findAll();
  }
  public boolean isUserFollowed(Long userId, Long companyId){
    Company company = getCompany(companyId);
    List<User> followedUsers = company.getFollow_companies();
    return followedUsers.stream().anyMatch(user -> user.getUserId().equals(userId));
  }
  public boolean isCurrentUserFollowed(Long companyId) {
    return isUserFollowed(myUserDetailsService.getCurrentUserId(), companyId);
  }
  public CompanyStatistics getCompanyStatistics(Long companyId) {
    Company company = getCompany(companyId);
    CompanyStatistics companyStatistics = new CompanyStatistics();
    companyStatistics.setAmountOfFollowers((long) company.getFollow_companies().size());
    companyStatistics.setAmountOfPublishedJobs((long) company.getJobs().size());
    return companyStatistics;
  }
  public long getAmountOfCompanies(Long userId, boolean isDeleted){
    CompanySpecification companySpecification = new CompanySpecification();
    SearchCriteria<Company, User> searchCriteria =
      new SearchCriteria<>(Company_.createdUser, User.builder().userId(userId).build(), SearchOperator.EQUAL);
    companySpecification.getConditions().add(searchCriteria);
    SearchCriteria<Company, Date> searchDeletedCriteria;
    if(isDeleted){
      searchDeletedCriteria =
        new SearchCriteria<>(Company_.deletedAt, null, SearchOperator.NOT_NULL);
    }else{
      searchDeletedCriteria =
        new SearchCriteria<>(Company_.deletedAt, null, SearchOperator.NULL);
    }
    companySpecification.getConditions().add(searchDeletedCriteria);
    return companyRepository.count(companySpecification);
  }
  public long getAmountOfFollowedCompanies(Long userId){
    return getFollowedCompanies(userId).size();
  }
  public List<Company> getFollowedCompanies(Long userId){
    Specification<Company> specification = CompanySpecification.joinFollowedUsers(userId);
    return companyRepository.findAll(specification);
  }

  public ResponseEntity<ResponseObjectDTO> restoreCompanies(List<Long> ids) {
    List<Company> companies = companyRepository.findAllById(ids);
    for (Company company : companies) {
      company.setDeletedAt(null);
    }
    List<Company> savedCompanies = companyRepository.saveAll(companies);
    List<CompanyCreationDTO> savedCompanyDTOS = savedCompanies.stream().map(CompanyMapper::toDTO).toList();
    Map<String, Object> responseData = new HashMap<>();
    responseData.put("deletedCompanies", savedCompanyDTOS);
    return ResponseEntity.ok(new ResponseObjectDTO("Restore Companies Successfully", responseData));
  }
  public long getAmountOfAllCompanies(){
    return companyRepository.count();
  }
}