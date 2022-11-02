package com.hoanglinhplus.CareerSocialNetwork.services;

import com.hoanglinhplus.CareerSocialNetwork.dto.post.FollowUserDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
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
public class FollowUserService {
  private final UserRepository userRepository;
  private final UserService userService;
  private final MyUserDetailsService myUserDetailsService;
  @Autowired
  public FollowUserService(UserRepository userRepository, UserService userService, MyUserDetailsService myUserDetailsService) {
    this.userRepository = userRepository;
    this.userService = userService;
    this.myUserDetailsService = myUserDetailsService;
  }

  public ResponseEntity<ResponseObjectDTO> followUser(FollowUserDTO followUserDTO){
    Long currentUserId = myUserDetailsService.getCurrentUserId();
    User user = userService.getUser(currentUserId);
    List<User> followed_users = user.getFollowed_users();
    Map<String, Object> responseData = new HashMap<>();
    User followUser = null;
    for (User followed_user : followed_users) {
      if(followed_user.getUserId().equals(followUserDTO.getFollowed_id())){
        followUser = followed_user;
      }
    }
    if(followUser != null){
      followed_users.remove(followUser);
      responseData.put("follow", false);
    }
    else{
      followed_users.add(User.builder().userId(followUserDTO.getFollowed_id()).build());
      responseData.put("follow", true);
    }
    user.setFollowed_users(followed_users);
    userRepository.save(user);
    return ResponseEntity.ok(new ResponseObjectDTO("Follow User Successfully",responseData));
  }
  public ResponseEntity<ResponseObjectDTO> haveFollowUser(Long followedUserId){
    Long currentUserId = myUserDetailsService.getCurrentUserId();
    User user = userService.getUser(currentUserId);
    List<User> followedUsers = user.getFollowed_users();
    Map<String, Object> responseData = new HashMap<>();
    User followUser = null;
    for (User followedUser : followedUsers) {
      if(followedUser.getUserId().equals(followedUserId)){
        followUser = followedUser;
      }
    }
    if(followUser != null){
      responseData.put("follow", true);
    }
    else{
      responseData.put("follow", false);
    }
    return ResponseEntity.ok(new ResponseObjectDTO("Get Have Follow Successfully",responseData));
  }
  public ResponseEntity<ResponseObjectDTO> getNumberOfFollow(Long followedUserId){
    User user = userService.getUser(followedUserId);
    Map<String, Object> responseData = new HashMap<>();
    responseData.put("numberOfFollows", user.getFollowing_users().size());
    return ResponseEntity.ok(new ResponseObjectDTO("Get Number Of Follows Successfully",responseData));
  }
}
