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
@Table(name="post_likes")
@IdClass(PostLikeId.class)
public class PostLike {
  @Id
  @Column(name = "user_id")
  private Long userId;
  @Column(name = "post_id")
  @Id
  private Long postId;
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
  @JoinColumn(name = "post_id", referencedColumnName = "post_id", insertable = false, updatable = false)
  private Post post;
}
