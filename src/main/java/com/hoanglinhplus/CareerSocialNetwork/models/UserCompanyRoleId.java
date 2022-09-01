package com.hoanglinhplus.CareerSocialNetwork.models;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@AllArgsConstructor
@Getter @Setter
public class UserCompanyRoleId implements Serializable {
  private Long userId;
  private Long companyId;
}
