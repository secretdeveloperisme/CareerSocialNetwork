package com.hoanglinhplus.CareerSocialNetwork.dto.tag;

import lombok.*;


@Builder
@NoArgsConstructor @AllArgsConstructor
@Getter
@Setter
public class TagFilterDTO {
  Long tagId;
  String name;
}
