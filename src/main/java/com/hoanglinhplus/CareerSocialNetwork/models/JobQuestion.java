package com.hoanglinhplus.CareerSocialNetwork.models;

import lombok.*;

import javax.persistence.*;
import java.util.List;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "job_question")
public class JobQuestion {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "job_que_id")
  private Long jobQueId;
  @OneToMany(mappedBy = "jobQuestion")
  private List<Answer> answers;
  @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
  @JoinColumn(name = "job_id", referencedColumnName = "job_id")
  private Job job;
  @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
  @JoinColumn(name = "question_id", referencedColumnName = "question_id")
  private Question question;
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
        oldJob.removeJobQuestion(this);
      }
      if (newJob != null)
      {
        this.job = newJob;
        this.job.addJobQuestion(this);
      }
    }
  }
  public Question getQuestions() {
    return question;
  }


  public void setQuestions(Question newQuestion) {
    if (this.question == null || !this.question.equals(newQuestion))
    {
      if (this.question != null)
      {
        Question oldQuestion = this.question;
        this.question = null;
        oldQuestion.removeJobQuestion(this);
      }
      if (newQuestion != null)
      {
        this.question = newQuestion;
        this.question.addJobQuestion(this);
      }
    }
  }
}