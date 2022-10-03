package com.hoanglinhplus.CareerSocialNetwork.dto.job;

import com.hoanglinhplus.CareerSocialNetwork.constants.ApplicationStatus;
import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
@Builder
public class ApplicationDTO {
  private Long userId;
  private Long jobId;
  @Builder.Default
  private ApplicationStatus status = ApplicationStatus.PENDING;
}
