package com.hoanglinhplus.CareerSocialNetwork.controllers.api;


import com.hoanglinhplus.CareerSocialNetwork.dto.PageableDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.post.PostCreationDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.post.PostFilterDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.services.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import java.util.List;
import java.util.Map;


@RestController
@RequestMapping("/api/post")
@Validated
public class PostController {
  private final PostService postService;

  @Autowired
  PostController(PostService postService){
    this.postService = postService;
  }

  @GetMapping("/get-all-posts")
  public ResponseEntity<?> getAllPosts(
    @Valid PostFilterDTO postFilterDTO, @Valid PageableDTO pageableDTO
  ){
    return postService.responseGetPosts(postFilterDTO, pageableDTO);
  }
  @PreAuthorize("hasAnyAuthority('ADMIN')")
  @GetMapping("/get-amount-per-month")
  public ResponseEntity<?> getAmountPerMonth(
    @Valid PageableDTO pageableDTO
  ){
    return postService.getAmountPerMonths();
  }
  @GetMapping("/get-followed-posts")
  public ResponseEntity<?> getFollowedPosts(
    @Valid PageableDTO pageableDTO
  ){
    return postService.responseGetFollowedPosts(pageableDTO);
  }

  @GetMapping("/get-post")
  public ResponseEntity<ResponseObjectDTO> getPost(
    @RequestParam @NotNull Long id){
    return postService.responseGetPost(id);
  }
  @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
  @PostMapping(produces = MediaType.APPLICATION_JSON_VALUE)
  public ResponseEntity<ResponseObjectDTO> createCompany(@RequestBody @Valid PostCreationDTO postCreationDTO){
    return postService.createPost(postCreationDTO);
  }
  @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
  @PutMapping(produces = MediaType.APPLICATION_JSON_VALUE)
  public ResponseEntity<ResponseObjectDTO> updateCompany(@RequestBody @Valid PostCreationDTO postCreationDTO){
    return postService.updatePost(postCreationDTO);
  }
  @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
  @DeleteMapping(produces = MediaType.APPLICATION_JSON_VALUE)
  public ResponseEntity<ResponseObjectDTO> deletePost(@RequestBody @NotNull Map<String, Long> params){
    return postService.deletePost(params.get("postId"));
  }
  @PreAuthorize("hasAuthority('ADMIN')")
  @DeleteMapping(path = "/many/admin",produces = MediaType.APPLICATION_JSON_VALUE)
  public ResponseEntity<ResponseObjectDTO> deletePosts(@RequestBody List<Long> ids) {
    return postService.deletePosts(ids,  true, true);
  }
  @PreAuthorize("hasAuthority('USER')")
  @DeleteMapping(path = "/many",produces = MediaType.APPLICATION_JSON_VALUE)
  public ResponseEntity<ResponseObjectDTO> deletePostsByUser(@RequestBody List<Long> ids) {
    return postService.deletePosts(ids,  false, false);
  }
  @PreAuthorize("hasAuthority('USER')")
  @DeleteMapping(path = "/many/destroy",produces = MediaType.APPLICATION_JSON_VALUE)
  public ResponseEntity<ResponseObjectDTO> destroyPosts(@RequestBody List<Long> ids) {
    return postService.deletePosts(ids,  false, true);
  }

}