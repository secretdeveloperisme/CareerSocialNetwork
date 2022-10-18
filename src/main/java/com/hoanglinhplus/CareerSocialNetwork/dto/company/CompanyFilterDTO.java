package com.hoanglinhplus.CareerSocialNetwork.dto.company;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.Size;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class CompanyFilterDTO {
  private Long companyId;
  @Size(min = 1, max = 255, message = "name's length must be from 1 to 255")
  private String name;
  private Long organizationId;
  private Long industryId;
  private Long userId;
  private Boolean isDeleted = null;
}
