package com.hoanglinhplus.CareerSocialNetwork.services;

import com.hoanglinhplus.CareerSocialNetwork.dto.comment.CommentDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.comment.CommentFilterDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.user.UserCreationDTO;
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

import javax.transaction.Transactional;
import java.util.*;

@Service
@DynamicUpdate
public class CommentService {
  private final CommentRepository commentRepository;
  private final CommentLikeService commentLikeService;
  private final PermissionService permissionService;
  private final MyUserDetailsService myUserDetailsService;
  private final UserService userService;
  @Autowired
  public CommentService(CommentRepository commentRepository, CommentLikeService commentLikeService, PermissionService permissionService, MyUserDetailsService myUserDetailsService, UserService userService) {
    this.commentRepository = commentRepository;
    this.commentLikeService = commentLikeService;
    this.permissionService = permissionService;
    this.myUserDetailsService = myUserDetailsService;
    this.userService = userService;
  }
  public ResponseEntity<ResponseObjectDTO> createComment(CommentDTO commentDTO) {
    commentDTO.setUser(UserCreationDTO.builder().userId(myUserDetailsService.getCurrentUserId()).build());
    Comment comment = CommentMapper.toEntity(commentDTO);
    Comment createdComment = commentRepository.save(comment);
    createdComment.setUser(userService.getUser(comment.getUser().getUserId()));
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

      deleteCommentRecursive(targetComment);
      Map<String, Object> responseData = new HashMap<>();
      CommentDTO commentDTO = CommentMapper.toDTO(targetComment);
      responseData.put("comment", commentDTO);
      return ResponseEntity.ok(new ResponseObjectDTO("Delete Comment Successfully", responseData));
    }
    throw new PermissionDeniedException("You dont have permission to delete this comment [%s]".formatted(commentId));
  }

  public ResponseEntity<ResponseObjectDTO> responseGetAllComments(Long jobId){
    return ResponseEntity.ok(new ResponseObjectDTO("Get All Comments Successfully", getAllComments(CommentFilterDTO.builder().jobId(jobId).build())));
  }
  public Map<String, Object> getAllComments(CommentFilterDTO commentFilterDTO) {
    Long currentUserId = myUserDetailsService.getCurrentUserId();
    Long jobId = commentFilterDTO.getJobId();
    Long postId = commentFilterDTO.getPostId();
    CommentSpecification commentSpecification  = new CommentSpecification();
    if(jobId != null){
      SearchCriteria<Comment, Job> criteria = new SearchCriteria<>(Comment_.job,Job.builder().jobId(jobId).build(), SearchOperator.EQUAL );
      commentSpecification.getConditions().add(criteria);
    }
    if(postId != null){
      SearchCriteria<Comment, Post> criteria = new SearchCriteria<>(Comment_.post,Post.builder().postId(postId).build(), SearchOperator.EQUAL );
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
    Map<String, Object> data = new HashMap<>();
    data.put("jobId", jobId);
    data.put("comments", commentDTOS);
    data.put("numberOfComments", (long)allComments.size());
    return data;
  }
  @Transactional
  public void deleteCommentRecursive(Comment comment) {
    CommentSpecification commentSpecification  = new CommentSpecification();
    SearchCriteria<Comment, Comment> commentChildrenSearch = new SearchCriteria<>(Comment_.parentComment,comment, SearchOperator.EQUAL);
    commentSpecification.getConditions().add(commentChildrenSearch);
    List<Comment> childrenComments = commentRepository.findAll(commentSpecification);
    if (childrenComments.size() > 0)
      childrenComments.forEach(this::deleteCommentRecursive);
    commentLikeService.removeCommentLikes((List<CommentLike>) comment.getCommentLikes());
    commentRepository.delete(comment);
  }
}
