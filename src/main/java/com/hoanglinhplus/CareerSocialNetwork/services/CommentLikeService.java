package com.hoanglinhplus.CareerSocialNetwork.services;

import com.hoanglinhplus.CareerSocialNetwork.constants.TypeLike;
import com.hoanglinhplus.CareerSocialNetwork.dto.comment.CommentLikeDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.job_action.LikeDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.mappers.CommentLikeMapper;
import com.hoanglinhplus.CareerSocialNetwork.models.CommentLike;
import com.hoanglinhplus.CareerSocialNetwork.models.CommentLike_;
import com.hoanglinhplus.CareerSocialNetwork.models.Like;
import com.hoanglinhplus.CareerSocialNetwork.repositories.CommentLikeRepository;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.CommentLikeSpecification;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.SearchCriteria;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.SearchOperator;
import com.hoanglinhplus.CareerSocialNetwork.securities.MyUserDetailsService;
import com.hoanglinhplus.CareerSocialNetwork.securities.PermissionService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CommentLikeService {
  private final CommentLikeRepository commentLikeRepository;
  private final MyUserDetailsService myUserDetailsService;

  public CommentLikeService(CommentLikeRepository commentLikeRepository, MyUserDetailsService myUserDetailsService) {
    this.commentLikeRepository = commentLikeRepository;
    this.myUserDetailsService = myUserDetailsService;
  }
  List<CommentLike> getLikes(CommentLikeDTO commentLikeDTO) {
    CommentLikeSpecification commentLikeSpecification = new CommentLikeSpecification();
    if(commentLikeDTO.getUserId() != null) {
      SearchCriteria<CommentLike, Long> userIdCriteria = new SearchCriteria<>(CommentLike_.userId, commentLikeDTO.getUserId(), SearchOperator.EQUAL);
      commentLikeSpecification.getConditions().add(userIdCriteria);
    }
    if(commentLikeDTO.getCommentId() != null) {
      SearchCriteria<CommentLike, Long> jobIdCriteria = new SearchCriteria<>(CommentLike_.commentId, commentLikeDTO.getCommentId(), SearchOperator.EQUAL);
      commentLikeSpecification.getConditions().add(jobIdCriteria);
    }
    if(commentLikeDTO.getTypeLike() != null) {
      SearchCriteria<CommentLike, TypeLike> typeLikeSearchCriteria = new SearchCriteria<>(CommentLike_.typeLike, commentLikeDTO.getTypeLike(), SearchOperator.EQUAL);
      commentLikeSpecification.getConditions().add(typeLikeSearchCriteria);
    }
    return commentLikeRepository.findAll(commentLikeSpecification);
  }
  public ResponseEntity<ResponseObjectDTO> likeComment(CommentLikeDTO commentLikeDTO){
    Long currentUserId = myUserDetailsService.getCurrentUserId();
    commentLikeDTO.setUserId(currentUserId);
    CommentLike commentLike = CommentLikeMapper.toEntity(commentLikeDTO);
    List<CommentLike> likes = getLikes(commentLikeDTO);
    if(likes != null && !likes.isEmpty()){
      commentLikeRepository.delete(likes.get(0));
      return ResponseEntity.ok(new ResponseObjectDTO("Delete CommentLike Successfully", null));
    }
    CommentLike savedLike = commentLikeRepository.save(commentLike);
    Map<String, Object> responseData = new HashMap<>();
    responseData.put("like", savedLike);
    return ResponseEntity.ok(new ResponseObjectDTO(commentLikeDTO.getTypeLike().name()+" job successfully ",responseData));
  }
  public ResponseEntity<ResponseObjectDTO> getNumberOfLikes(Long commentId){
    List<CommentLike> likes = getLikes(CommentLikeDTO.builder().commentId(commentId).typeLike(TypeLike.LIKE).build());
    int numberOfCommentLike = likes.size();
    List<CommentLike> unlikes = getLikes(CommentLikeDTO.builder().commentId(commentId).typeLike(TypeLike.UNLIKE).build());
    int numberOfCommentUnlike = unlikes.size();
    int total = numberOfCommentLike + numberOfCommentUnlike;
    Map<String, Object> responseData = new HashMap<>();
    responseData.put("numberOfLike", numberOfCommentLike);
    responseData.put("numberOfUnlike", numberOfCommentUnlike);
    responseData.put("total", total);
    return ResponseEntity.ok(new ResponseObjectDTO("Get Number Of CommentLike Successfully",responseData));
  }
  public ResponseEntity<ResponseObjectDTO> haveReaction(Long commentId){
    Long userId = myUserDetailsService.getCurrentUserId();
    List<CommentLike> commentLikes = getLikes(CommentLikeDTO.builder().commentId(commentId).userId(userId).build());
    Map<String, Object> responseData = new HashMap<>();
    if(commentLikes!= null &&!commentLikes.isEmpty()){
      responseData.put("typeLike", commentLikes.get(0).getTypeLike());
    }
    return ResponseEntity.ok(new ResponseObjectDTO("Get Having Reaction Successfully",responseData));
  }
}
