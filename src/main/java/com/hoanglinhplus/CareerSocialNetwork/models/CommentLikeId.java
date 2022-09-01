package com.hoanglinhplus.CareerSocialNetwork.models;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter @Setter
@AllArgsConstructor
@EqualsAndHashCode
public class CommentLikeId implements Serializable {
  private Long commentId;
  private Long userId;
}
