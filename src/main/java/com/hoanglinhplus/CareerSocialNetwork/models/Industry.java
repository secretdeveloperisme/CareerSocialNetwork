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
@Table(name = "industries")
public class Industry {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "industry_id")
  private Long industryId;
  @Column(name = "name")
  private String name;
  @OneToMany(mappedBy = "industry")
  private List<Company> companies;
  public List<Company> getCompanies() {
    if (companies == null)
      companies = new ArrayList<>();
    return companies;

  }
  public Iterator<Company> getIteratorCompanies() {
    if (companies == null)
      companies = new ArrayList<>();
    return companies.iterator();
  }
  public void setCompanies(List<Company> newCompanies) {
    removeAllCompanies();
    for (Company newCompany : newCompanies) addCompanies(newCompany);
  }
  public void addCompanies(Company newCompany) {
    if (newCompany == null)
      return;
    if (this.companies == null)
      this.companies = new ArrayList<>();
    if (!this.companies.contains(newCompany))
    {
      this.companies.add(newCompany);
      newCompany.setIndustries(this);
    }
  }
  public void removeCompanies(Company oldCompany) {
    if (oldCompany == null)
      return;
    if (this.companies != null)
      if (this.companies.contains(oldCompany))
      {
        this.companies.remove(oldCompany);
        oldCompany.setIndustries(null);
      }
  }
  public void removeAllCompanies() {
    if (companies != null)
    {
      Company oldCompany;
      for (Iterator<Company> iter = getIteratorCompanies(); iter.hasNext();)
      {
        oldCompany = iter.next();
        iter.remove();
        oldCompany.setIndustries(null);
      }
    }
  }

}