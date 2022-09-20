package com.hoanglinhplus.CareerSocialNetwork.dto;

import lombok.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class TagDTO {
  private Long tagId;
  private String name;
}