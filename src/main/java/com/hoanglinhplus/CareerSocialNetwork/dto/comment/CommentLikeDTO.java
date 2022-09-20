package com.hoanglinhplus.CareerSocialNetwork.dto.comment;

import com.hoanglinhplus.CareerSocialNetwork.constants.TypeLike;
import lombok.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class CommentLikeDTO {
  Long commentId;
  Long userId;
  TypeLike typeLike;
}
