package com.hoanglinhplus.CareerSocialNetwork.models;

import com.hoanglinhplus.CareerSocialNetwork.constants.NumberConstant;
import com.hoanglinhplus.CareerSocialNetwork.constants.PostStatus;
import com.hoanglinhplus.CareerSocialNetwork.constants.TypeLike;
import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "posts")
@EntityListeners(AuditingEntityListener.class)
public class Post {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "post_id", nullable = false)
  private Long postId;
  @Column(nullable = false)
  private String title;
  private String slug;
  @Column(length = 1000)
  private String description;
  @Enumerated(EnumType.STRING)
  private PostStatus postStatus;
  private String image;
  @Column(columnDefinition = "TEXT")
  private String content;
  @CreatedDate
  private Date createdAt;
  @LastModifiedDate
  private Date updatedAt;
  private Date deletedAt;
  @OneToMany(mappedBy = "post")
  private List<Comment> comments;

  @OneToMany(mappedBy = "post",orphanRemoval = true)
  private List<PostLike> likes;
  @ManyToMany
  @JoinTable(name = "post_tags", joinColumns = @JoinColumn(name = "post_id",  referencedColumnName = "post_id")
    , inverseJoinColumns = @JoinColumn(name = "tag_id", referencedColumnName = "tag_id"))
  private List<Tag> tags;
  @ManyToOne
  @JoinColumn(name = "user_id", referencedColumnName = "user_id")
  private User createdUser;

  @Transient
  private long numberOfLikes = 0;
  @Transient
  private TypeLike typeLike;
}