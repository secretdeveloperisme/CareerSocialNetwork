package com.hoanglinhplus.CareerSocialNetwork.controllers.api;

import com.hoanglinhplus.CareerSocialNetwork.dto.post.FollowUserDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.services.FollowUserService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/follow-user")
public class FollowUserController {
  private final FollowUserService followUserService;

  public FollowUserController(FollowUserService followUserService) {
    this.followUserService = followUserService;
  }

  @PostMapping
  public ResponseEntity<ResponseObjectDTO> followUser(@RequestBody FollowUserDTO followUserDTO){
    return followUserService.followUser(followUserDTO);
  }

  @GetMapping("/have-follow-user")
  public ResponseEntity<ResponseObjectDTO> haveFollowUser(@RequestParam Long userId){
    return followUserService.haveFollowUser(userId);
  }

  @GetMapping("/get-number-of-follow-user")
  public ResponseEntity<ResponseObjectDTO> getNumberOfFollows(@RequestParam Long userId){
    return followUserService.getNumberOfFollow(userId);
  }
}
