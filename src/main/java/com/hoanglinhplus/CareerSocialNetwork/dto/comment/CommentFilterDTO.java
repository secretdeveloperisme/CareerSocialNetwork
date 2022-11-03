package com.hoanglinhplus.CareerSocialNetwork.dto.comment;

import lombok.*;

import java.io.Serializable;
import java.util.Date;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter @Setter
public class CommentFilterDTO implements Serializable {
  private Date createdAt;
  private Long parentCommentId;
  private Long userId;
  private Long jobId;
  private Long postId;
}