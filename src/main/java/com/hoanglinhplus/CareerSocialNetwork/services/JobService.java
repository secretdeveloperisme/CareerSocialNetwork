package com.hoanglinhplus.CareerSocialNetwork.services;

import com.hoanglinhplus.CareerSocialNetwork.constants.NumberConstant;
import com.hoanglinhplus.CareerSocialNetwork.constants.PageConstant;
import com.hoanglinhplus.CareerSocialNetwork.dto.PageableDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.TagDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.job.JobCreationDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.job.JobFilterDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.InputNotValidException;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.NotFoundException;
import com.hoanglinhplus.CareerSocialNetwork.mappers.JobMapper;
import com.hoanglinhplus.CareerSocialNetwork.mappers.ResponseJobMapper;
import com.hoanglinhplus.CareerSocialNetwork.models.*;
import com.hoanglinhplus.CareerSocialNetwork.models.Job_;
import com.hoanglinhplus.CareerSocialNetwork.repositories.CompanyRepository;
import com.hoanglinhplus.CareerSocialNetwork.repositories.JobRepository;
import com.hoanglinhplus.CareerSocialNetwork.repositories.UserRepository;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.JobSpecification;
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
import java.util.stream.Collectors;


@Service
public class JobService {
  private final UserRepository userRepository;
  private final JobRepository jobRepository;
  private final CompanyRepository companyRepository;
  private final MyUserDetailsService myUserDetailsService;
  private final AuthService authService;
  private final TagService tagService;

  @Autowired
  public JobService(UserRepository userRepository, JobRepository jobRepository
    , CompanyRepository companyRepository
    , MyUserDetailsService myUserDetailsService, AuthService authService, TagService tagService){
    this.userRepository = userRepository;
    this.jobRepository = jobRepository;
    this.companyRepository = companyRepository;
    this.myUserDetailsService = myUserDetailsService;
    this.authService = authService;
    this.tagService = tagService;
  }
  public ResponseEntity<ResponseObjectDTO> getJob(Long jobId){
    Optional<Job> jobOptional = jobRepository.findById(jobId);
    if(jobOptional.isPresent()){
      JobCreationDTO jobCreationDTO = JobMapper.toDTO(jobOptional.get());
      Map<String, Object> responseData = new HashMap<>();
      responseData.put("company", jobCreationDTO);
      return ResponseEntity.ok(new ResponseObjectDTO("get job successfully ",responseData));
    }
    throw new NotFoundException("Job not found", "id", jobId.toString());
  }
  public ResponseEntity<ResponseObjectDTO> getJobs(JobFilterDTO jobFilterDTO, PageableDTO pageableDTO){
    JobSpecification jobSpecification = new JobSpecification();
    String title = jobFilterDTO.getTitle();
    String location = jobFilterDTO.getLocation();
    int salary = jobFilterDTO.getSalary();
    Float experience = jobFilterDTO.getExperience();
    List<Long> tagIds = jobFilterDTO.getTagIds();
    List<Long> jobSkillIds = jobFilterDTO.getJobSkillIds();
    Long employmentTypeId = jobFilterDTO.getEmploymentTypeId();
    Long companyId = jobFilterDTO.getCompanyId();
    Long positionId = jobFilterDTO.getPositionId();
    Long workPlaceId = jobFilterDTO.getWorkPlaceId();
    if( title != null && !title.isEmpty()){
      SearchCriteria<Job, String> criteria = new SearchCriteria<>(Job_.title, title, SearchOperator.LIKE);
      jobSpecification.getConditions().add(criteria);
    }
    if( location != null && !location.isEmpty()){
      SearchCriteria<Job, String> criteria = new SearchCriteria<>(Job_.location, title, SearchOperator.LIKE);
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
    Specification<Job> resultSpecification = jobSpecification;
    if(tagIds != null){
       Specification<Job> tagSpecification = JobSpecification.joinTags(tagIds);
       resultSpecification = resultSpecification.and(tagSpecification);
    }
    if(jobSkillIds!= null){
      Specification<Job> skillSpecification = JobSpecification.joinSkills(jobSkillIds);
      resultSpecification = resultSpecification.and(skillSpecification);
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
    Page<Job> jobPage;
    Pageable pageable = PageRequest.of(pageableDTO.getPage(),pageableDTO.getSize(),Sort.by(orders));
    if(!jobSpecification.getConditions().isEmpty()){
      jobPage = jobRepository.findAll(resultSpecification, pageable);
    }
    else{
      jobPage = jobRepository.findAll(resultSpecification, pageable);
    }
    return ResponseEntity.ok(ResponseJobMapper.toDTO(jobPage));
  }
  @Transactional
  public ResponseEntity<ResponseObjectDTO> createJob(JobCreationDTO jobUpdateDTO) {
    Job job = JobMapper.toEntity(jobUpdateDTO);
    Long userId = myUserDetailsService.getCurrentUserId();
    Optional<Company> company = companyRepository.findById(jobUpdateDTO.getCompany().getCompanyId());
    if (company.isPresent()) {
      Optional<User> userOptional = userRepository.findById(userId);
      if (userOptional.isPresent()) {
        List<Tag> tags = tagService.createTags(jobUpdateDTO.getTags().stream().map(TagDTO::getName).toList());
        job.setTags(tags);
        Job savedJob = jobRepository.save(job);
        Map<String, Object> responseData = new HashMap<>();
        JobCreationDTO savedCompanyDTO = JobMapper.toDTO(savedJob);
        responseData.put("createdCompany", savedCompanyDTO);
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
      authService.checkPermission(targetJob.getCompany().getCreatedUser().getUserId());
      if(jobUpdateDTO.getTitle() != null){
        targetJob.setTitle(jobUpdateDTO.getTitle());
      }
      if(jobUpdateDTO.getJobDescription() != null){
       targetJob.setJobDescription(jobUpdateDTO.getJobDescription());
      }
      if(jobUpdateDTO.getImage() != null){
        targetJob.setImage(jobUpdateDTO.getImage());
      }
      if(jobUpdateDTO.getAmount() != NumberConstant.NO_SET){
        targetJob.setAmount(jobUpdateDTO.getAmount());
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
      responseData.put("updatedCompany", updatedJobDTO);
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
  public ResponseEntity<ResponseObjectDTO> deleteJobs(List<Long> ids) {
    List<Long> notExistIds = new ArrayList<>();
    List<Long> existedIds = jobRepository.findExistedIds(ids);
    ids.forEach(id->{
      if(!existedIds.contains(id))
        notExistIds.add(id);
    });
    if(notExistIds.size() == 0){
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
}