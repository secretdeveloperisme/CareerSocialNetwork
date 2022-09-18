package com.hoanglinhplus.CareerSocialNetwork.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.hoanglinhplus.CareerSocialNetwork.constants.TypeLike;
import lombok.*;

import javax.persistence.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
@Entity
@Table(name="likes")
@IdClass(LikeId.class)
public class Like {
  @Id
  @Column(name = "user_id")
  private Long userId;
  @Column(name = "job_id")
  @Id
  private Long jobId;
  @Id
  @Column(name = "type_like")
  @Enumerated(EnumType.STRING)
  private TypeLike typeLike;
  @JsonIgnore
  @ManyToOne
  @JoinColumn(name = "user_id", referencedColumnName = "user_id",insertable = false, updatable = false)
  private User user;
  @JsonIgnore
  @ManyToOne
  @JoinColumn(name = "job_id", referencedColumnName = "job_id", insertable = false, updatable = false)
  private Job job;
}
