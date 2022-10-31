package com.hoanglinhplus.CareerSocialNetwork.models;

import com.hoanglinhplus.CareerSocialNetwork.constants.TypeLike;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;

@AllArgsConstructor
@NoArgsConstructor
@Getter @Setter
public class PostLikeId implements Serializable {
  Long userId;
  Long postId;
  TypeLike typeLike;
}
