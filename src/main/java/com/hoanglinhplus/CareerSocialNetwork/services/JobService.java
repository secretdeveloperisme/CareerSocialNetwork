package com.hoanglinhplus.CareerSocialNetwork.services;

import com.hoanglinhplus.CareerSocialNetwork.constants.ApplicationStatus;
import com.hoanglinhplus.CareerSocialNetwork.constants.NumberConstant;
import com.hoanglinhplus.CareerSocialNetwork.constants.PageConstant;
import com.hoanglinhplus.CareerSocialNetwork.dto.PageableDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.tag.TagDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.job.JobCreationDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.job.JobFilterDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseDataDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.InputNotValidException;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.NotFoundException;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.PermissionDeniedException;
import com.hoanglinhplus.CareerSocialNetwork.mappers.JobMapper;
import com.hoanglinhplus.CareerSocialNetwork.mappers.ResponseJobMapper;
import com.hoanglinhplus.CareerSocialNetwork.models.*;
import com.hoanglinhplus.CareerSocialNetwork.models.Job_;
import com.hoanglinhplus.CareerSocialNetwork.models.projection.PopularJobInfo;
import com.hoanglinhplus.CareerSocialNetwork.models.projection.statistics.AmountsPerMonth;
import com.hoanglinhplus.CareerSocialNetwork.repositories.*;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.JobSpecification;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.SearchCriteria;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.SearchOperator;
import com.hoanglinhplus.CareerSocialNetwork.securities.MyUserDetailsService;
import com.hoanglinhplus.CareerSocialNetwork.securities.PermissionService;
import com.hoanglinhplus.CareerSocialNetwork.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.*;
import java.util.stream.Collectors;


@Service
public class JobService {
  private final UserRepository userRepository;
  private final JobRepository jobRepository;
  private final CompanyRepository companyRepository;
  private final MyUserDetailsService myUserDetailsService;
  private final AuthService authService;
  private final TagService tagService;
  private final SkillRepository skillRepository;
  private final WorkPlaceRepository workPlaceRepository;
  private final PositionRepository positionRepository;
  private final EmploymentTypeRepository employmentTypeRepository;
  private final PermissionService permissionService;

  @Autowired
  public JobService(UserRepository userRepository, JobRepository jobRepository
    , CompanyRepository companyRepository
    , MyUserDetailsService myUserDetailsService, AuthService authService, TagService tagService, SkillRepository skillRepository, WorkPlaceRepository workPlaceRepository, PositionRepository positionRepository, EmploymentTypeRepository employmentTypeRepository, PermissionService permissionService){
    this.userRepository = userRepository;
    this.jobRepository = jobRepository;
    this.companyRepository = companyRepository;
    this.myUserDetailsService = myUserDetailsService;
    this.authService = authService;
    this.tagService = tagService;
    this.skillRepository = skillRepository;
    this.workPlaceRepository = workPlaceRepository;
    this.positionRepository = positionRepository;
    this.employmentTypeRepository = employmentTypeRepository;
    this.permissionService = permissionService;
  }
  public ResponseEntity<ResponseObjectDTO> responseGetJob(Long jobId){
    Job job = getJob(jobId);
    JobCreationDTO jobCreationDTO = JobMapper.toDTO(job);
    Map<String, Object> responseData = new HashMap<>();
    responseData.put("job", jobCreationDTO);
    return ResponseEntity.ok(new ResponseObjectDTO("get job successfully ",responseData));
  }
  public Job getJob(Long jobId){
    Optional<Job> jobOptional = jobRepository.findById(jobId);
    if(jobOptional.isPresent()){
      return jobOptional.get();
    }
    throw new NotFoundException("Job not found", "id", jobId.toString());
  }
  public Page<Job> getJobs(JobFilterDTO jobFilterDTO, PageableDTO pageableDTO){
    JobSpecification jobSpecification = new JobSpecification();
    String title = jobFilterDTO.getTitle();
    String location = jobFilterDTO.getLocation();
    int salary = jobFilterDTO.getSalary();
    Float experience = jobFilterDTO.getExperience();
    List<Long> tagIds = jobFilterDTO.getTagIds();
    List<Long> jobSkillIds = jobFilterDTO.getSkillIds();
    List<Long> employmentTypeIds = jobFilterDTO.getEmploymentTypeIds();
    Long employmentTypeId = jobFilterDTO.getEmploymentTypeId();
    Long companyId = jobFilterDTO.getCompanyId();
    Long positionId = jobFilterDTO.getPositionId();
    Long workPlaceId = jobFilterDTO.getWorkPlaceId();
    Boolean isDeleted = jobFilterDTO.getIsDeleted();
    Boolean isExpired = jobFilterDTO.getIsExpired();
    if( title != null && !title.isEmpty()){
      SearchCriteria<Job, String> criteria = new SearchCriteria<>(Job_.title, title, SearchOperator.LIKE);
      jobSpecification.getConditions().add(criteria);
    }
    if( location != null && !location.isEmpty()){
      SearchCriteria<Job, String> criteria = new SearchCriteria<>(Job_.location, location, SearchOperator.LIKE);
      jobSpecification.getConditions().add(criteria);
    }

    if(employmentTypeId!= null){
      EmploymentType employmentType = EmploymentType.builder().employmentTypeId(employmentTypeId).build();
      SearchCriteria<Job, EmploymentType> criteria = new SearchCriteria<>(Job_.employmentType,employmentType, SearchOperator.EQUAL);
      jobSpecification.getConditions().add(criteria);
    }
    if(salary != NumberConstant.NO_SET){
      SearchCriteria<Job, Integer> criteria0 = new SearchCriteria<>(Job_.salaryMin, salary, SearchOperator.LESS_EQUAL);
      SearchCriteria<Job, Integer> criteria1 = new SearchCriteria<>(Job_.salaryMax, salary, SearchOperator.GREATER_EQUAL);
      jobSpecification.getConditions().add(criteria0);
      jobSpecification.getConditions().add(criteria1);
    }
    if(experience > 0){
      SearchCriteria<Job, Float> criteria = new SearchCriteria<>(Job_.experience, experience, SearchOperator.EQUAL);
      jobSpecification.getConditions().add(criteria);
    }
    if(companyId != null){
      Company company = Company.builder().companyId(companyId).build();
      SearchCriteria<Job, Company> criteria = new SearchCriteria<>(Job_.company, company, SearchOperator.EQUAL);
      jobSpecification.getConditions().add(criteria);
    }
    if(workPlaceId != null){
      WorkPlace workPlace = WorkPlace.builder().workPlaceId(workPlaceId).build();
      SearchCriteria<Job, WorkPlace> criteria = new SearchCriteria<>(Job_.workPlace, workPlace, SearchOperator.EQUAL);
      jobSpecification.getConditions().add(criteria);
    }
    if(positionId!= null){
      Position position = Position.builder().positionId(positionId).build();
      SearchCriteria<Job, Position> criteria = new SearchCriteria<>(Job_.position, position, SearchOperator.EQUAL);
      jobSpecification.getConditions().add(criteria);
    }
    SearchCriteria<Job, Date> deletedCriteria;
    if(isDeleted != null){
      deletedCriteria = new SearchCriteria<>(Job_.deletedAt, null, SearchOperator.NOT_NULL);
    }else {
      deletedCriteria = new SearchCriteria<>(Job_.deletedAt, null, SearchOperator.NULL);
    }
    jobSpecification.getConditions().add(deletedCriteria);
    SearchCriteria<Job, Date> isExpiredCriteria = null;
    if(isExpired != null){
      if(isExpired) {
        isExpiredCriteria = new SearchCriteria<>(Job_.endDate, new Date(), SearchOperator.LESS_THAN);
      }else
        isExpiredCriteria = new SearchCriteria<>(Job_.endDate, new Date(), SearchOperator.GREATER_THAN);
      jobSpecification.getConditions().add(isExpiredCriteria);
    }

    Specification<Job> resultSpecification = jobSpecification;
    if(tagIds != null){
       Specification<Job> tagSpecification = JobSpecification.joinTags(tagIds);
       resultSpecification = resultSpecification.and(tagSpecification);
    }
    if(jobSkillIds!= null){
      Specification<Job> skillSpecification = JobSpecification.joinSkills(jobSkillIds);
      resultSpecification = resultSpecification.and(skillSpecification);
    }
    if(employmentTypeIds!= null){
      Specification<Job> employmentTypeSpecification = JobSpecification.joinEmploymentType(employmentTypeIds);
      resultSpecification = resultSpecification.and(employmentTypeSpecification);
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
      if(pageableDTO.getSort().size() == 0){
        orders.add(Sort.Order.by(Job_.CREATED_AT).with(Sort.Direction.DESC));
      }
    }

    Page<Job> jobPage;
    Pageable pageable = PageRequest.of(pageableDTO.getPage() - 1,pageableDTO.getSize(),Sort.by(orders));
    jobPage = jobRepository.findAll(resultSpecification, pageable);
    return jobPage;
  }
  public List<Job> getPopularJobs(){
    return jobRepository.getPopularJobs();
  }
  public List<PopularJobInfo> getPopularJobsInfo(){
    return jobRepository.getPopularJobInfos();
  }
  public ResponseEntity<ResponseDataDTO<JobCreationDTO>> responseGetJobs(JobFilterDTO jobFilterDTO, PageableDTO pageableDTO){
    Page<Job> jobPage = getJobs(jobFilterDTO, pageableDTO);
    return  ResponseEntity.ok(ResponseJobMapper.toDTO(jobPage));
  }
  @Transactional
  @Modifying
  public ResponseEntity<ResponseObjectDTO> createJob(JobCreationDTO jobUpdateDTO) {
    Job job = JobMapper.toEntity(jobUpdateDTO);
    Long userId = myUserDetailsService.getCurrentUserId();
    Long companyId = jobUpdateDTO.getCompany().getCompanyId();
    Optional<Company> company = companyRepository.findById(companyId);
    if (company.isPresent()) {
      Optional<User> userOptional = userRepository.findById(userId);
      if (userOptional.isPresent()) {
        List<Tag> tags = tagService.createTags(jobUpdateDTO.getTags().stream().map(TagDTO::getName).toList());
        job.setTags(tags);
        Job savedJob = jobRepository.save(job);
        Map<String, Object> responseData = new HashMap<>();
        JobCreationDTO jobCreationDTO = JobMapper.toDTO(savedJob);
        responseData.put("createdJob", jobCreationDTO);
        ResponseObjectDTO responseObjectDTO = new ResponseObjectDTO(
          "create job successfully"
          , responseData);
        return ResponseEntity.ok(responseObjectDTO);
      } else {
        throw new NotFoundException("userId is not found", userId.toString(), "userId");
      }
    }
    throw new NotFoundException("Company not found", jobUpdateDTO.getCompany().getCompanyId().toString(), "ID");
  }
  @Transactional
  public ResponseEntity<ResponseObjectDTO> updateJob(JobCreationDTO jobUpdateDTO){
    Job job = JobMapper.toEntity(jobUpdateDTO);
    Optional<Job> jobOptional = jobRepository.findById(job.getJobId());
    if(jobOptional.isPresent()){
      Job targetJob = jobOptional.get();
      if(!permissionService.isAdmin())
        authService.checkPermission(targetJob.getCompany().getCreatedUser().getUserId());
      if(jobUpdateDTO.getTitle() != null){
        targetJob.setTitle(jobUpdateDTO.getTitle());
      }
      if(jobUpdateDTO.getJobDescription() != null){
       targetJob.setJobDescription(jobUpdateDTO.getJobDescription());
      }
      if(jobUpdateDTO.getImage() != null && !jobUpdateDTO.getImage().isEmpty()){
        targetJob.setImage(jobUpdateDTO.getImage());
      }
      if(jobUpdateDTO.getAmount() != NumberConstant.NO_SET){
        targetJob.setAmount(jobUpdateDTO.getAmount());
      }
      if(jobUpdateDTO.getLocation() != null){
        targetJob.setLocation(jobUpdateDTO.getLocation());
      }
      if(jobUpdateDTO.getExperience() != NumberConstant.NO_SET){
        targetJob.setExperience(jobUpdateDTO.getExperience());
      }
      if(jobUpdateDTO.getSalaryMin() != NumberConstant.MIN_VALUE){
        targetJob.setSalaryMin(jobUpdateDTO.getSalaryMin());
      }
      if(jobUpdateDTO.getSalaryMax()!= NumberConstant.MAX_VALUE){
        targetJob.setSalaryMax(jobUpdateDTO.getSalaryMax());
      }
      if(jobUpdateDTO.getStartDate()!= null){
        targetJob.setStartDate(jobUpdateDTO.getStartDate());
      }
      if(jobUpdateDTO.getEndDate()!= null){
        targetJob.setEndDate(jobUpdateDTO.getEndDate());
      }
      if(jobUpdateDTO.getCompany()!= null){
        targetJob.setCompany(Company.builder().companyId(jobUpdateDTO.getCompany().getCompanyId()).build());
      }
      if(jobUpdateDTO.getTags()!= null){
        List<Tag> tags = tagService.createTags(jobUpdateDTO.getTags().stream().map(TagDTO::getName).toList());
        targetJob.setTags(tags);
      }
      if(jobUpdateDTO.getJobSkills() != null){
        List<Skill> skills = jobUpdateDTO.getJobSkills().stream().map(skillDTO ->
          Skill.builder().skillId(skillDTO.getSkillId()).build()).collect(Collectors.toList());
        targetJob.setJobSkills(skills);
      }
      if(jobUpdateDTO.getEmploymentType() != null) {
        targetJob.setEmploymentType(EmploymentType.builder()
          .employmentTypeId(jobUpdateDTO.getEmploymentType().getEmploymentTypeId()).build());
      }
      if(jobUpdateDTO.getPosition() != null) {
        targetJob.setPosition(Position.builder().positionId(jobUpdateDTO.getPosition().getPositionId()).build());
      }
      if(jobUpdateDTO.getWorkPlace() != null) {
        targetJob.setWorkPlace(WorkPlace.builder().workPlaceId(jobUpdateDTO.getWorkPlace().getWorkPlaceId()).build());
      }
      Job updatedJob = jobRepository.save(targetJob);
      Map<String, Object> responseData = new HashMap<>();
      JobCreationDTO updatedJobDTO = JobMapper.toDTO(updatedJob);
      responseData.put("updatedJob", updatedJobDTO);
      ResponseObjectDTO responseObjectDTO = new ResponseObjectDTO(
        "update job successfully"
        ,responseData);
      return ResponseEntity.ok(responseObjectDTO);
    }
    else {
      throw new NotFoundException("Job not found", job.getJobId().toString(), "id");
    }
  }
  @Transactional
  public ResponseEntity<ResponseObjectDTO> deleteJobs(List<Long> ids,Long companyId, boolean isAdmin,boolean isDestroy) {
    List<Long> notExistIds = new ArrayList<>();
    List<Long> existedIds = jobRepository.findExistedIds(ids);
    ids.forEach(id->{
      if(!existedIds.contains(id))
        notExistIds.add(id);
    });
    if(notExistIds.size() == 0){
      if(!isAdmin){
        if(ids.stream().noneMatch(id->isOwnerJob(companyId,id))){
          throw new PermissionDeniedException("you do not have permission");
        }
      }
      if(isDestroy)
        ids.forEach(this::destroyJobById);
      else
        ids.forEach(this::deleteJobById);
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
  public boolean isOwnerJob(Long companyId,Long jobId) {
    Job job = getJob(jobId);
    return job.getCompany().getCompanyId().equals(companyId);
  }
  @Transactional
  public ResponseEntity<ResponseObjectDTO> deleteJob(Long id) {
    Map<String, Object> responseData = new HashMap<>();
    Optional<Job> jobOptional = jobRepository.findById(id);
    if (jobOptional.isPresent()) {
      Job job = jobOptional.get();
      Long ownerId = job.getCompany().getCreatedUser().getUserId();
      authService.checkPermission(ownerId);
      deleteJob(job);
      JobCreationDTO jobCreationDTO = JobMapper.toDTO(job);
      responseData.put("jobDeleted", jobCreationDTO);
      ResponseObjectDTO responseObjectDTO = new ResponseObjectDTO(
        "delete job successfully "
        ,responseData);
      return ResponseEntity.ok(responseObjectDTO);
    }
    else{
      InputNotValidException inputNotValidException = new InputNotValidException("job is not found");
      inputNotValidException.getCauses().put("invalidId", id);
      throw inputNotValidException;
    }
  }
  public long getAmountOfJobs(Long companyId){
    JobSpecification jobSpecification = new JobSpecification();
    SearchCriteria<Job,Company> searchCriteria =
      new SearchCriteria<>(Job_.company, Company.builder().companyId(companyId).build(), SearchOperator.EQUAL);
    jobSpecification.getConditions().add(searchCriteria);
    return jobRepository.count(jobSpecification);
  }
  public long getAmountOfJobByApplication(Long userId, ApplicationStatus applicationStatus){
    Specification<Job> specification = JobSpecification.joinApplications(userId, applicationStatus);
    return jobRepository.count(specification);
  }
  public void deleteJob(Job job) {
    job.removeAllRelationShip();
    jobRepository.delete(job);
  }
  public void deleteJobById(Long id) {
    Optional<Job> jobOptional = jobRepository.findById(id);
    if(jobOptional.isPresent()){
      Job job = jobOptional.get();
      job.removeAllRelationShip();
      jobRepository.delete(job);
    }
  }
  public void destroyJobById(Long id) {
    Optional<Job> jobOptional = jobRepository.findById(id);
    if(jobOptional.isPresent()){
      Job job = jobOptional.get();
      job.setDeletedAt(new Date());
      jobRepository.save(job);
    }
  }
  public List<Job> getFollowedJobs(PageableDTO pageableDTO, Long userId){
    int  start = (pageableDTO.getSize()* (pageableDTO.getPage())) - pageableDTO.getSize();
    List<Job> jobs = jobRepository.getFollowedJobs(userId, start, pageableDTO.getSize()+1);
    return jobs;
  }

  public ResponseEntity<ResponseDataDTO<JobCreationDTO>> responseGetFollowedJobs(PageableDTO pageableDTO){
    Long userId = myUserDetailsService.getCurrentUserId();
    List<Job> jobs = getFollowedJobs(pageableDTO, userId);
    List<JobCreationDTO> jobDTOS = jobs.stream().map(JobMapper::toDTO).toList();
    long totalElement =jobRepository.countFollowedJobs(userId);
    long lastPage = PageUtil.calculateLastPage(pageableDTO.getSize(),totalElement );
    return ResponseEntity.ok(new ResponseDataDTO<>("Get Followed Jobs Successfully", jobDTOS,  lastPage, totalElement));
  }
  public List<Skill> getAllSkills() {
    return skillRepository.findAll();
  }
  public List<Position> getAllPositions() {
    return positionRepository.findAll();
  }
  public List<WorkPlace> getAllWorkPlaces() {
    return workPlaceRepository.findAll();
  }
  public List<EmploymentType> getAllEmploymentType() {
    return employmentTypeRepository.findAll();
  }
  public long getAmountOfAllJobs() {
    return jobRepository.count();
  }
  public ResponseEntity<ResponseDataDTO<AmountsPerMonth>> getJobAmountsPerMonths(){
    List<AmountsPerMonth> amountsPerMonths = jobRepository.getJobAmountsPerMonth();
    return ResponseEntity.ok(new ResponseDataDTO<>("Get Amount Of Jobs Per Month Successfully"
      ,amountsPerMonths, null, (long) amountsPerMonths.size()));
  }


}