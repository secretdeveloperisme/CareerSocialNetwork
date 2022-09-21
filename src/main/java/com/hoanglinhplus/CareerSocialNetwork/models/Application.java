package com.hoanglinhplus.CareerSocialNetwork.models;


import com.hoanglinhplus.CareerSocialNetwork.constants.ApplicationStatus;
import lombok.*;

import javax.persistence.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
@Entity
@Table(name = "applications")
@IdClass(ApplicationId.class)
public class Application {
  @Id
  @Column(name = "user_id")
  private Long userId;
  @Column(name = "job_id", insertable = false, updatable = false)
  @Id
  private Long jobId;
  @Enumerated(EnumType.STRING)
  @Column(name = "status")
  private ApplicationStatus status;
  @ManyToOne
  @JoinColumn(name = "user_id", referencedColumnName = "user_id", insertable = false, updatable = false)
  private User user;
  @ManyToOne
  @JoinColumn(name = "job_id", referencedColumnName = "job_id", insertable = false, updatable = false)
  private Job job;

}