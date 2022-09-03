package com.hoanglinhplus.CareerSocialNetwork.exceptions;

import lombok.Getter;

import java.util.HashMap;
import java.util.Map;

@Getter
public class InputNotValidException extends RuntimeException{
  private final Map<String, Object> causes;
  public InputNotValidException(String s) {
    super(s);
    causes = new HashMap<>();
  }

}