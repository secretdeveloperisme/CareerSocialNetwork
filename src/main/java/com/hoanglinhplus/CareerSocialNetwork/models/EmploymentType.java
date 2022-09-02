package com.hoanglinhplus.CareerSocialNetwork.models;

import lombok.*;

import javax.persistence.*;
import java.util.List;
import java.util.ArrayList;
import java.util.Iterator;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "employment_types")
public class EmploymentType {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "employment_type_id")
  private Long employmentTypeId;
  private String name;
  @OneToMany(mappedBy = "employmentType",cascade = {CascadeType.PERSIST, CascadeType.MERGE})
  private List<Job> jobs;

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
      newJob.setEmploymentType(this);
    }
  }

  public void removeJobs(Job oldJob) {
    if (oldJob == null)
      return;
    if (this.jobs != null)
      if (this.jobs.contains(oldJob))
      {
        this.jobs.remove(oldJob);
        oldJob.setEmploymentType(null);
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
        oldJob.setEmploymentType(null);
      }
    }
  }

}