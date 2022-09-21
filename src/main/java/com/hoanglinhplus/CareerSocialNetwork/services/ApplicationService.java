package com.hoanglinhplus.CareerSocialNetwork.services;

import com.hoanglinhplus.CareerSocialNetwork.constants.ApplicationStatus;
import com.hoanglinhplus.CareerSocialNetwork.dto.job.ApplicationDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.mappers.ApplicationMapper;
import com.hoanglinhplus.CareerSocialNetwork.models.Application;
import com.hoanglinhplus.CareerSocialNetwork.models.Application_;
import com.hoanglinhplus.CareerSocialNetwork.repositories.ApplicationRepository;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.ApplicationSpecification;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.SearchCriteria;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.SearchOperator;
import com.hoanglinhplus.CareerSocialNetwork.securities.MyUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ApplicationService {
  private final ApplicationRepository applicationRepository ;
  private final MyUserDetailsService myUserDetailsService;
  @Autowired
  public ApplicationService(ApplicationRepository applicationRepository, MyUserDetailsService myUserDetailsService) {
    this.applicationRepository = applicationRepository;
    this.myUserDetailsService = myUserDetailsService;
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
  public ResponseEntity<ResponseObjectDTO> apply(ApplicationDTO applicationDTO){
    Long currentUserId = myUserDetailsService.getCurrentUserId();
    applicationDTO.setUserId(currentUserId);
    applicationDTO.setStatus(ApplicationStatus.PENDING);
    Application application = ApplicationMapper.toEntity(applicationDTO);
    List<Application> applications = getApplications(applicationDTO);
    if(applications != null && !applications.isEmpty()){
      applicationRepository.delete(applications.get(0));
      return ResponseEntity.ok(new ResponseObjectDTO("Delete Application Successfully", null));
    }
    Application savedApplication = applicationRepository.save(application);
    Map<String, Object> responseData = new HashMap<>();
    responseData.put("application", savedApplication);
    return ResponseEntity.ok(new ResponseObjectDTO(applicationDTO.getStatus().name()+" job successfully ",responseData));
  }
  public ResponseEntity<ResponseObjectDTO> getNumberOfApplications(Long jobId){
    List<Application> pendingApplications = getApplications(ApplicationDTO.builder().jobId(jobId).status(ApplicationStatus.PENDING).build());
    int numberOfPendingApplication = pendingApplications.size();
    List<Application> approvedApplications = getApplications(ApplicationDTO.builder().jobId(jobId).status(ApplicationStatus.APPROVED).build());
    int numberOfApprovedApplication = approvedApplications.size();
    List<Application> completedApplication = getApplications(ApplicationDTO.builder().jobId(jobId).status(ApplicationStatus.COMPLETED).build());
    int numberOfCompletedApplication = completedApplication.size();
    int total = numberOfPendingApplication + numberOfApprovedApplication + numberOfCompletedApplication;
    Map<String, Object> responseData = new HashMap<>();
    responseData.put("numberOfPendingApplications", numberOfPendingApplication);
    responseData.put("numberOfApprovedApplications", numberOfApprovedApplication);
    responseData.put("numberOfCompletedApplications", numberOfCompletedApplication);
    responseData.put("totalApplications", total);
    return ResponseEntity.ok(new ResponseObjectDTO("Get Number Of Application Successfully",responseData));
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
