package com.hoanglinhplus.CareerSocialNetwork.mappers;

import com.hoanglinhplus.CareerSocialNetwork.dto.post.PostLikeDTO;
import com.hoanglinhplus.CareerSocialNetwork.models.PostLike;

public class PostLikeMapper extends ModelMapperConfig{
  static public PostLike toEntity(PostLikeDTO likeDTO) {
    PostLike like = modelMapper.map(likeDTO, PostLike.class);
    return like;
  }
  static public PostLikeDTO toDTO(PostLike like) {
    return modelMapper.map(like, PostLikeDTO.class);
  }
}
