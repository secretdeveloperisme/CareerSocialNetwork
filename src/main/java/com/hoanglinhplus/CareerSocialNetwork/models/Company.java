package com.hoanglinhplus.CareerSocialNetwork.models;

import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.util.*;

@Builder
@NoArgsConstructor @AllArgsConstructor
@Getter @Setter
@Entity
@Table(name = "companies")
@EntityListeners(AuditingEntityListener.class)
public class Company {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "company_id")
  private Long companyId;
  @Column(nullable = false, length = 255)
  private String name;
  @Column(length = 255)
  private String website;
  @Column(length = 255)
  private String logo;

  private String tagLine;
  @CreatedDate
  private Date createdAt;
  @LastModifiedDate
  private Date updatedAt;
  private Date deletedAt;
  @OneToMany(mappedBy = "company", orphanRemoval = true,cascade = {CascadeType.PERSIST, CascadeType.MERGE})
  private List<Job> jobs;
  @OneToMany(mappedBy = "company", orphanRemoval = true, cascade = {CascadeType.PERSIST, CascadeType.MERGE})
  private List<CompanyNotification> companyNotifications;
  @OneToMany(mappedBy = "company", orphanRemoval = true, cascade = {CascadeType.PERSIST, CascadeType.MERGE})
  private List<CompanyUserRole> companyUserRoles;
  @ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
  @JoinTable(name = "follow_companies", joinColumns = @JoinColumn(name = "company_id", referencedColumnName = "company_id")
      , inverseJoinColumns = @JoinColumn(name = "user_id", referencedColumnName = "user_id"))
  private List<User> follow_companies;
  @ManyToOne(fetch = FetchType.EAGER)
  @JoinColumn(name = "organization_size_id", referencedColumnName = "organization_size_id")
  private OrganizationSize organizationSize;
  @ManyToOne(fetch = FetchType.EAGER)
  @JoinColumn(name = "industry_id", referencedColumnName = "industry_id")
  private Industry industry;
  @ManyToOne
  @JoinColumn(name = "user_id", referencedColumnName = "user_id")
  private User createdUser;
  public List<Job> getJobs() {
    if (jobs == null)
      jobs = new ArrayList<>();
    return jobs;
  }

  public Iterator<Job> getIteratorJobs() {
    if (jobs == null)
      jobs = new ArrayList<>();
    return jobs.iterator();
  }



  public void setJobs(List<Job> newJobs) {
    removeAllJobs();
    for (Job newJob : newJobs) addJobs(newJob);
  }

  public void addJobs(Job newJob) {
    if (newJob == null)
      return;
    if (this.jobs == null)
      this.jobs = new ArrayList<>();
    if (!this.jobs.contains(newJob))
    {
      this.jobs.add(newJob);
      newJob.setCompany(this);
    }
  }

  public void removeJobs(Job oldJob) {
    if (oldJob == null)
      return;
    if (this.jobs != null)
      if (this.jobs.contains(oldJob))
      {
        this.jobs.remove(oldJob);
        oldJob.setCompany(null);
      }
  }
  public void removeAllJobs() {
    if (jobs != null)
    {
      Job oldJob;
      for (Iterator<Job> iter = getIteratorJobs(); iter.hasNext();)
      {
        oldJob = iter.next();
        iter.remove();
        oldJob.setCompany(null);
      }
    }
  }

  public List<CompanyNotification> getCompanyNotifications() {
    if (companyNotifications == null)
      companyNotifications = new ArrayList<>();
    return companyNotifications;
  }

  public Iterator<CompanyNotification> getIteratorCompanyNotifications() {
    if (companyNotifications == null)
      companyNotifications = new ArrayList<>();
    return companyNotifications.iterator();
  }



  public void setCompanyNotifications(List<CompanyNotification> newCompanyNotifications) {
    removeAllCompanyNotifications();
    for (CompanyNotification newCompanyNotification : newCompanyNotifications)
      addCompanyNotifications(newCompanyNotification);
  }

  public void addCompanyNotifications(CompanyNotification newCompanyNotification) {
    if (newCompanyNotification == null)
      return;
    if (this.companyNotifications == null)
      this.companyNotifications = new ArrayList<>();
    if (!this.companyNotifications.contains(newCompanyNotification))
    {
      this.companyNotifications.add(newCompanyNotification);
      newCompanyNotification.setCompanies(this);
    }
  }

  public void removeCompanyNotifications(CompanyNotification oldCompanyNotification) {
    if (oldCompanyNotification == null)
      return;
    if (this.companyNotifications != null)
      if (this.companyNotifications.contains(oldCompanyNotification))
      {
        this.companyNotifications.remove(oldCompanyNotification);
        oldCompanyNotification.setCompanies(null);
      }
  }

  public void removeAllCompanyNotifications() {
    if (companyNotifications != null)
    {
      CompanyNotification oldCompanyNotification;
      for (Iterator<CompanyNotification> iter = getIteratorCompanyNotifications(); iter.hasNext();)
      {
        oldCompanyNotification = iter.next();
        iter.remove();
        oldCompanyNotification.setCompanies(null);
      }
    }
  }

  public List<User> getFollowCompanies() {
    if (follow_companies == null)
      follow_companies = new ArrayList<>();
    return follow_companies;
  }

  public Iterator<User> getIteratorFollowCompanies() {
    if (follow_companies == null)
      follow_companies = new ArrayList<>();
    return follow_companies.iterator();
  }

  public void setFollowCompanies(List<User> newFollowCompanies) {
    removeAllFollow_companies();
    for (User newFollowCompany : newFollowCompanies) addFollow_companies(newFollowCompany);
  }

  public void addFollow_companies(User newUser) {
    if (newUser == null)
      return;
    if (this.follow_companies == null)
      this.follow_companies = new ArrayList<>();
    if (!this.follow_companies.contains(newUser))
    {
      this.follow_companies.add(newUser);
      newUser.addFollow_companies(this);
    }
  }

  public void removeFollow_companies(User oldUser) {
    if (oldUser == null)
      return;
    if (this.follow_companies != null)
      if (this.follow_companies.contains(oldUser))
      {
        this.follow_companies.remove(oldUser);
        oldUser.removeFollow_companies(this);
      }
  }

  public void removeAllFollow_companies() {
    if (follow_companies != null)
    {
      User oldUser;
      for (Iterator<User> iter = getIteratorFollowCompanies(); iter.hasNext();)
      {
        oldUser = (User)iter.next();
        iter.remove();
        oldUser.removeFollow_companies(this);
      }
    }
  }


  public void setOrganizationSizes(OrganizationSize newOrganizationSize) {
    if (this.organizationSize == null || !this.organizationSize.equals(newOrganizationSize))
    {
      if (this.organizationSize != null)
      {
        OrganizationSize oldOrganizationSize = this.organizationSize;
        this.organizationSize = null;
        oldOrganizationSize.removeCompanies(this);
      }
      if (newOrganizationSize != null)
      {
        this.organizationSize = newOrganizationSize;
        this.organizationSize.addCompanies(this);
      }
    }
  }

  public void setIndustries(Industry newIndustry) {
    if (this.industry == null || !this.industry.equals(newIndustry))
    {
      if (this.industry != null)
      {
        Industry oldIndustry = this.industry;
        this.industry = null;
        oldIndustry.removeCompanies(this);
      }
      if (newIndustry != null)
      {
        this.industry = newIndustry;
        this.industry.addCompanies(this);
      }
    }
  }

  public void setUsers(User newUser) {
    if (this.createdUser == null || !this.createdUser.equals(newUser))
    {
      if (this.createdUser != null)
      {
        User oldUser = this.createdUser;
        this.createdUser = null;
        oldUser.removeCompanies(this);
      }
      if (newUser != null)
      {
        this.createdUser = newUser;
        this.createdUser.addCompanies(this);
      }
    }
  }
  public void removeAllRelationShip(){
    removeAllJobs();
    removeAllFollow_companies();
    removeAllCompanyNotifications();
  }

}