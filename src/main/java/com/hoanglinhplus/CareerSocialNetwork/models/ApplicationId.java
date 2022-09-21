package com.hoanglinhplus.CareerSocialNetwork.models;

import lombok.*;

import java.io.Serializable;

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
@EqualsAndHashCode
public class ApplicationId implements Serializable {
  private Long userId;
  private Long jobId;
}
