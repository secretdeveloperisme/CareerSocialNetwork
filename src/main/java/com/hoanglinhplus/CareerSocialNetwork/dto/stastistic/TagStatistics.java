package com.hoanglinhplus.CareerSocialNetwork.dto.stastistic;

import lombok.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class TagStatistics {
  private Long amountOfPublishedJobs;
  private Long amountOfFollowers;
}
