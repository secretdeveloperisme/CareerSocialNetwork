package com.hoanglinhplus.CareerSocialNetwork.mappers;

import com.hoanglinhplus.CareerSocialNetwork.dto.job_action.LikeDTO;
import com.hoanglinhplus.CareerSocialNetwork.models.Like;

public class LikeMapper extends ModelMapperConfig{
  static public Like toEntity(LikeDTO likeDTO) {
    Like like = modelMapper.map(likeDTO, Like.class);
    return like;
  }
  static public LikeDTO toDTO(Like like) {
    return modelMapper.map(like, LikeDTO.class);
  }
}
