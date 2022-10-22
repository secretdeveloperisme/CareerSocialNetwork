package com.hoanglinhplus.CareerSocialNetwork.services;

import com.hoanglinhplus.CareerSocialNetwork.constants.ApplicationStatus;
import com.hoanglinhplus.CareerSocialNetwork.dto.job.ApplicationDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.job.ApplicationInfoDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.NotFoundException;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.PermissionDeniedException;
import com.hoanglinhplus.CareerSocialNetwork.mappers.ApplicationMapper;
import com.hoanglinhplus.CareerSocialNetwork.models.Application;
import com.hoanglinhplus.CareerSocialNetwork.models.ApplicationId;
import com.hoanglinhplus.CareerSocialNetwork.models.Application_;
import com.hoanglinhplus.CareerSocialNetwork.models.User;
import com.hoanglinhplus.CareerSocialNetwork.repositories.ApplicationRepository;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.ApplicationSpecification;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.SearchCriteria;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.SearchOperator;
import com.hoanglinhplus.CareerSocialNetwork.securities.MyUserDetailsService;
import com.hoanglinhplus.CareerSocialNetwork.securities.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public class ApplicationService {
  private final ApplicationRepository applicationRepository ;
  private final MyUserDetailsService myUserDetailsService;
  private final PermissionService permissionService;
  private final UserService userService;
  @Autowired
  public ApplicationService(ApplicationRepository applicationRepository, MyUserDetailsService myUserDetailsService, PermissionService permissionService, UserService userService) {
    this.applicationRepository = applicationRepository;
    this.myUserDetailsService = myUserDetailsService;
    this.permissionService = permissionService;
    this.userService = userService;
  }
  List<Application> getApplications(ApplicationDTO applicationDTO) {
    ApplicationSpecification applicationSpecification = new ApplicationSpecification();
    if(applicationDTO.getUserId() != null) {
      SearchCriteria<Application, Long> userIdCriteria = new SearchCriteria<>(Application_.userId, applicationDTO.getUserId(), SearchOperator.EQUAL);
      applicationSpecification.getConditions().add(userIdCriteria);
    }
    if(applicationDTO.getJobId() != null) {
      SearchCriteria<Application, Long> jobIdCriteria = new SearchCriteria<>(Application_.jobId, applicationDTO.getJobId(), SearchOperator.EQUAL);
      applicationSpecification.getConditions().add(jobIdCriteria);
    }
    if(applicationDTO.getStatus() != null) {
      SearchCriteria<Application, ApplicationStatus> statusSearchCriteria = new SearchCriteria<>(Application_.status, applicationDTO.getStatus(), SearchOperator.EQUAL);
      applicationSpecification.getConditions().add(statusSearchCriteria);
    }
    return applicationRepository.findAll(applicationSpecification);
  }
  public ResponseEntity<ResponseObjectDTO> responseUpdateStatus(ApplicationDTO applicationDTO){
    Optional<Application> applicationOptional = applicationRepository.findById(new ApplicationId(applicationDTO.getUserId(), applicationDTO.getJobId()));
    if(applicationOptional.isEmpty())
      throw new NotFoundException("Application is not found", applicationDTO.toString(), "ID");
    if (!permissionService.isOwnerJob(myUserDetailsService.getCurrentUserId(), applicationDTO.getJobId())){
      throw new PermissionDeniedException("You do not have permission to change status application");
    }
    Application targetApplication = applicationOptional.get();
    targetApplication.setStatus(applicationDTO.getStatus());
    applicationRepository.save(targetApplication);
    Map<String, Object > responseData = new HashMap<>();
    responseData.put("application", applicationDTO);
    return ResponseEntity.ok(new ResponseObjectDTO("Update application Status Successfully", responseData));
  }
  public ResponseEntity<List<ApplicationInfoDTO>> responseGetJobApplication(ApplicationDTO applicationDTO){
    List<Application> applications = getApplications(applicationDTO);
    List<ApplicationInfoDTO> applicationInfoDTOS = applications.stream().map(ApplicationMapper::toInfoDTO).toList();
    return ResponseEntity.ok(applicationInfoDTOS);
  }
  public ResponseEntity<ResponseObjectDTO> responseApply(ApplicationDTO applicationDTO){
    Map<String, Object> data = apply(applicationDTO);
    if(data.get("action").equals("CREATE")){
      return ResponseEntity.ok(new ResponseObjectDTO("Application " +applicationDTO.getStatus().name()+" job successfully ",data));
    }
    return ResponseEntity.ok(new ResponseObjectDTO("Delete Application Successfully", null));
  }
  public Map<String, Object> apply(ApplicationDTO applicationDTO){
    Long currentUserId = myUserDetailsService.getCurrentUserId();
    applicationDTO.setUserId(currentUserId);
    applicationDTO.setStatus(ApplicationStatus.PENDING);
    Application application = ApplicationMapper.toEntity(applicationDTO);
    List<Application> applications = getApplications(applicationDTO);
    Map<String, Object> responseData = new HashMap<>();
    if(applications != null && !applications.isEmpty()){
      applicationRepository.delete(applications.get(0));
      responseData.put("action", "DELETE");
      return responseData;
    }
    Application savedApplication = applicationRepository.save(application);
    responseData.put("action", "CREATE");
    responseData.put("application", savedApplication);
    return responseData;
  }
  public ResponseEntity<ResponseObjectDTO> responseGetNumberOfApplications(Long jobId){
    return ResponseEntity.ok(new ResponseObjectDTO("Get Number Of Application Successfully",getNumberOfApplications(jobId)));
  }
  public Map<String, Object> getNumberOfApplications(Long jobId){
    List<Application> pendingApplications = getApplications(ApplicationDTO.builder().jobId(jobId).status(ApplicationStatus.PENDING).build());
    int numberOfPendingApplication = pendingApplications.size();
    List<Application> approvedApplications = getApplications(ApplicationDTO.builder().jobId(jobId).status(ApplicationStatus.APPROVED).build());
    int numberOfApprovedApplication = approvedApplications.size();
    List<Application> completedApplication = getApplications(ApplicationDTO.builder().jobId(jobId).status(ApplicationStatus.COMPLETED).build());
    int numberOfCompletedApplication = completedApplication.size();
    int total = numberOfPendingApplication + numberOfApprovedApplication + numberOfCompletedApplication;
    Map<String, Object> data = new HashMap<>();
    data.put("numberOfPendingApplications", numberOfPendingApplication);
    data.put("numberOfApprovedApplications", numberOfApprovedApplication);
    data.put("numberOfCompletedApplications", numberOfCompletedApplication);
    data.put("totalApplications", total);
    return data;
  }
  public long getNumberOfUserApplications(Long userId){
    User user = userService.getUser(userId);
    return user.getApplications().size();

  }
  public ResponseEntity<ResponseObjectDTO> haveApplication(Long jobId){
    Long userId = myUserDetailsService.getCurrentUserId();
    List<Application> applications = getApplications(ApplicationDTO.builder().jobId(jobId).userId(userId).build());
    Map<String, Object> responseData = new HashMap<>();
    if(applications != null && !applications.isEmpty()){
      responseData.put("typeApplication", applications.get(0).getStatus());
    }
    return ResponseEntity.ok(new ResponseObjectDTO("Get Having Application Successfully",responseData));
  }
}
