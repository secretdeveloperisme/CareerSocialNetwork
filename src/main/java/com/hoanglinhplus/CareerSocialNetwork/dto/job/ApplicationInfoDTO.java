package com.hoanglinhplus.CareerSocialNetwork.dto.job;

import com.hoanglinhplus.CareerSocialNetwork.constants.ApplicationStatus;
import com.hoanglinhplus.CareerSocialNetwork.dto.user.UserCreationDTO;
import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
@Builder
public class ApplicationInfoDTO {
  private UserCreationDTO user;
  private JobCreationDTO job;
  @Builder.Default
  private ApplicationStatus status = ApplicationStatus.PENDING;
}
