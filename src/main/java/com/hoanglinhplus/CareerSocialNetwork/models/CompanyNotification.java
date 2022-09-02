package com.hoanglinhplus.CareerSocialNetwork.models;

import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import javax.persistence.*;
import java.util.Date;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "company_notifications")
public class CompanyNotification {
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
  private boolean isRead = Boolean.FALSE;
  @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
  @JoinColumn(name = "company_id", referencedColumnName = "company_id")
  private Company company;

  public Company getCompanies() {
    return company;
  }
  public void setCompanies(Company newCompany) {
    if (this.company == null || !this.company.equals(newCompany))
    {
      if (this.company != null)
      {
        Company oldCompany = this.company;
        this.company = null;
        oldCompany.removeCompanyNotifications(this);
      }
      if (newCompany != null)
      {
        this.company = newCompany;
        this.company.addCompanyNotifications(this);
      }
    }
  }

}