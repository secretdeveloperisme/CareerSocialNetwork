package com.hoanglinhplus.CareerSocialNetwork.mappers;

import com.hoanglinhplus.CareerSocialNetwork.dto.comment.CommentDTO;
import com.hoanglinhplus.CareerSocialNetwork.models.Comment;
import com.hoanglinhplus.CareerSocialNetwork.models.Job;

public class CommentMapper extends ModelMapperConfig{
  public static Comment toEntity(CommentDTO commentDTO){
     Comment comment = modelMapper.map(commentDTO, Comment.class);
     if(commentDTO.getParentCommentId() != null)
       comment.setParentComment(Comment.builder().commentId(commentDTO.getParentCommentId()).build());
     comment.setJob(Job.builder().jobId(commentDTO.getJobId()).build());
     return comment;
  }
  public static CommentDTO toDTO(Comment comment){
    CommentDTO commentDTO = modelMapper.map(comment, CommentDTO.class);
    if(comment.getParentComment()!= null)
      commentDTO.setParentCommentId(comment.getParentComment().getCommentId());
    commentDTO.setUserId(comment.getUser().getUserId());
    commentDTO.setJobId(comment.getJob().getJobId());
    return commentDTO;
  }
}
