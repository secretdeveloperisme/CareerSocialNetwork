package com.hoanglinhplus.CareerSocialNetwork.dto.post;

import lombok.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class FollowUserDTO {
  private Long following_id;
  private Long followed_id;
}
