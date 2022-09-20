package com.hoanglinhplus.CareerSocialNetwork.services;

import com.hoanglinhplus.CareerSocialNetwork.dto.comment.CommentDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.NotFoundException;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.PermissionDeniedException;
import com.hoanglinhplus.CareerSocialNetwork.mappers.CommentMapper;
import com.hoanglinhplus.CareerSocialNetwork.models.*;
import com.hoanglinhplus.CareerSocialNetwork.repositories.CommentRepository;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.CommentSpecification;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.SearchCriteria;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.SearchOperator;
import com.hoanglinhplus.CareerSocialNetwork.securities.MyUserDetailsService;
import com.hoanglinhplus.CareerSocialNetwork.securities.PermissionService;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
@DynamicUpdate
public class CommentService {
  private final CommentRepository commentRepository;
  private final PermissionService permissionService;
  private final MyUserDetailsService myUserDetailsService;
  @Autowired
  public CommentService(CommentRepository commentRepository, PermissionService permissionService, MyUserDetailsService myUserDetailsService) {
    this.commentRepository = commentRepository;
    this.permissionService = permissionService;
    this.myUserDetailsService = myUserDetailsService;
  }
  public ResponseEntity<ResponseObjectDTO> createComment(CommentDTO commentDTO) {
    Comment comment = CommentMapper.toEntity(commentDTO);
    comment.setUser(User.builder().userId(myUserDetailsService.getCurrentUserId()).build());
    Comment createdComment = commentRepository.save(comment);
    CommentDTO createdCommentDTO = CommentMapper.toDTO(createdComment);
    Map<String, Object> responseData = new HashMap<>();
    responseData.put("comment", createdCommentDTO);
    return ResponseEntity.ok(new ResponseObjectDTO("Create Comment Successfully", responseData));
  }
  public Comment getComment (Long commentId){
    Optional<Comment> comment = commentRepository.findById(commentId);
    if(comment.isPresent()){
      return comment.get();
    }
    throw new NotFoundException("Comment not found: ", commentId.toString(), "ID");
  }
  public ResponseEntity<ResponseObjectDTO> responseGetComment(Long commentId){
    Comment comment = getComment(commentId);
    CommentDTO commentDTO = CommentMapper.toDTO(comment);
    int numberOfLikes = comment.getCommentLikes().size();
    return null;
  }
  public ResponseEntity<ResponseObjectDTO> updateComment(CommentDTO commentDTO){
    Comment targetComment = getComment(commentDTO.getCommentId());
    if(permissionService.isAdmin() || (permissionService.isUser() && permissionService.isOwnerComment(targetComment)))
    {
      if(commentDTO.getContent() != null){
        targetComment.setContent(commentDTO.getContent());
      }
      Comment savedComment = commentRepository.save(targetComment);
      CommentDTO savedCommentDTO = CommentMapper.toDTO(savedComment);
      Map<String, Object> responseData = new HashMap<>();
      responseData.put("comment", savedCommentDTO);
      return ResponseEntity.ok(new ResponseObjectDTO("Update Comment Successfully", responseData));
    }
    throw new PermissionDeniedException("You dont have permission to edit this comment [%s]".formatted(commentDTO.getCommentId()) );
  }
  public ResponseEntity<ResponseObjectDTO> deleteComment(Long commentId){
    Comment targetComment = getComment(commentId);
    if(permissionService.isAdmin() || (permissionService.isUser() && permissionService.isOwnerComment(targetComment)))
    {

      commentRepository.delete(targetComment);
      Map<String, Object> responseData = new HashMap<>();
      responseData.put("comment", targetComment);
      return ResponseEntity.ok(new ResponseObjectDTO("Delete Comment Successfully", responseData));
    }
    throw new PermissionDeniedException("You dont have permission to delete this comment [%s]".formatted(commentId));
  }
  public ResponseEntity<ResponseObjectDTO> getAllComments(Long jobId){
    Long currentUserId = myUserDetailsService.getCurrentUserId();
    CommentSpecification commentSpecification  = new CommentSpecification();
    if(jobId != null){
      SearchCriteria<Comment, Job> criteria = new SearchCriteria<>(Comment_.job,Job.builder().jobId(jobId).build(), SearchOperator.EQUAL );
      commentSpecification.getConditions().add(criteria);
    }
    List<Comment> allComments = commentRepository.findAll(commentSpecification);
    List<CommentDTO> allCommentDTOS = allComments.stream().map(comment ->{
      CommentDTO commentDTO = CommentMapper.toDTO(comment);
      commentDTO.setNumberOfLikes((long) comment.getCommentLikes().size());
      Optional<CommentLike> currentAction = comment.getCommentLikes().stream().filter(commentLike ->
        commentLike.getUserId().equals(currentUserId)
      ).findAny();
      currentAction.ifPresent(commentLike -> commentDTO.setTypeLike(commentLike.getTypeLike()));
      return commentDTO;
    }).toList();
    List<CommentDTO> commentDTOS = new ArrayList<>();
    List<CommentDTO> parentCommentDTOS = new ArrayList<>();
    for (CommentDTO commentDTO : allCommentDTOS) {
      if(commentDTO.getParentCommentId() == null){
        parentCommentDTOS.add(commentDTO);
        commentDTOS.add(commentDTO);
      }
      else{
        for (CommentDTO parentCommentDTO : parentCommentDTOS) {
          if(parentCommentDTO.getCommentId().equals(commentDTO.getParentCommentId())){
            parentCommentDTO.getChildren().add(commentDTO);
            parentCommentDTOS.add(commentDTO);
            break;
          }
        }
      }
    }
    Map<String, Object> responseData = new HashMap<>();
    responseData.put("jobId", jobId);
    responseData.put("comments", commentDTOS);
    responseData.put("numberOfComments", allComments.size());
    return ResponseEntity.ok(new ResponseObjectDTO("Get All Comments Successfully", responseData));
  }
}
