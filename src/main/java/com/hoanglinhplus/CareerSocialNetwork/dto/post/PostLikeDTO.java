package com.hoanglinhplus.CareerSocialNetwork.dto.post;

import com.hoanglinhplus.CareerSocialNetwork.constants.TypeLike;
import lombok.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class PostLikeDTO {
  Long postId;
  Long userId;
  TypeLike typeLike;
}
