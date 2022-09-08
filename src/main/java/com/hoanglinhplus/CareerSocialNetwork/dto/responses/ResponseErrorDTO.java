package com.hoanglinhplus.CareerSocialNetwork.dto.responses;

import lombok.*;

import java.util.Map;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ResponseErrorDTO {
  private String message;
  private Map<String, Object> errors;
}
