package com.hoanglinhplus.CareerSocialNetwork.dto.company_user_role;

import com.hoanglinhplus.CareerSocialNetwork.dto.company.CompanyCreationDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.user.UserDTO;
import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder
public class UpdateCompanyUserRoleDTO {
  private Long userId;
  private Long companyId;
  private Long oldCompanyRoleId;
  private Long newCompanyRoleId;
}
