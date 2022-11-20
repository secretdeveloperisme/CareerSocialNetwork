package com.hoanglinhplus.CareerSocialNetwork.dto.comment;

import com.hoanglinhplus.CareerSocialNetwork.constants.CommentAction;
import lombok.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class CommentTransfer {
  private CommentDTO comment;
  private CommentAction action;
}
