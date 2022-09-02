package com.hoanglinhplus.CareerSocialNetwork.models;

import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import javax.persistence.*;
import java.util.List;
import java.util.Date;
import java.util.ArrayList;
import java.util.Iterator;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
@Entity
@Table(name = "jobs")
public class Job {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "job_id")
  private Long jobId;
  @Column(nullable = false, length = 255)
  private String title;
  private String jobDescription;
  @Column(length = 1000)
  private String image;
  @Column(length = 1000)
  private String location;
  private int amount;
  private Date startDate;
  private Date endDate;
  private int salaryMin;
  private int salaryMax;
  @CreatedDate
  private Date createdAt;
  @LastModifiedDate
  private Date updatedAt;
  private Date deletedAt;
  private int experience;
  @ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
  @JoinTable(name = "job_tags", joinColumns = @JoinColumn(name = "job_id",  referencedColumnName = "job_id")
      , inverseJoinColumns = @JoinColumn(name = "tag_id", referencedColumnName = "tag_id"))
  private List<Tag> tags;
  @OneToMany(mappedBy = "job", cascade = {CascadeType.PERSIST, CascadeType.MERGE})
  private List<Comment> comments;
  @OneToMany(mappedBy = "job", cascade = {CascadeType.PERSIST, CascadeType.MERGE})
  private List<JobQuestion> jobQuestion;
  @OneToMany(mappedBy = "job", cascade = {CascadeType.PERSIST, CascadeType.MERGE})
  private List<Application> applications;
  @ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
  @JoinTable(name = "job_skills", joinColumns = @JoinColumn(name = "job_id",  referencedColumnName = "job_id")
      , inverseJoinColumns = @JoinColumn(name = "skill_id", referencedColumnName = "skill_id"))
  private List<Skill> job_skills;
  @ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
  @JoinTable(name = "likes", joinColumns = @JoinColumn(name = "job_id",  referencedColumnName = "job_id")
      , inverseJoinColumns = @JoinColumn(name = "user_id", referencedColumnName = "user_id"))
  private List<User> likes;
  @ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
  @JoinTable(name = "bookmarks", joinColumns = @JoinColumn(name = "job_id",  referencedColumnName = "job_id")
      , inverseJoinColumns = @JoinColumn(name = "user_id", referencedColumnName = "user_id"))
  private List<User> bookmarks;
  @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
  @JoinColumn(name = "employment_type_id", referencedColumnName = "employment_type_id")
  private EmploymentType employmentType;
  @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
  @JoinColumn(name = "company_id", referencedColumnName = "company_id")
  private Company company;
  @OneToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
  @JoinColumn(name = "position_id", referencedColumnName = "position_id")
  private Position position;
  @OneToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
  @JoinColumn(name = "work_place_id", referencedColumnName = "work_place_id")
  private WorkPlace workPlace;
  public List<Tag> getTags() {
    if (tags == null)
      tags = new ArrayList<>();
    return tags;
  }
  public Iterator<Tag> getIteratorJob_tags() {
    if (tags == null)
      tags = new ArrayList<>();
    return tags.iterator();
  }
  public void setJobTags(List<Tag> newJob_tags) {
    removeAllJobTags();
    for (Tag newJob_tag : newJob_tags) addJobTags(newJob_tag);
  }
  public void addJobTags(Tag newTag) {
    if (newTag == null)
      return;
    if (this.tags == null)
      this.tags = new ArrayList<>();
    if (!this.tags.contains(newTag))
    {
      this.tags.add(newTag);
      newTag.addJobTags(this);
    }
  }
  public void removeJobTags(Tag oldTag) {
    if (oldTag == null)
      return;
    if (this.tags != null)
      if (this.tags.contains(oldTag))
      {
        this.tags.remove(oldTag);
        oldTag.removeJobTags(this);
      }
  }
  public void removeAllJobTags() {
    if (tags != null)
    {
      Tag oldTag;
      for (Iterator<Tag> iter = getIteratorJob_tags(); iter.hasNext();)
      {
        oldTag = iter.next();
        iter.remove();
        oldTag.removeJobTags(this);
      }
    }
  }
  public List<Comment> getComments() {
    if (comments == null)
      comments = new ArrayList<>();
    return comments;
  }
  public Iterator<Comment> getIteratorComments() {
    if (comments == null)
      comments = new ArrayList<>();
    return comments.iterator();
  }
  public void setComments(List<Comment> newComments) {
    removeAllComments();
    for (Comment newComment : newComments) addComments(newComment);
  }
  public void addComments(Comment newComment) {
    if (newComment == null)
      return;
    if (this.comments == null)
      this.comments = new ArrayList<>();
    if (!this.comments.contains(newComment))
    {
      this.comments.add(newComment);
      newComment.setJobs(this);
    }
  }
  public void removeComments(Comment oldComment) {
    if (oldComment == null)
      return;
    if (this.comments != null)
      if (this.comments.contains(oldComment))
      {
        this.comments.remove(oldComment);
        oldComment.setJobs(null);
      }
  }

  public void removeAllComments() {
    if (comments != null)
    {
      Comment oldComment;
      for (Iterator<Comment> iter = getIteratorComments(); iter.hasNext();)
      {
        oldComment = iter.next();
        iter.remove();
        oldComment.setJobs(null);
      }
    }
  }
  public List<JobQuestion> getJobQuestion() {
    if (jobQuestion == null)
      jobQuestion = new ArrayList<>();
    return jobQuestion;
  }

  public Iterator<JobQuestion> getIteratorJobQuestion() {
    if (jobQuestion == null)
      jobQuestion = new ArrayList<>();
    return jobQuestion.iterator();
  }
  public void setJobQuestion(List<JobQuestion> newJobQuestion) {
    removeAllJobQuestion();
    for (JobQuestion question : newJobQuestion) addJobQuestion(question);
  }
  public void addJobQuestion(JobQuestion newJobQuestion) {
    if (newJobQuestion == null)
      return;
    if (this.jobQuestion == null)
      this.jobQuestion = new ArrayList<>();
    if (!this.jobQuestion.contains(newJobQuestion))
    {
      this.jobQuestion.add(newJobQuestion);
      newJobQuestion.setJobs(this);
    }
  }
  public void removeJobQuestion(JobQuestion oldJobQuestion) {
    if (oldJobQuestion == null)
      return;
    if (this.jobQuestion != null)
      if (this.jobQuestion.contains(oldJobQuestion))
      {
        this.jobQuestion.remove(oldJobQuestion);
        oldJobQuestion.setJobs(null);
      }
  }
  public void removeAllJobQuestion() {
    if (jobQuestion != null)
    {
      JobQuestion oldJobQuestion;
      for (Iterator<JobQuestion> iter = getIteratorJobQuestion(); iter.hasNext();)
      {
        oldJobQuestion = iter.next();
        iter.remove();
        oldJobQuestion.setJobs(null);
      }
    }
  }
  public List<Skill> getJob_skills() {
    if (job_skills == null)
      job_skills = new ArrayList<>();
    return job_skills;
  }
  public Iterator<Skill> getIteratorJob_skills() {
    if (job_skills == null)
      job_skills = new ArrayList<>();
    return job_skills.iterator();
  }
  public void setJob_skills(List<Skill> newJob_skills) {
    removeAllJob_skills();
    for (Skill newJob_skill : newJob_skills) addJob_skills(newJob_skill);
  }
  public void addJob_skills(Skill newSkill) {
    if (newSkill == null)
      return;
    if (this.job_skills == null)
      this.job_skills = new ArrayList<>();
    if (!this.job_skills.contains(newSkill))
    {
      this.job_skills.add(newSkill);
      newSkill.addJobSkills(this);
    }
  }


  public void removeJob_skills(Skill oldSkill) {
    if (oldSkill == null)
      return;
    if (this.job_skills != null)
      if (this.job_skills.contains(oldSkill))
      {
        this.job_skills.remove(oldSkill);
        oldSkill.removeJobSkills(this);
      }
  }

  public void removeAllJob_skills() {
    if (job_skills != null)
    {
      Skill oldSkill;
      for (Iterator<Skill> iter = getIteratorJob_skills(); iter.hasNext();)
      {
        oldSkill = iter.next();
        iter.remove();
        oldSkill.removeJobSkills(this);
      }
    }
  }
  public List<User> getLikes() {
    if (likes == null)
      likes = new ArrayList<>();
    return likes;
  }

  public Iterator<User> getIteratorLikes() {
    if (likes == null)
      likes = new ArrayList<>();
    return likes.iterator();
  }


  public void setLikes(List<User> newLikes) {
    removeAllLikes();
    for (User newLike : newLikes) addLikes(newLike);
  }


  public void addLikes(User newUser) {
    if (newUser == null)
      return;
    if (this.likes == null)
      this.likes = new ArrayList<>();
    if (!this.likes.contains(newUser))
    {
      this.likes.add(newUser);
      newUser.addLikes(this);
    }
  }


  public void removeLikes(User oldUser) {
    if (oldUser == null)
      return;
    if (this.likes != null)
      if (this.likes.contains(oldUser))
      {
        this.likes.remove(oldUser);
        oldUser.removeLikes(this);
      }
  }

  public void removeAllLikes() {
    if (likes != null)
    {
      User oldUser;
      for (Iterator<User> iter = getIteratorLikes(); iter.hasNext();)
      {
        oldUser = iter.next();
        iter.remove();
        oldUser.removeLikes(this);
      }
    }
  }
  public List<User> getBookmarks() {
    if (bookmarks == null)
      bookmarks = new ArrayList<>();
    return bookmarks;
  }

  public Iterator<User> getIteratorBookmarks() {
    if (bookmarks == null)
      bookmarks = new ArrayList<>();
    return bookmarks.iterator();
  }


  public void setBookmarks(List<User> newBookmarks) {
    removeAllBookmarks();
    for (User newBookmark : newBookmarks) addBookmarks(newBookmark);
  }


  public void addBookmarks(User newUser) {
    if (newUser == null)
      return;
    if (this.bookmarks == null)
      this.bookmarks = new ArrayList<>();
    if (!this.bookmarks.contains(newUser))
    {
      this.bookmarks.add(newUser);
      newUser.addBookmarks(this);
    }
  }


  public void removeBookmarks(User oldUser) {
    if (oldUser == null)
      return;
    if (this.bookmarks != null)
      if (this.bookmarks.contains(oldUser))
      {
        this.bookmarks.remove(oldUser);
        oldUser.removeBookmarks(this);
      }
  }

  public void removeAllBookmarks() {
    if (bookmarks != null)
    {
      User oldUser;
      for (Iterator<User> iter = getIteratorBookmarks(); iter.hasNext();)
      {
        oldUser = iter.next();
        iter.remove();
        oldUser.removeBookmarks(this);
      }
    }
  }
  public EmploymentType getEmploymentType() {
    return employmentType;
  }


  public void setEmploymentType(EmploymentType newEmploymentType) {
    if (this.employmentType == null || !this.employmentType.equals(newEmploymentType))
    {
      if (this.employmentType != null)
      {
        EmploymentType oldEmploymentType = this.employmentType;
        this.employmentType = null;
        oldEmploymentType.removeJobs(this);
      }
      if (newEmploymentType != null)
      {
        this.employmentType = newEmploymentType;
        this.employmentType.addJobs(this);
      }
    }
  }
  public Company getCompany() {
    return company;
  }


  public void setCompany(Company newCompany) {
    if (this.company == null || !this.company.equals(newCompany))
    {
      if (this.company != null)
      {
        Company oldCompany = this.company;
        this.company = null;
        oldCompany.removeJobs(this);
      }
      if (newCompany != null)
      {
        this.company = newCompany;
        this.company.addJobs(this);
      }
    }
  }
}