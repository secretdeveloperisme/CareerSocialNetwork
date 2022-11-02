package com.hoanglinhplus.CareerSocialNetwork.dto.post;

import com.hoanglinhplus.CareerSocialNetwork.constants.PostStatus;
import com.hoanglinhplus.CareerSocialNetwork.dto.tag.TagDTO;
import lombok.*;

import javax.validation.constraints.NotNull;
import java.io.Serializable;
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
  @NotNull
  private String content;
  @NotNull
  private PostStatus postStatus;
  private List<TagDTO> tags;
}