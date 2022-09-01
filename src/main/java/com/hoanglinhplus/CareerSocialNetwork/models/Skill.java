package com.hoanglinhplus.CareerSocialNetwork.models;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.List;
import java.util.ArrayList;
import java.util.Iterator;

@Builder
@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "skills")
public class Skill {
   @Id
   @GeneratedValue(strategy = GenerationType.IDENTITY)
   private long skillId;
   @NotNull
   @Column(nullable = false)
   private String name;
   @ManyToMany(fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE})
   @JoinTable(name = "job_skills", joinColumns = @JoinColumn(name = "skill_id", referencedColumnName = "skill_id")
      , inverseJoinColumns = @JoinColumn(name = "job_id",referencedColumnName = "job_id"))
   private List<Job> jobs;
   @ManyToMany(fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE})
   @JoinTable(name = "user_skills",joinColumns =@JoinColumn(name = "skill_id", referencedColumnName = "skill_id")
       ,  inverseJoinColumns = @JoinColumn(name = "user_id", referencedColumnName = "user_id"))
   private List<User> users;
   
   public List<Job> getJobs() {

      if (jobs == null)
         jobs = new ArrayList<>();
      return jobs;
   }
   public Iterator<Job> getIteratorJob_skills() {
      if (jobs == null)
         jobs = new ArrayList<>();
      return jobs.iterator();
   }
   
   public void setJobSkills(List<Job> newJob_skills) {
      removeAllJobSkills();
      for (Job newJob_skill : newJob_skills) addJobSkills(newJob_skill);
   }

   public void addJobSkills(Job newJob) {
      if (newJob == null)
         return;
      if (this.jobs == null)
         this.jobs = new ArrayList<>();
      if (!this.jobs.contains(newJob))
      {
         this.jobs.add(newJob);
         newJob.addJob_skills(this);
      }
   }

   public void removeJobSkills(Job oldJob) {
      if (oldJob == null)
         return;
      if (this.jobs != null)
         if (this.jobs.contains(oldJob))
         {
            this.jobs.remove(oldJob);
            oldJob.removeJob_skills(this);
         }
   }
   public void removeAllJobSkills() {
      if (jobs != null)
      {
         Job oldJob;
         for (Iterator<Job> iter = getIteratorJob_skills(); iter.hasNext();)
         {
            oldJob = iter.next();
            iter.remove();
            oldJob.removeJob_skills(this);
         }
      }
   }
   public List<User> getUserSkills() {
      if (users == null)
         users = new ArrayList<>();
      return users;
   }
   
   public Iterator<User> getIteratorUserSkills() {
      if (users == null)
         users = new ArrayList<>();
      return users.iterator();
   }
   
   
   public void setUserSkills(List<User> newUser_skills) {
      removeAllUserSkills();
      for (User newUser_skill : newUser_skills) addUserSkills(newUser_skill);
   }
   
   
   public void addUserSkills(User newUser) {
      if (newUser == null)
         return;
      if (this.users == null)
         this.users = new ArrayList<>();
      if (!this.users.contains(newUser))
      {
         this.users.add(newUser);
         newUser.addUser_skills(this);
      }
   }

   public void removeUserSkills(User oldUser) {
      if (oldUser == null)
         return;
      if (this.users != null)
         if (this.users.contains(oldUser))
         {
            this.users.remove(oldUser);
            oldUser.removeUser_skills(this);
         }
   }
   
   public void removeAllUserSkills() {
      if (users != null)
      {
         User oldUser;
         for (Iterator<User> iter = getIteratorUserSkills(); iter.hasNext();)
         {
            oldUser = iter.next();
            iter.remove();
            oldUser.removeUser_skills(this);
         }
      }
   }
}