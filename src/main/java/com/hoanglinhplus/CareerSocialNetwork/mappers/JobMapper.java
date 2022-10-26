package com.hoanglinhplus.CareerSocialNetwork.mappers;

import com.hoanglinhplus.CareerSocialNetwork.dto.SkillDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.tag.TagDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.company.CompanyCreationDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.job.EmploymentTypeDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.job.JobCreationDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.job.PositionDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.job.WorkPlaceDTO;
import com.hoanglinhplus.CareerSocialNetwork.models.*;
import org.modelmapper.Conditions;
import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class JobMapper {
  static public Job toEntity(JobCreationDTO jobCreationDTO) {
    ModelMapper modelMapper = new ModelMapper();
    modelMapper.getConfiguration()
      .setMatchingStrategy(MatchingStrategies.STRICT)
      .setDeepCopyEnabled(true)
      .setPropertyCondition(Conditions.isNotNull());
    Job job = modelMapper.map(jobCreationDTO, Job.class);
    List<TagDTO> tagDTOs = jobCreationDTO.getTags();
    if(tagDTOs != null){
      job.setTags(tagDTOs.stream().map(tagDTO -> Tag.builder().tagId(tagDTO.getTagId()).build()).toList());
    }
    List<SkillDTO> skillDTOs = jobCreationDTO.getJobSkills();
    if(skillDTOs != null){
      job.setJobSkills(skillDTOs.stream().map(skillDTO -> Skill.builder().skillId(skillDTO.getSkillId()).build()).toList());
    }
    EmploymentTypeDTO employmentTypeDTO = jobCreationDTO.getEmploymentType();
    if(employmentTypeDTO != null){
      job.setEmploymentType(EmploymentType.builder().employmentTypeId(employmentTypeDTO.getEmploymentTypeId()).build());
    }
    CompanyCreationDTO companyCreationDTO = jobCreationDTO.getCompany();
    if(companyCreationDTO != null){
      job.setCompany(Company.builder().companyId(companyCreationDTO.getCompanyId()).build());
    }
    PositionDTO positionDTO = jobCreationDTO.getPosition();
    if(positionDTO != null){
      job.setPosition(Position.builder().positionId(positionDTO.getPositionId()).build());
    }
    WorkPlaceDTO workPlaceDTO = jobCreationDTO.getWorkPlace();
    if(workPlaceDTO != null){
      job.setWorkPlace(WorkPlace.builder().workPlaceId(workPlaceDTO.getWorkPlaceId()).build());
    }
    return job;
  }
  static public JobCreationDTO toDTO(Job job) {
    ModelMapper modelMapper = new ModelMapper();
    modelMapper.getConfiguration()
      .setMatchingStrategy(MatchingStrategies.STRICT)
      .setDeepCopyEnabled(true)
      .setPropertyCondition(Conditions.isNotNull());
    JobCreationDTO jobCreationDTO = modelMapper.map(job, JobCreationDTO.class);
    List<Tag> tags = job.getTags();
    if(tags != null){
      jobCreationDTO.setTags(tags.stream().map(tag ->
        TagDTO.builder().tagId(tag.getTagId()).name(tag.getName()).build()).toList());
    }
    List<Skill> skills = job.getJobSkills();
    if(skills != null){
      jobCreationDTO.setJobSkills(skills.stream()
        .map(skill ->
          SkillDTO.builder().skillId(skill.getSkillId()).name(skill.getName()).build()).toList());
    }
    EmploymentType employmentType = job.getEmploymentType();
    if(employmentType != null){
      jobCreationDTO.setEmploymentType(EmploymentTypeDTO.builder()
        .employmentTypeId(employmentType.getEmploymentTypeId())
        .name(employmentType.getName())
        .build());
    }
    Company company = job.getCompany();
    if(company != null){
      jobCreationDTO.setCompany(CompanyCreationDTO.builder()
        .companyId(company.getCompanyId()).name(company.getName())
        .build());
    }
    Position position = job.getPosition();
    if(position != null){
      jobCreationDTO.setPosition(PositionDTO.builder()
        .positionId(position.getPositionId()).name(position.getName())
        .build());
    }
    WorkPlace workPlace = job.getWorkPlace();
    if(workPlace != null){
      jobCreationDTO.setWorkPlace(WorkPlaceDTO.builder()
        .workPlaceId(workPlace.getWorkPlaceId()).place(workPlace.getPlace())
        .build());
    }
    return jobCreationDTO;
  }
}
