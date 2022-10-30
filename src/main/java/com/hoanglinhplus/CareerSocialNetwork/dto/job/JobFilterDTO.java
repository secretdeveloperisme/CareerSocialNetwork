package com.hoanglinhplus.CareerSocialNetwork.dto.job;

import com.hoanglinhplus.CareerSocialNetwork.constants.NumberConstant;
import lombok.*;

import java.util.List;

@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class JobFilterDTO {
  private Long jobId;
  private String title;
  private String location;
  @Builder.Default
  private int salary = NumberConstant.NO_SET;
  @Builder.Default
  private float experience = 0;
  private List<Long> tagIds;
  private List<Long> skillIds;
  private Long employmentTypeId;
  private List<Long> employmentTypeIds;
  private Long companyId;
  private Long positionId;
  private Long workPlaceId;
  private Boolean isDeleted;
}
