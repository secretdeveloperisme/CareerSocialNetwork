package com.hoanglinhplus.CareerSocialNetwork.exceptions;

import lombok.Getter;

@Getter
public class MyUsernameNotFoundException extends RuntimeException {
  private final String username;
  public MyUsernameNotFoundException(String message, String username){
    super(message);
    this.username = username;
  }
}