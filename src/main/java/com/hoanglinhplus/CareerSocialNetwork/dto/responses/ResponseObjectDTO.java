package com.hoanglinhplus.CareerSocialNetwork.dto.responses;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Map;

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class ResponseObjectDTO {
  private String message;
  private Map<String, Object> data;

}
