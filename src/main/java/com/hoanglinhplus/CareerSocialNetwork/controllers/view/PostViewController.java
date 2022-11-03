package com.hoanglinhplus.CareerSocialNetwork.controllers.view;

import com.hoanglinhplus.CareerSocialNetwork.dto.comment.CommentFilterDTO;
import com.hoanglinhplus.CareerSocialNetwork.models.*;
import com.hoanglinhplus.CareerSocialNetwork.services.*;
import com.hoanglinhplus.CareerSocialNetwork.utils.AuthenticationTokenUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/post")
public class PostViewController {
  private final PostService postService;
  private final AuthenticationTokenUtil authenticationTokenUtil;
  private final UserService userService;
  private final PostActionService postActionService;
  private final CommentService commentService;

  public PostViewController(PostService postService, AuthenticationTokenUtil authenticationTokenUtil, UserService userService, PostActionService postActionService, CommentService commentService) {
    this.postService = postService;
    this.authenticationTokenUtil = authenticationTokenUtil;
    this.userService = userService;
    this.postActionService = postActionService;
    this.commentService = commentService;
  }

  @RequestMapping("/create")
  public String createPost(Model model, HttpServletRequest request) {
    Map<String, Object> principal = authenticationTokenUtil.getPrincipalFromToken(request);
    User user = null;
    if (principal != null) {
      user = userService.getUser(((Integer)principal.get("userId")).longValue()) ;
    }
    if(user == null) {
      return "error/401";
    }

    model.addAttribute("user", user);
    return "post/create_post";
  }
  @RequestMapping("/{slug}")
  public String getPost(@PathVariable("slug") String slug, Model model, HttpServletRequest request) {
    Post post = postService.getPost(slug);
    User author = post.getCreatedUser();
    Long postId = post.getPostId();
    List<Comment> comments = post.getComments();
    PostLike like = null;
    Boolean isFollowed = null;
    Map<String,Long> numberOfReactions = postActionService.getNumberOfLikes(postId);
    Map<String, Object> principal = authenticationTokenUtil.getPrincipalFromToken(request);
    Map<String,Object> commentsData = commentService.getAllComments(CommentFilterDTO.builder().postId(postId).build());
    long numberOfComments = (long) commentService.getAllComments(CommentFilterDTO.builder().jobId(postId).build()).get("numberOfComments");
    User user = null;
    if (principal != null) {
      user = userService.getUser(((Integer)principal.get("userId")).longValue()) ;
      like = postActionService.getReactionPost(user.getUserId(),postId);
      isFollowed = userService.isCurrentUserFollowed(author.getUserId());
    }

    model.addAttribute("numberOfReactions", numberOfReactions);
    model.addAttribute("comments",comments);
    model.addAttribute("user", user);
    model.addAttribute("author", author);
    model.addAttribute("like", like);
    model.addAttribute("numberOfComments", numberOfComments);
    model.addAttribute("post", post);
    model.addAttribute("isFollowed", isFollowed);
    model.addAttribute("commentsData", commentsData);
    return "post/get_post";
  }
}
