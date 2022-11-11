package com.hoanglinhplus.CareerSocialNetwork.dto.company_user_role;

import lombok.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class CompanyUserRoleFilterDTO {
  private Long userId;
  private Long companyId;
  private Long companyRoleId;
}
