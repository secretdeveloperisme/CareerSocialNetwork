package com.hoanglinhplus.CareerSocialNetwork.models.projection;

import com.hoanglinhplus.CareerSocialNetwork.constants.ExternalLoginType;

import java.util.Date;

/**
 * A Projection for the {@link com.hoanglinhplus.CareerSocialNetwork.models.User} entity
 */
public interface UserInfo {
  Long getUserId();

  String getUsername();

  String getPasswordHash();

  String getEmail();

  String getFullname();

  String getGender();

  String getBiography();

  String getAvatar();

  String getAddress();

  String getCvUrl();

  Date getDob();

  ExternalLoginType getExternalLoginType();

  boolean isIsEnabled();

  String getExternalLoginId();

  Date getCreatedAt();

  Date getUpdatedAt();

  Date getDeletedAt();
}