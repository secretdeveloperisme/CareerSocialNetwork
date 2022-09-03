package com.hoanglinhplus.CareerSocialNetwork.dto;

import lombok.*;

import java.util.Date;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder
public class EducationDTO {
  private Long educationId;
  private String schoolName;
  private Date startDate;
  private Date endDate;
  private float grade;
}
