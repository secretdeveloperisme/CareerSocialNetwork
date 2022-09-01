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
@Table(name = "questions")
public class Question {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "question_id")
  private Long questionId;
  @Column(nullable = false, length = 1000)
  private String content;
  @OneToMany(mappedBy = "question", cascade = {CascadeType.PERSIST, CascadeType.MERGE})
  public List<JobQuestion> jobQuestion;

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
      newJobQuestion.setQuestions(this);
    }
  }

  public void removeJobQuestion(JobQuestion oldJobQuestion) {
    if (oldJobQuestion == null)
      return;
    if (this.jobQuestion != null)
      if (this.jobQuestion.contains(oldJobQuestion))
      {
        this.jobQuestion.remove(oldJobQuestion);
        oldJobQuestion.setQuestions(null);
      }
  }

  public void removeAllJobQuestion() {
    if (jobQuestion != null)
    {
      JobQuestion oldJobQuestion;
      for (Iterator<JobQuestion> iter = getIteratorJobQuestion(); iter.hasNext();)
      {
        oldJobQuestion = (JobQuestion)iter.next();
        iter.remove();
        oldJobQuestion.setQuestions(null);
      }
    }
  }
}