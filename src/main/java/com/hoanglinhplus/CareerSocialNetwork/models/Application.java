package com.hoanglinhplus.CareerSocialNetwork.models;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "applications")
@IdClass(ApplicationId.class)
public class Application {
  @Id
  @Column(name = "user_id",insertable = false, updatable = false)
  private Long userId;
  @Column(name = "job_id", insertable = false, updatable = false)
  @Id
  private Long jobId;
  public short status;
  @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
  @JoinColumn(name = "user_id", referencedColumnName = "user_id")
  public User user;
  @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
  @JoinColumn(name = "job_id", referencedColumnName = "job_id")
  public Job job;

}