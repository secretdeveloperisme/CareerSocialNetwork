package com.hoanglinhplus.CareerSocialNetwork.models;

import lombok.*;

import javax.persistence.*;
import java.util.Collection;
import java.util.Date;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "comments")
public class Comment {
  @Id
  public int commentId;
  public String content;
  public Date createdAt;

  @OneToOne
  @JoinColumn(name = "parent_id", referencedColumnName = "comment_id")
  public Comment parentComment;
  @OneToMany(mappedBy = "comments")
  public Collection<CommentLike> commentLikes;
  @ManyToOne
  @JoinColumn(name = "user_id", referencedColumnName = "user_id")
  public User user;
  @ManyToOne
  @JoinColumn(name = "job_id", referencedColumnName = "JOB_ID")
  public Job job;


  public User getUsers() {
    return user;
  }
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

}