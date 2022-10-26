package com.hoanglinhplus.CareerSocialNetwork.controllers.api;

import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.tag.FollowTagDTO;
import com.hoanglinhplus.CareerSocialNetwork.services.FollowTagService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/follow-tag")
public class FollowTagController {
  private final FollowTagService followTagService;

  public FollowTagController(FollowTagService followTagService) {
    this.followTagService = followTagService;
  }

  @PostMapping
  public ResponseEntity<ResponseObjectDTO> followCompany(@RequestBody FollowTagDTO followTagDTO){
    return followTagService.followTag(followTagDTO);
  }

  @GetMapping("/have-follow-company")
  public ResponseEntity<ResponseObjectDTO> haveFollowCompany(@RequestParam Long tagId){
    return followTagService.haveFollowTag(tagId);
  }

  @GetMapping("/get-number-of-follow-company")
  public ResponseEntity<ResponseObjectDTO> getNumberOfFollows(@RequestParam Long tagId){
    return followTagService.getNumberOfFollow(tagId);
  }
}
