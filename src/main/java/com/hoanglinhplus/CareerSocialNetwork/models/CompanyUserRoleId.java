package com.hoanglinhplus.CareerSocialNetwork.models;

import lombok.*;

import java.io.Serializable;

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
@EqualsAndHashCode
public class CompanyUserRoleId implements Serializable {
  private Long companyId;
  private Long companyRoleId;
}
