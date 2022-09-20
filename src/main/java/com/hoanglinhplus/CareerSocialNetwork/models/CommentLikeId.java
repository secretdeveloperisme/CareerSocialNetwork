package com.hoanglinhplus.CareerSocialNetwork.models;

import lombok.*;

import java.io.Serializable;

@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class CommentLikeId implements Serializable {
  private Long commentId;
  private Long userId;
}
