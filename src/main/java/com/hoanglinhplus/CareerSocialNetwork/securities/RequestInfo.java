package com.hoanglinhplus.CareerSocialNetwork.securities;

import lombok.*;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class RequestInfo {
  private String method;
  private String path;

  @Override
  public boolean equals(Object obj) {
    if(!(obj instanceof RequestInfo requestInfo))
      return false;
    else{
      return method.equals(requestInfo.getMethod())
        && requestInfo.getPath().startsWith(path);
    }
  }

}
