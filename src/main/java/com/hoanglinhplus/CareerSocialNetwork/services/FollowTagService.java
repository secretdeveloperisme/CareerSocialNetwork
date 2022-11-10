package com.hoanglinhplus.CareerSocialNetwork.services;

import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.tag.FollowTagDTO;
import com.hoanglinhplus.CareerSocialNetwork.models.Tag;
import com.hoanglinhplus.CareerSocialNetwork.models.User;
import com.hoanglinhplus.CareerSocialNetwork.repositories.UserRepository;
import com.hoanglinhplus.CareerSocialNetwork.securities.MyUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class FollowTagService {
  private final UserRepository userRepository;
  private final UserService userService;
  private final TagService tagService;
  private final MyUserDetailsService myUserDetailsService;
  @Autowired
  public FollowTagService(UserRepository userRepository, UserService userService, TagService tagService, MyUserDetailsService myUserDetailsService) {
    this.userRepository = userRepository;
    this.userService = userService;
    this.tagService = tagService;
    this.myUserDetailsService = myUserDetailsService;
  }


  public ResponseEntity<ResponseObjectDTO> followTag(FollowTagDTO followTagDTO){
    Long currentUserId = myUserDetailsService.getCurrentUserId();
    User user = userService.getUser(currentUserId);
    List<Tag> followedTags = user.getTags();
    Map<String, Object> responseData = new HashMap<>();
    Tag followedTag = null;
    for (Tag tag : followedTags) {
      if(tag.getTagId().equals(followTagDTO.getTagId())){
        followedTag = tag;
      }
    }
    if(followedTag != null){
      followedTags.remove(followedTag);
      responseData.put("follow", false);
    }
    else{
      followedTags.add(Tag.builder().tagId(followTagDTO.getTagId()).build());
      responseData.put("follow", true);
    }
    user.setTags(followedTags);
    userRepository.save(user);
    responseData.put("amountOfFollowers", tagService.getAmountOfFollowers(followTagDTO.getTagId()));
    return ResponseEntity.ok(new ResponseObjectDTO("Follow Tag Successfully",responseData));
  }
  public ResponseEntity<ResponseObjectDTO> haveFollowTag(Long tagId){
    Long currentUserId = myUserDetailsService.getCurrentUserId();
    User user = userService.getUser(currentUserId);
    List<Tag> followedTags = user.getTags();
    Map<String, Object> responseData = new HashMap<>();
    Tag followTag = null;
    for (Tag tag : followedTags) {
      if(tag.getTagId().equals(tagId)){
        followTag = tag;
      }
    }
    if(followTag != null){
      responseData.put("follow", true);
    }
    else{
      responseData.put("follow", false);
    }
    return ResponseEntity.ok(new ResponseObjectDTO("Get Have Follow Successfully",responseData));
  }
  public ResponseEntity<ResponseObjectDTO> getNumberOfFollow(Long tagId){
    Tag tag = tagService.getTag(tagId);
    Map<String, Object> responseData = new HashMap<>();
    responseData.put("numberOfFollows", tag.getFollowTagUsers().size());
    return ResponseEntity.ok(new ResponseObjectDTO("Get Number Of Follows Successfully",responseData));
  }
}
