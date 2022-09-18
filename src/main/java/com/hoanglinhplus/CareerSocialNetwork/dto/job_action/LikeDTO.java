package com.hoanglinhplus.CareerSocialNetwork.dto.job_action;

import com.hoanglinhplus.CareerSocialNetwork.constants.TypeLike;
import lombok.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class LikeDTO {
  Long jobId;
  Long userId;
  TypeLike typeLike;
}
