package com.hoanglinhplus.CareerSocialNetwork.models;

import lombok.*;

import javax.persistence.*;
import java.util.*;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "tags")
public class Tag {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "tag_id")
  private Long tagId;
  @Column(nullable = false, length = 50)
  private String name;
  @ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
  @JoinTable(name = "job_tags",joinColumns = @JoinColumn(name = "tag_id", referencedColumnName = "tag_id")
      , inverseJoinColumns = @JoinColumn(name = "job_id", referencedColumnName = "job_id"))
  public List<Job> jobTags;
  @ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
  @JoinTable(name = "follow_tags",joinColumns = @JoinColumn(name = "tag_id", referencedColumnName = "tag_id")
      , inverseJoinColumns = @JoinColumn(name = "user_id", referencedColumnName = "user_id"))
  public List<User> followTagUsers;
  public List<Job> getJobTags() {
    if (jobTags == null)
      jobTags = new ArrayList<>();
    return jobTags;
  }
  public void setJobTags(Collection<Job> newJobTags) {
    removeAllJobTags();
    for (Job job: newJobTags)
      addJobTags(job);
  }
  public void addJobTags(Job newJob) {
    if (newJob == null)
      return;
    if (this.jobTags == null)
      this.jobTags = new ArrayList<>();
    if (!this.jobTags.contains(newJob))
    {
      this.jobTags.add(newJob);
      newJob.addJobTags(this);
    }
  }

  public void removeJobTags(Job oldJob) {
    if (oldJob == null)
      return;
    if (this.jobTags != null)
      if (this.jobTags.contains(oldJob))
      {
        this.jobTags.remove(oldJob);
        oldJob.removeJobTags(this);
      }
  }

  public void removeAllJobTags() {
    if (jobTags != null)
    {
      Job oldJob;
      for (Iterator<Job> iter = getIteratorJobTags(); iter.hasNext();)
      {
        oldJob = iter.next();
        iter.remove();
        oldJob.removeJobTags(this);
      }
    }
  }

  public Iterator<User> getIteratorFollowTags() {
    if (followTagUsers == null)
      followTagUsers = new ArrayList<>();
    return followTagUsers.iterator();
  }
  public Iterator<Job> getIteratorJobTags() {
    if (jobTags == null)
      jobTags = new ArrayList<>();
    return jobTags.iterator();
  }

  public void setFollowTagUsers(Collection<User> newFollow_tags) {
    removeAllFollowTagUsers();
    for (User newFollow_tag : newFollow_tags) addFollowTagUser(newFollow_tag);
  }
  public void addFollowTagUser(User newUser) {
    if (newUser == null)
      return;
    if (this.followTagUsers == null)
      this.followTagUsers = new ArrayList<>();
    if (!this.followTagUsers.contains(newUser))
    {
      this.followTagUsers.add(newUser);
      newUser.addFollow_tags(this);
    }
  }

  public void removeFollowTagUser(User oldUser) {
    if (oldUser == null)
      return;
    if (this.followTagUsers != null)
      if (this.followTagUsers.contains(oldUser))
      {
        this.followTagUsers.remove(oldUser);
        oldUser.removeFollow_tags(this);
      }
  }

  public void removeAllFollowTagUsers() {
    if (followTagUsers != null)
    {
      User oldUser;
      for (Iterator<User> iter = getIteratorFollowTags(); iter.hasNext();)
      {
        oldUser = iter.next();
        iter.remove();
        oldUser.removeFollow_tags(this);
      }
    }
  }
}