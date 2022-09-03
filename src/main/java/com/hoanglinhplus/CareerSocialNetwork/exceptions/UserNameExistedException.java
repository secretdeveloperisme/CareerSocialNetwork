package com.hoanglinhplus.CareerSocialNetwork.exceptions;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class UserNameExistedException extends RuntimeException{
  private String existedUsername ;
  public UserNameExistedException(String message, String existedUsername) {
    super(message);
    this.existedUsername = existedUsername;
  }
}