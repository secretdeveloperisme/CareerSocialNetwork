package com.hoanglinhplus.CareerSocialNetwork.models.projection;

import java.util.Date;

/**
 * A Projection for the {@link com.hoanglinhplus.CareerSocialNetwork.models.Company} entity
 */
public interface CompanyInfo {
  Long getCompanyId();

  String getName();

  String getWebsite();

  String getLogo();

  String getTagLine();

  Date getCreatedAt();

  Date getUpdatedAt();

  Date getDeletedAt();

  UserInfo getCreatedUser();
}