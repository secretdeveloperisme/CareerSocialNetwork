package com.hoanglinhplus.CareerSocialNetwork.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;
import org.springframework.data.annotation.CreatedDate;

import javax.persistence.*;
import java.util.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "comments")
public class Comment {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "comment_id")
  private Long commentId;
  private String content;
  @CreatedDate
  private Date createdAt;
  @JsonIgnore
  @OneToOne
  @JoinColumn(name = "parent_id", referencedColumnName = "comment_id")
  private Comment parentComment;
  @OneToMany(mappedBy = "comments", orphanRemoval = true,cascade = CascadeType.REMOVE)
  private Collection<CommentLike> commentLikes;
  @JsonIgnore
  @ManyToOne(fetch = FetchType.EAGER)
  @JoinColumn(name = "user_id", referencedColumnName = "user_id")
  private User user;
  @JsonIgnore
  @ManyToOne
  @JoinColumn(name = "job_id", referencedColumnName = "job_id")
  private Job job;

  @JsonIgnore
  @ManyToOne
  @JoinColumn(name = "post_id", referencedColumnName = "post_id")
  private Post post;

  @Transient
  List<Comment> children = new ArrayList<>();
  public void setUsers(User newUser) {
    if (this.user == null || !this.user.equals(newUser))
    {
      if (this.user != null)
      {
        User oldUser = this.user;
        this.user = null;
        oldUser.removeComments(this);
      }
      if (newUser != null)
      {
        this.user = newUser;
        this.user.addComments(this);
      }
    }
  }
  public Job getJobs() {
    return job;
  }
  public void setJobs(Job newJob) {
    if (this.job == null || !this.job.equals(newJob))
    {
      if (this.job != null)
      {
        Job oldJob = this.job;
        this.job = null;
        oldJob.removeComments(this);
      }
      if (newJob != null)
      {
        this.job = newJob;
        this.job.addComments(this);
      }
    }
  }
  public void removeCommentLikes(){
    this.setCommentLikes(new ArrayList<>());

  }

}