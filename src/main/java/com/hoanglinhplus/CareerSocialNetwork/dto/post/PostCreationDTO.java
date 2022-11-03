package com.hoanglinhplus.CareerSocialNetwork.dto.post;

import com.hoanglinhplus.CareerSocialNetwork.constants.NumberConstant;
import com.hoanglinhplus.CareerSocialNetwork.constants.PostStatus;
import com.hoanglinhplus.CareerSocialNetwork.constants.TypeLike;
import com.hoanglinhplus.CareerSocialNetwork.dto.comment.CommentDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.tag.TagDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.user.UserDTO;
import lombok.*;

import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;
import java.util.List;


@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class PostCreationDTO implements Serializable {
  private Long postId;
  @NotNull
  private String title;
  private String slug;
  private String description;
  private String image;
  private UserDTO createdUser;
  private List<CommentDTO> comments;
  private Date createdAt;
  @NotNull
  private String content;
  @NotNull
  private PostStatus postStatus;
  private List<TagDTO> tags;
  @Builder.Default
  private int numberOfLikes = 0;
  private TypeLike typeLike;
}