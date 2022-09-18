package com.hoanglinhplus.CareerSocialNetwork.services;

import com.hoanglinhplus.CareerSocialNetwork.constants.TypeLike;
import com.hoanglinhplus.CareerSocialNetwork.dto.job_action.BookmarkDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.job_action.LikeDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.mappers.LikeMapper;
import com.hoanglinhplus.CareerSocialNetwork.models.Job;
import com.hoanglinhplus.CareerSocialNetwork.models.Like;
import com.hoanglinhplus.CareerSocialNetwork.models.Like_;
import com.hoanglinhplus.CareerSocialNetwork.models.User;
import com.hoanglinhplus.CareerSocialNetwork.repositories.LikeRepository;
import com.hoanglinhplus.CareerSocialNetwork.repositories.UserRepository;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.LikeSpecification;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.SearchCriteria;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.SearchOperator;
import com.hoanglinhplus.CareerSocialNetwork.securities.MyUserDetailsService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class JobActionService {
  private final LikeRepository likeRepository;
  private final  JobService jobService;
  private final UserRepository userRepository;
  private final UserService userService;
  private final MyUserDetailsService myUserDetailsService;
  public JobActionService(LikeRepository likeRepository, JobService jobService, UserRepository userRepository, UserService userService, MyUserDetailsService myUserDetailsService) {
    this.likeRepository = likeRepository;
    this.jobService = jobService;
    this.userRepository = userRepository;
    this.userService = userService;
    this.myUserDetailsService = myUserDetailsService;
  }
  List<Like> getLikes(LikeDTO likeDTO) {
    LikeSpecification likeSpecification = new LikeSpecification();
    if(likeDTO.getUserId() != null) {
      SearchCriteria<Like, Long> userIdCriteria = new SearchCriteria<>(Like_.userId, likeDTO.getUserId(), SearchOperator.EQUAL);
      likeSpecification.getConditions().add(userIdCriteria);
    }
    if(likeDTO.getJobId() != null) {
      SearchCriteria<Like, Long> jobIdCriteria = new SearchCriteria<>(Like_.jobId, likeDTO.getJobId(), SearchOperator.EQUAL);
      likeSpecification.getConditions().add(jobIdCriteria);
    }
    if(likeDTO.getTypeLike() != null) {
      SearchCriteria<Like, TypeLike> typeLikeSearchCriteria = new SearchCriteria<>(Like_.typeLike, likeDTO.getTypeLike(), SearchOperator.EQUAL);
      likeSpecification.getConditions().add(typeLikeSearchCriteria);
    }
    return likeRepository.findAll(likeSpecification);
  }
  public ResponseEntity<ResponseObjectDTO> likeJob(LikeDTO likeDTO){
    Like like = LikeMapper.toEntity(likeDTO);
    List<Like> likes = getLikes(likeDTO);
    if(likes != null && !likes.isEmpty()){
      likeRepository.delete(likes.get(0));
      return ResponseEntity.ok(new ResponseObjectDTO("Delete Like Successfully", null));
    }
    Like savedLike = likeRepository.save(like);
    Map<String, Object> responseData = new HashMap<>();
    responseData.put("like", savedLike);
    return ResponseEntity.ok(new ResponseObjectDTO(likeDTO.getTypeLike().name()+" job successfully ",responseData));
  }
  public ResponseEntity<ResponseObjectDTO> getNumberOfLikes(Long jobId){
    List<Like> likes = getLikes(LikeDTO.builder().jobId(jobId).typeLike(TypeLike.LIKE).build());
    int numberOfLike = likes.size();
    List<Like> unlikes = getLikes(LikeDTO.builder().jobId(jobId).typeLike(TypeLike.UNLIKE).build());
    int numberOfUnlike = unlikes.size();
    int total = numberOfLike + numberOfUnlike;
    Map<String, Object> responseData = new HashMap<>();
    responseData.put("numberOfLike", numberOfLike);
    responseData.put("numberOfUnlike", numberOfUnlike);
    responseData.put("total", total);
    return ResponseEntity.ok(new ResponseObjectDTO("Get Number Of Like Successfully",responseData));
  }
  public ResponseEntity<ResponseObjectDTO> haveReactionJob(Long jobId){
    Long userId = myUserDetailsService.getCurrentUserId();
    List<Like> likes = getLikes(LikeDTO.builder().jobId(jobId).userId(userId).build());
    Map<String, Object> responseData = new HashMap<>();
    if(likes!= null &&!likes.isEmpty()){
      responseData.put("typeLike", likes.get(0).getTypeLike());
    }
    return ResponseEntity.ok(new ResponseObjectDTO("Get Having Reaction Successfully",responseData));
  }

  public ResponseEntity<ResponseObjectDTO> bookmark(BookmarkDTO bookmarkDTO){
    Long currentUserId = myUserDetailsService.getCurrentUserId();
    User user = userService.getUser(currentUserId);
    List<Job> bookmarkJobs = user.getBookmarks();
    Map<String, Object> responseData = new HashMap<>();
    Job bookmarkJob = null;
    for (Job job : bookmarkJobs) {
      if(job.getJobId().equals(bookmarkDTO.getJobId())){
        bookmarkJob = job;
      }
    }
    if(bookmarkJob != null){
      bookmarkJobs.remove(bookmarkJob);
      responseData.put("bookmark", false);
    }
    else{
      bookmarkJobs.add(Job.builder().jobId(bookmarkDTO.getJobId()).build());
      responseData.put("bookmark", true);
    }
    user.setBookmarks(bookmarkJobs);
    userRepository.save(user);
    return ResponseEntity.ok(new ResponseObjectDTO("Bookmark Successfully",responseData));
  }
  public ResponseEntity<ResponseObjectDTO> haveBookmarkJob(Long jobId){
    Long currentUserId = myUserDetailsService.getCurrentUserId();
    User user = userService.getUser(currentUserId);
    List<Job> bookmarkJobs = user.getBookmarks();
    Map<String, Object> responseData = new HashMap<>();
    Job bookmarkJob = null;
    for (Job job : bookmarkJobs) {
      if(job.getJobId().equals(jobId)){
        bookmarkJob = job;
      }
    }
    if(bookmarkJob != null){
      responseData.put("bookmark", true);
    }
    else{
      responseData.put("bookmark", false);
    }
    return ResponseEntity.ok(new ResponseObjectDTO("Get Have Bookmark Successfully",responseData));
  }
  public ResponseEntity<ResponseObjectDTO> getNumberOfBookmarks(Long jobId){
    Job job = jobService.getJob(jobId);
    Map<String, Object> responseData = new HashMap<>();
    responseData.put("numberOfBookmark", job.getBookmarks().size());
    return ResponseEntity.ok(new ResponseObjectDTO("Get Number Of Bookmarks Successfully",responseData));
  }

}
