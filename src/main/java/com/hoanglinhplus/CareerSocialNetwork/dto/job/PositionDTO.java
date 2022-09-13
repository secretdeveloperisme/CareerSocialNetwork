package com.hoanglinhplus.CareerSocialNetwork.dto.job;

import lombok.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class PositionDTO {
  private Long positionId;
  private String name;
}
