package com.hoanglinhplus.CareerSocialNetwork.dto.tag;

import lombok.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class TagDTO {
  private Long tagId;
  private String name;
  long amountOfJobs;
  long amountOfPosts;
  long amountOfFollowers;
}
