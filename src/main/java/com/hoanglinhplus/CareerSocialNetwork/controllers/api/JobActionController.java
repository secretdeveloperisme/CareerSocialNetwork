package com.hoanglinhplus.CareerSocialNetwork.controllers.api;

import com.hoanglinhplus.CareerSocialNetwork.dto.job_action.BookmarkDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.job_action.LikeDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.services.JobActionService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/job-action")
public class JobActionController {
  private final JobActionService jobActionService;

  public JobActionController(JobActionService jobActionService) {
    this.jobActionService = jobActionService;
  }
  @PostMapping(value = "/like")
  ResponseEntity<ResponseObjectDTO> likeJob(@RequestBody LikeDTO likeDTO) {
    return jobActionService.likeJob(likeDTO);
  }
  @GetMapping("/like-count")
  public ResponseEntity<ResponseObjectDTO> getNumberOfLikes(Long jobId){
    return jobActionService.responseGetNumberOfLikes(jobId);
  }
  @GetMapping("/have-reaction-job")
  public ResponseEntity<ResponseObjectDTO> haveReactionJob(Long jobId){
    return jobActionService.haveReactionJob(jobId);
  }
  @PostMapping(value = "/bookmark")
  ResponseEntity<ResponseObjectDTO> bookmark(@RequestBody BookmarkDTO bookmarkDTO) {
    return jobActionService.bookmark(bookmarkDTO);
  }
  @GetMapping("/have-bookmark-job")
  public ResponseEntity<ResponseObjectDTO> haveBookmarkJob(Long jobId){
    return jobActionService.haveBookmarkJob(jobId);
  }
  @GetMapping("/count-bookmark")
  public ResponseEntity<ResponseObjectDTO> getNumberOfBookmarks(Long jobId){
    return jobActionService.responseGetNumberOfBookmarks(jobId);
  }
}
