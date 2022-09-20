package com.hoanglinhplus.CareerSocialNetwork.mappers;

import com.hoanglinhplus.CareerSocialNetwork.dto.comment.CommentLikeDTO;
import com.hoanglinhplus.CareerSocialNetwork.models.CommentLike;

public class CommentLikeMapper extends ModelMapperConfig{
  static public CommentLike toEntity(CommentLikeDTO likeDTO) {
    CommentLike commentLike = modelMapper.map(likeDTO, CommentLike.class);
    return commentLike;
  }
  static public CommentLikeDTO toDTO(CommentLike commentLike) {
    return modelMapper.map(commentLike, CommentLikeDTO.class);
  }
}
