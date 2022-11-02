package com.hoanglinhplus.CareerSocialNetwork.services;

import com.hoanglinhplus.CareerSocialNetwork.constants.TypeLike;
import com.hoanglinhplus.CareerSocialNetwork.dto.post.PostLikeDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.mappers.PostLikeMapper;
import com.hoanglinhplus.CareerSocialNetwork.models.PostLike;
import com.hoanglinhplus.CareerSocialNetwork.models.PostLike_;
import com.hoanglinhplus.CareerSocialNetwork.repositories.PostLikeRepository;
import com.hoanglinhplus.CareerSocialNetwork.repositories.UserRepository;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.PostLikeSpecification;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.SearchCriteria;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.SearchOperator;
import com.hoanglinhplus.CareerSocialNetwork.securities.MyUserDetailsService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class PostActionService {
  private final PostLikeRepository postLikeRepository;
  private final MyUserDetailsService myUserDetailsService;
  public PostActionService(PostLikeRepository postLikeRepository, PostService postService, UserRepository userRepository, UserService userService, MyUserDetailsService myUserDetailsService) {
    this.postLikeRepository = postLikeRepository;
    this.myUserDetailsService = myUserDetailsService;
  }
  List<PostLike> getLikes(PostLikeDTO likeDTO) {
    PostLikeSpecification likeSpecification = new PostLikeSpecification();
    if(likeDTO.getUserId() != null) {
      SearchCriteria<PostLike, Long> userIdCriteria = new SearchCriteria<>(PostLike_.userId, likeDTO.getUserId(), SearchOperator.EQUAL);
      likeSpecification.getConditions().add(userIdCriteria);
    }
    if(likeDTO.getPostId() != null) {
      SearchCriteria<PostLike, Long> postIdCriteria = new SearchCriteria<>(PostLike_.postId, likeDTO.getPostId(), SearchOperator.EQUAL);
      likeSpecification.getConditions().add(postIdCriteria);
    }
    if(likeDTO.getTypeLike() != null) {
      SearchCriteria<PostLike, TypeLike> typeLikeSearchCriteria = new SearchCriteria<>(PostLike_.typeLike, likeDTO.getTypeLike(), SearchOperator.EQUAL);
      likeSpecification.getConditions().add(typeLikeSearchCriteria);
    }
    return postLikeRepository.findAll(likeSpecification);
  }
  public ResponseEntity<ResponseObjectDTO> likePost(PostLikeDTO likeDTO){
    likeDTO.setUserId(myUserDetailsService.getCurrentUserId());
    TypeLike typeLike = likeDTO.getTypeLike();
    PostLike like = PostLikeMapper.toEntity(likeDTO);
    List<PostLike> likes = getLikes(PostLikeDTO.builder().userId(likeDTO.getUserId()).postId(likeDTO.getPostId()).build());
    Map<String, Object> responseData = new HashMap<>();
    if(likes != null && !likes.isEmpty()){
      PostLike existedPostLike = likes.get(0);
      if(existedPostLike.getTypeLike().equals(typeLike)){
        postLikeRepository.delete(likes.get(0));
        responseData.put("statistics", getNumberOfLikes(likeDTO.getPostId()));
        responseData.put("action", "DELETE");
        return ResponseEntity.ok(new ResponseObjectDTO("Delete "+typeLike +" Successfully", responseData));
      }else {
        postLikeRepository.delete(existedPostLike);
        existedPostLike.setTypeLike(typeLike);
        PostLike savedPostLike = postLikeRepository.save(existedPostLike);
        responseData.put("like", savedPostLike);
        responseData.put("statistics", getNumberOfLikes(likeDTO.getPostId()));
        responseData.put("action", "UPDATE");
        return ResponseEntity.ok(new ResponseObjectDTO("Update: "+likeDTO.getTypeLike().name()+" post successfully ",responseData));
      }

    }
    PostLike savedPostLike = postLikeRepository.save(like);
    responseData.put("like", savedPostLike);
    responseData.put("statistics", getNumberOfLikes(likeDTO.getPostId()));
    responseData.put("action", "CREATE");
    return ResponseEntity.ok(new ResponseObjectDTO(likeDTO.getTypeLike().name()+" post successfully ",responseData));
  }
  public ResponseEntity<ResponseObjectDTO> responseGetNumberOfLikes(Long postId){
    List<PostLike> likes = getLikes(PostLikeDTO.builder().postId(postId).typeLike(TypeLike.LIKE).build());
    int numberOfLike = likes.size();
    List<PostLike> unlikes = getLikes(PostLikeDTO.builder().postId(postId).typeLike(TypeLike.UNLIKE).build());
    int numberOfUnlike = unlikes.size();
    int total = numberOfLike + numberOfUnlike;
    Map<String, Object> responseData = new HashMap<>();
    responseData.put("numberOfLike", numberOfLike);
    responseData.put("numberOfUnlike", numberOfUnlike);
    responseData.put("total", total);
    return ResponseEntity.ok(new ResponseObjectDTO("Get Number Of Like Successfully",responseData));
  }
  public Map<String, Long> getNumberOfLikes(Long postId){
    List<PostLike> likes = getLikes(PostLikeDTO.builder().postId(postId).typeLike(TypeLike.LIKE).build());
    long numberOfLike = likes.size();
    List<PostLike> unlikes = getLikes(PostLikeDTO.builder().postId(postId).typeLike(TypeLike.UNLIKE).build());
    long numberOfUnlike = unlikes.size();
    long total = numberOfLike + numberOfUnlike;
    Map<String, Long> data = new HashMap<>();
    data.put("numberOfLikes", numberOfLike);
    data.put("numberOfUnlikes", numberOfUnlike);
    data.put("total", total);
    return data;
  }
  public ResponseEntity<ResponseObjectDTO> haveReactionPost(Long postId){
    Long userId = myUserDetailsService.getCurrentUserId();
    List<PostLike> likes = getLikes(PostLikeDTO.builder().postId(postId).userId(userId).build());
    Map<String, Object> responseData = new HashMap<>();
    if(likes!= null &&!likes.isEmpty()){
      responseData.put("typeLike", likes.get(0).getTypeLike());
    }
    return ResponseEntity.ok(new ResponseObjectDTO("Get Having Reaction Successfully",responseData));
  }
  public PostLike getReactionPost(Long userId,Long postId){
    List<PostLike> likes = getLikes(PostLikeDTO.builder().postId(postId).userId(userId).build());
    if(likes!= null &&!likes.isEmpty()){
     return likes.get(0);
    }
    return null;
  }

}
