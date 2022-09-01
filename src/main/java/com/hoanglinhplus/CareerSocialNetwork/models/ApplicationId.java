package com.hoanglinhplus.CareerSocialNetwork.models;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;

import java.io.Serializable;

@AllArgsConstructor
@Getter
@EqualsAndHashCode
public class ApplicationId implements Serializable {
  private Long userId;
  private Long jobId;
}
