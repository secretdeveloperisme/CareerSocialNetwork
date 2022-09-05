package com.hoanglinhplus.CareerSocialNetwork.services;

import com.hoanglinhplus.CareerSocialNetwork.models.Education;
import com.hoanglinhplus.CareerSocialNetwork.models.User;
import com.hoanglinhplus.CareerSocialNetwork.repositories.EducationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class EducationService {
  EducationRepository educationRepository;
  @Autowired
  public EducationService(EducationRepository educationRepository) {
    this.educationRepository = educationRepository;
  }
  public void updateEducation(List<Education> educations){
    educations.forEach(education -> {
      Optional<Education> educationOptional= educationRepository.findById(education.getEducationId());
      if(educationOptional.isPresent()){
        Education educationEntity = educationOptional.get();
        if(education.getSchoolName()  != null){
          educationEntity.setSchoolName(education.getSchoolName());
        }
        if(education.getStartDate()  != null){
          educationEntity.setStartDate(education.getStartDate());
        }
        if(education.getEndDate()  != null){
          educationEntity.setEndDate(education.getEndDate());
        }
        if(education.getGrade()  >  0){
          educationEntity.setGrade(education.getGrade());
        }
        educationRepository.save(educationEntity);
      }
    });
  }
  public void createEducations(List<Education> educations, User user){
    educations.forEach(education -> {
      education.setUser(user);
      educationRepository.save(education);
    });
  }
}
