package com.hoanglinhplus.CareerSocialNetwork.models;

import lombok.*;

import javax.persistence.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "company_user_roles")
@IdClass(CompanyUserRoleId.class)
public class CompanyUserRole {
  @Id
  @Column(name = "company_id", nullable = false)
  private Long companyId;

  @Id
  @Column(name = "user_id", nullable = false)
  private Long userId;

  @Id
  @Column(name = "company_role_id", nullable = false)
  private Long companyRoleId;
  @ManyToOne
  @JoinColumn(name = "user_id", referencedColumnName = "user_id", insertable = false, updatable = false)
  private User user;

  @ManyToOne
  @JoinColumn(name = "company_id", referencedColumnName = "company_id", insertable = false, updatable = false)
  private Company company;

  @ManyToOne
  @JoinColumn(name = "company_role_id", referencedColumnName = "company_role_id", insertable = false, updatable = false)
  private CompanyRole companyRole;

}