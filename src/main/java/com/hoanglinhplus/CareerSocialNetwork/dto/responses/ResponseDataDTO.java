package com.hoanglinhplus.CareerSocialNetwork.dto.responses;


import lombok.*;

import java.util.List;
import java.util.Map;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class ResponseDataDTO<T> {
  private String message;
  private List<T> data;
  private Long last_page;
  private Long totalElements;
}
