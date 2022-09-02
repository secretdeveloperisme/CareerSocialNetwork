package com.hoanglinhplus.CareerSocialNetwork.models;

import lombok.*;
import org.springframework.data.annotation.CreatedDate;

import javax.persistence.*;
import java.util.*;


@Builder
@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@IdClass(AnswerId.class)
@Table(name = "answers")
public class Answer {
   @Id
   @Column(name = "job_que_id", insertable = false, updatable = false)
   private Long jobQueId;
   @Id
   @Column(name = "user_id", insertable = false, updatable = false)
   private Long userId;
   @Column(nullable = false, length = 1000)
   public String answer;
   @CreatedDate
   public Date createdAt;
   @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
   @JoinColumn(name = "job_que_id", referencedColumnName = "job_que_id")
   public JobQuestion jobQuestion;
   @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
   @JoinColumn(name = "user_id",referencedColumnName = "user_id")
   public User user;

}