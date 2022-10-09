package com.hoanglinhplus.CareerSocialNetwork.models.projection;

import java.util.Date;
import java.util.List;

/**
 * A Projection for the {@link com.hoanglinhplus.CareerSocialNetwork.models.Job} entity
 */
public interface JobInfo {
  Long getJobId();

  String getTitle();

  String getJobDescription();

  String getImage();

  String getLocation();

  int getAmount();

  Date getStartDate();

  Date getEndDate();

  int getSalaryMin();

  int getSalaryMax();

  Date getCreatedAt();

  Date getUpdatedAt();

  Date getDeletedAt();

  float getExperience();

  List<TagInfo> getTags();

  EmploymentTypeInfo getEmploymentType();

  CompanyInfo getCompany();

  PositionInfo getPosition();

  WorkPlaceInfo getWorkPlace();
}