package com.hoanglinhplus.CareerSocialNetwork.models;

import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.util.*;


@Builder
@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@EntityListeners(AuditingEntityListener.class)
@Entity
@IdClass(AnswerId.class)
@Table(name = "answers")
public class Answer {
   @Id
   @Column(name = "job_que_id" )
   private Long jobQueId;
   @Id
   @Column(name = "user_id")
   private Long userId;
   @Column(nullable = false, length = 3000)
   public String answer;
   @CreatedDate
   public Date createdAt;
   @ManyToOne
   @JoinColumn(name = "job_que_id", referencedColumnName = "job_que_id", insertable = false, updatable = false)
   public JobQuestion jobQuestion;
   @ManyToOne
   @JoinColumn(name = "user_id",referencedColumnName = "user_id",insertable = false, updatable = false)
   public User user;

}