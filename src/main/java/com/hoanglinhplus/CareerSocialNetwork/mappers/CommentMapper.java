package com.hoanglinhplus.CareerSocialNetwork.mappers;

import com.hoanglinhplus.CareerSocialNetwork.dto.comment.CommentDTO;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.InputNotValidException;
import com.hoanglinhplus.CareerSocialNetwork.models.Comment;
import com.hoanglinhplus.CareerSocialNetwork.models.Job;
import com.hoanglinhplus.CareerSocialNetwork.models.Post;

public class CommentMapper extends ModelMapperConfig{
  public static Comment toEntity(CommentDTO commentDTO){
     Comment comment = modelMapper.map(commentDTO, Comment.class);
     if(commentDTO.getParentCommentId() != null)
       comment.setParentComment(Comment.builder().commentId(commentDTO.getParentCommentId()).build());

     Long jobId = commentDTO.getJobId();
     Long postId = commentDTO.getPostId();
     if(jobId == null && postId == null)
       throw new InputNotValidException("Comment is not valid because it does have target post or job");
     if(jobId != null)
        comment.setJob(Job.builder().jobId(commentDTO.getJobId()).build());
     if(postId != null)
        comment.setPost(Post.builder().postId(commentDTO.getPostId()).build());
     return comment;
  }
  public static CommentDTO toDTO(Comment comment){
    CommentDTO commentDTO = modelMapper.map(comment, CommentDTO.class);
    if(comment.getParentComment()!= null)
      commentDTO.setParentCommentId(comment.getParentComment().getCommentId());
    commentDTO.setUserId(comment.getUser().getUserId());
    if(comment.getJob() != null)
      commentDTO.setJobId(comment.getJob().getJobId());
    if(comment.getPost() != null)
      commentDTO.setPostId(comment.getPost().getPostId());
    return commentDTO;
  }
}
