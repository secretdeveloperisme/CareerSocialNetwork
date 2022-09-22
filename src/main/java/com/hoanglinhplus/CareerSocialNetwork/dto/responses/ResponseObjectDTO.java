package com.hoanglinhplus.CareerSocialNetwork.dto.responses;


import lombok.*;

import java.util.Map;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class ResponseObjectDTO {
  private String message;
  private Map<String, Object> data;
}
