package com.hoanglinhplus.CareerSocialNetwork.models;

import lombok.*;

import javax.persistence.*;

@Builder
@NoArgsConstructor @AllArgsConstructor
@Getter @Setter
@Entity
@IdClass(UserCompanyRoleId.class)
@Table(name = "user_company_roles")
public class UserCompanyRole {
  @Id
  @Column(name = "user_id", insertable = false, updatable = false)
  private Long userId;
  @Column(name = "company_id", insertable = false, updatable = false)
  @Id
  private Long companyId;
  public String name;
  @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
  @JoinColumn(name = "user_id", referencedColumnName = "user_id")
  public User user;
  @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
  @JoinColumn(name = "company_id", referencedColumnName = "company_id")
  public Company company;
}