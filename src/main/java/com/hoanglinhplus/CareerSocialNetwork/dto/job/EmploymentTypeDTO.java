package com.hoanglinhplus.CareerSocialNetwork.dto.job;

import lombok.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class EmploymentTypeDTO {
  private Long employmentTypeId;
  private String name;
}
