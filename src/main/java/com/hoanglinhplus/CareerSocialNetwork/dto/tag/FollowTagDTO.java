package com.hoanglinhplus.CareerSocialNetwork.dto.tag;

import lombok.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class FollowTagDTO {
  private Long userId;
  private Long tagId;
}
