package com.hoanglinhplus.CareerSocialNetwork.controllers.api;

import com.hoanglinhplus.CareerSocialNetwork.dto.comment.CommentDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.comment.CommentLikeDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.services.CommentLikeService;
import com.hoanglinhplus.CareerSocialNetwork.services.CommentService;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@RequestMapping("/api/comment")
@Validated
public class CommentController {
  private final CommentService commentService;
  private final CommentLikeService commentLikeService;

  public CommentController(CommentService commentService, CommentLikeService commentLikeService) {
    this.commentService = commentService;
    this.commentLikeService = commentLikeService;
  }
  @PostMapping
  public ResponseEntity<ResponseObjectDTO> createComment(@RequestBody @Valid CommentDTO commentDTO){
    return commentService.createComment(commentDTO);
  }
  @PutMapping
  public ResponseEntity<ResponseObjectDTO> updateComment(@RequestBody @Valid CommentDTO commentDTO){
    return commentService.updateComment(commentDTO);
  }
  @DeleteMapping("/{id}")
  public ResponseEntity<ResponseObjectDTO> deleteComment(@PathVariable("id") Long id){
    return commentService.deleteComment(id);
  }
  @GetMapping("/get-all-comments")
  public ResponseEntity<ResponseObjectDTO> getAllComments(@RequestParam Long jobId){
    return commentService.responseGetAllComments(jobId);
  }

  @PostMapping("/like")
  public ResponseEntity<ResponseObjectDTO> likeComment(@RequestBody CommentLikeDTO commentLikeDTO){
    return commentLikeService.likeComment(commentLikeDTO);
  }
  @GetMapping("/like/have-reaction")
  public ResponseEntity<ResponseObjectDTO> haveReaction(@RequestParam Long commentId){
    return commentLikeService.haveReaction(commentId);
  }
  @GetMapping("/like/get-number-of-likes")
  public ResponseEntity<ResponseObjectDTO> getNumberOfLikes(@RequestParam Long commentId){
    return commentLikeService.responseGetNumberOfLikes(commentId);
  }

}
