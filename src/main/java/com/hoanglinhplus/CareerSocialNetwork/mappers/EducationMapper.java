package com.hoanglinhplus.CareerSocialNetwork.mappers;

import com.hoanglinhplus.CareerSocialNetwork.dto.EducationDTO;
import com.hoanglinhplus.CareerSocialNetwork.models.Education;

public class EducationMapper extends ModelMapperConfig{
  public static Education toEntity(EducationDTO educationDTO) {
    return modelMapper.map(educationDTO, Education.class);
  }
  public static EducationDTO toDTO(Education message) {
    return modelMapper.map(message, EducationDTO.class);
  }
}
