package com.hoanglinhplus.CareerSocialNetwork.dto.company;

import lombok.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class FollowCompanyDTO {
  private Long userId;
  private Long companyId;
}
