package com.hoanglinhplus.CareerSocialNetwork.models;


import lombok.*;

import javax.persistence.*;

@Builder
@Getter @Setter
@AllArgsConstructor @NoArgsConstructor
@Entity
@Table(name = "comment_likes")
@IdClass(CommentLikeId.class)
public class CommentLike {
  @Id
  private Long userId;
  @Id
  private Long commentId;
  @Column(nullable = false, length = 30)
  @Enumerated(EnumType.STRING)
  private TypeLike typeLike;
  @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
  @JoinColumn(name = "user_id", referencedColumnName = "user_id")
  private User users;
  @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
  @JoinColumn(name = "comment_id", referencedColumnName = "comment_id")
  private Comment comments;

}