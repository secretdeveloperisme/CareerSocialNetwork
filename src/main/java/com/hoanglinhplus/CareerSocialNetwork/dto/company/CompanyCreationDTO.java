package com.hoanglinhplus.CareerSocialNetwork.dto.company;

import com.hoanglinhplus.CareerSocialNetwork.dto.IndustryDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.OrganizationSizeDTO;
import lombok.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class CompanyCreationDTO {
  private Long companyId;
  private String name;
  private String website;
  private String logo;
  private String tagLine;
  private OrganizationSizeDTO organizationSize;
  private IndustryDTO industry;
  private Long userId;
}
