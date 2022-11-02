package com.hoanglinhplus.CareerSocialNetwork.dto.comment;

import com.hoanglinhplus.CareerSocialNetwork.constants.TypeLike;
import com.hoanglinhplus.CareerSocialNetwork.dto.user.UserCreationDTO;
import com.hoanglinhplus.CareerSocialNetwork.models.User;
import lombok.*;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter @Setter
public class CommentDTO implements Serializable {
  private Long commentId;
  private String content;
  private Date createdAt;
  private Long parentCommentId;
  private Long userId;
  private UserCreationDTO user;
  private Long jobId;
  private Long postId;
  List<CommentDTO> children;
  private Long numberOfLikes;
  private TypeLike typeLike;
}