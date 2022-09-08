package com.hoanglinhplus.CareerSocialNetwork.exceptions;

import lombok.Getter;

@Getter
public class NotFoundException extends RuntimeException {
  private final Object target;
  private final String nameTarget;
  public NotFoundException(String message, String target, String nameTarget){
    super(message);
    this.target = target;
    this.nameTarget = nameTarget;
  }
}