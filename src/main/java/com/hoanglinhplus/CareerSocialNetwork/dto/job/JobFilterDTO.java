package com.hoanglinhplus.CareerSocialNetwork.dto.job;

import com.hoanglinhplus.CareerSocialNetwork.constants.NumberConstant;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class JobFilterDTO {
  private Long jobId;
  private String title;
  private String location;
  private int salary = NumberConstant.NO_SET;
  private float experience = 0;
  private List<Long> tagIds;
  private List<Long> jobSkillIds;
  private Long employmentTypeId;
  private Long companyId;
  private Long positionId;
  private Long workPlaceId;
}
