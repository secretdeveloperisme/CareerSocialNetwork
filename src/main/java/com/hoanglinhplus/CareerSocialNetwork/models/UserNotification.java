package com.hoanglinhplus.CareerSocialNetwork.models;

import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import javax.persistence.*;
import java.util.*;

@Builder
@NoArgsConstructor @AllArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "user_notifications")
public class UserNotification {
   @Id
   @GeneratedValue(strategy = GenerationType.IDENTITY)
   @Column(name = "notification_id")
   private Long notificationId;
   @Column(length = 255)
   private String title;
   @Column(length = 1000)
   private String content;
   @Column(length = 50)
   private String type;
   @CreatedDate
   private Date createdAt;
   @LastModifiedDate
   private Date deletedAt;
   private boolean isRead = Boolean.FALSE ;
   @ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
   @JoinTable(name = "user_notification_relationship",joinColumns = @JoinColumn(name = "notification_id", referencedColumnName = "notification_id")
      , inverseJoinColumns = @JoinColumn(name = "user_id", referencedColumnName = "user_id"))
   public List<User> user;
   public List<User> getUser() {
      if (user == null)
         user = new ArrayList<>();
      return user;
   }
   public Iterator<User> getIteratorUser_notification() {
      if (user == null)
         user = new ArrayList<>();
      return user.iterator();
   }


   public void setUser(List<User> newUser_notification) {
      removeAllUser_notification();
      for (User value : newUser_notification) addUser_notification(value);
   }


   public void addUser_notification(User newUser) {
      if (newUser == null)
         return;
      if (this.user == null)
         this.user = new ArrayList<>();
      if (!this.user.contains(newUser))
      {
         this.user.add(newUser);
         newUser.addUserNotification(this);
      }
   }


   public void removeUser_notification(User oldUser) {
      if (oldUser == null)
         return;
      if (this.user != null)
         if (this.user.contains(oldUser))
         {
            this.user.remove(oldUser);
            oldUser.removeUserNotification(this);
         }
   }

   public void removeAllUser_notification() {
      if (user != null)
      {
         User oldUser;
         for (Iterator<User> iter = getIteratorUser_notification(); iter.hasNext();)
         {
            oldUser = iter.next();
            iter.remove();
            oldUser.removeUserNotification(this);
         }
      }
   }
}