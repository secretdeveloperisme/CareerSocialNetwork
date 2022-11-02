package com.hoanglinhplus.CareerSocialNetwork.controllers.api;

import com.hoanglinhplus.CareerSocialNetwork.dto.post.PostLikeDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.services.PostActionService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/post-action")
public class PostActionController {
  private final PostActionService postActionService;

  public PostActionController(PostActionService postActionService) {
    this.postActionService = postActionService;
  }
  @PostMapping(value = "/like")
  ResponseEntity<ResponseObjectDTO> likeJob(@RequestBody PostLikeDTO likeDTO) {
    return postActionService.likePost(likeDTO);
  }
  @GetMapping("/like-count")
  public ResponseEntity<ResponseObjectDTO> getNumberOfLikes(Long postId){
    return postActionService.responseGetNumberOfLikes(postId);
  }
}
