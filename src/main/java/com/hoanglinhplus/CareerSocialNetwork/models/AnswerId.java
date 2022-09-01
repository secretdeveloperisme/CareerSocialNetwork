package com.hoanglinhplus.CareerSocialNetwork.models;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@AllArgsConstructor
@Getter @Setter
@EqualsAndHashCode
public class AnswerId implements Serializable {
  private Long jobQueId;
  private Long userId;
}
