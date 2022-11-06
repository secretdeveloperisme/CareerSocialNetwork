package com.hoanglinhplus.CareerSocialNetwork.models.projection;

import com.hoanglinhplus.CareerSocialNetwork.constants.PostStatus;

import java.util.Date;

/**
 * A Projection for the {@link com.hoanglinhplus.CareerSocialNetwork.models.Post} entity
 */
public interface PostInfo {
  Long getPostId();

  String getTitle();

  String getSlug();

  String getDescription();

  PostStatus getPostStatus();

  String getImage();

  String getContent();

  Date getCreatedAt();

  Date getUpdatedAt();

  Date getDeletedAt();
}