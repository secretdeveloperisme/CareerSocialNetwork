package com.hoanglinhplus.CareerSocialNetwork.mappers;

import com.hoanglinhplus.CareerSocialNetwork.dto.job.ApplicationDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.job.ApplicationInfoDTO;
import com.hoanglinhplus.CareerSocialNetwork.models.Application;

public class ApplicationMapper extends ModelMapperConfig{
  public static Application toEntity(ApplicationDTO applicationDTO) {
    Application application = modelMapper.map(applicationDTO, Application.class);
    return application;
  }
  public static ApplicationDTO toDTO(Application application) {
    ApplicationDTO applicationDTO = modelMapper.map(application, ApplicationDTO.class);
    return applicationDTO;
  }
  public static ApplicationInfoDTO toInfoDTO(Application application) {
    ApplicationInfoDTO applicationDTO = modelMapper.map(application, ApplicationInfoDTO.class);
    return applicationDTO;
  }
}
