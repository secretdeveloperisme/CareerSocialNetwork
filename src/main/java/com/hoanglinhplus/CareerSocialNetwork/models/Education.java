package com.hoanglinhplus.CareerSocialNetwork.models;

import lombok.*;

import javax.persistence.*;
import java.util.Date;


@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "educations")
public class Education {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long educationId;
  @Column(nullable = false)
  private String schoolName;
  private Date startDate;
  private Date endDate;
  private float grade;
  @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
  @JoinColumn(name = "user_id", referencedColumnName = "user_id")
  private User user;

  public User getUser() {
    return user;
  }

  public void setUser(User newUser) {
    if (this.user == null || !this.user.equals(newUser))
    {
      if (this.user != null)
      {
        User oldUser = this.user;
        this.user = null;
        oldUser.removeEducations(this);
      }
      if (newUser != null)
      {
        this.user = newUser;
        this.user.addEducations(this);
      }
    }
  }

}