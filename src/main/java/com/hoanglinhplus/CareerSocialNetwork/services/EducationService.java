package com.hoanglinhplus.CareerSocialNetwork.services;

import com.hoanglinhplus.CareerSocialNetwork.dto.EducationDTO;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.NotFoundException;
import com.hoanglinhplus.CareerSocialNetwork.mappers.EducationMapper;
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
  public Education getEducation(Long educationId){
    Optional<Education> education = educationRepository.findById(educationId);
    if (education.isEmpty())
      throw new NotFoundException("Education not found", educationId.toString(), "ID");
    return education.get();
  }
  public void deleteEducation(Long educationId){
    educationRepository.delete(Education.builder().educationId(educationId).build());
  }
  public EducationDTO updateEducation(EducationDTO educationDTO){
    Education targetEducation = getEducation(educationDTO.getEducationId());
    if(educationDTO.getSchoolName()  != null){
      targetEducation.setSchoolName(educationDTO.getSchoolName());
    }
    if(educationDTO.getStartDate()  != null){
      targetEducation.setStartDate(educationDTO.getStartDate());
    }
    if(educationDTO.getEndDate()  != null){
      targetEducation.setEndDate(educationDTO.getEndDate());
    }
    if(educationDTO.getGrade()  >  0){
      targetEducation.setGrade(educationDTO.getGrade());
    }
    Education savedEducation = educationRepository.save(targetEducation);
    return EducationMapper.toDTO(savedEducation);
  }
  public void createEducations(List<Education> educations, User user){
    educations.forEach(education -> {
      education.setUser(user);
      educationRepository.save(education);
    });
  }
  public Education createEducation(EducationDTO educationDTO){
    Education education = EducationMapper.toEntity(educationDTO);
    return educationRepository.save(education);

  }
}
