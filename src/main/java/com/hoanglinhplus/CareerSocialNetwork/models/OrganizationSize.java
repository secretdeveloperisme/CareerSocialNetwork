package com.hoanglinhplus.CareerSocialNetwork.models;

import lombok.*;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
@Entity
@Table(name = "organization_sizes")
public class OrganizationSize {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long organizationId;
  @Column(length = 50)
  private String name;
  @OneToMany(mappedBy = "organizationSize",cascade = {CascadeType.PERSIST, CascadeType.MERGE})
  private List<Company> companies;

  public Collection<Company> getCompanies() {
    if (companies == null)
      companies = new ArrayList<>();
    return companies;
  }

  public Iterator<Company> getIteratorCompanies() {
    if (companies == null)
      companies = new ArrayList<>();
    return companies.iterator();
  }

  public void setCompanies(Collection<Company> newCompanies) {
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
      newCompany.setOrganizationSizes(this);
    }
  }

  public void removeCompanies(Company oldCompany) {
    if (oldCompany == null)
      return;
    if (this.companies != null)
      if (this.companies.contains(oldCompany))
      {
        this.companies.remove(oldCompany);
        oldCompany.setOrganizationSizes(null);
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
        oldCompany.setOrganizationSizes(null);
      }
    }
  }
}