package com.hoanglinhplus.CareerSocialNetwork.dto.post;

import com.hoanglinhplus.CareerSocialNetwork.constants.NumberConstant;
import com.hoanglinhplus.CareerSocialNetwork.constants.PostStatus;
import lombok.*;

import java.util.List;

@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PostFilterDTO {
  private String title;
  private String slug;
  private PostStatus postStatus;
  private List<Long> tagIds;
  private Boolean isDeleted;
}
