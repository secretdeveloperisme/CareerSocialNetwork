package com.hoanglinhplus.CareerSocialNetwork.models;

import lombok.*;

import java.io.Serializable;

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
@EqualsAndHashCode
public class AnswerId implements Serializable {
  private Long jobQueId;
  private Long userId;
}
