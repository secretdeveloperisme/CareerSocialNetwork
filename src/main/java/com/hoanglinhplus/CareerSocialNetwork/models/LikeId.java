package com.hoanglinhplus.CareerSocialNetwork.models;

import com.hoanglinhplus.CareerSocialNetwork.constants.TypeLike;
import lombok.*;

import java.io.Serializable;

@AllArgsConstructor
@NoArgsConstructor
@Getter @Setter
public class LikeId implements Serializable {
  Long userId;
  Long jobId;
  TypeLike typeLike;
}
