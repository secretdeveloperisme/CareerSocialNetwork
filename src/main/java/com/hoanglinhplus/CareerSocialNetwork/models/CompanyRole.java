package com.hoanglinhplus.CareerSocialNetwork.models;

import lombok.*;

import javax.persistence.*;
import java.util.List;

@Builder
@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "company_roles")
public class CompanyRole {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "company_role_id")
  private long companyRoleId;
  @Column
  private String name;

  @OneToMany(mappedBy = "companyRole")
  List<CompanyUserRole> companyUserRoles;
}