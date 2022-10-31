/***********************************************************************
 * Module:  Companies.java
 * Author:  linh2
 * Purpose: Defines the Class Companies
 ***********************************************************************/

import java.util.*;

/** @pdOid ff746e32-8694-4a05-9b04-a16a012a0d8d */
public class Companies {
   /** @pdOid 4779843d-0c0f-45ec-8854-d1985cfa1500 */
   public int companyId;
   /** @pdOid 736ad348-6f86-4876-bf2c-11cfb2a0ba96 */
   public java.lang.String name;
   /** @pdOid 4a1c2d31-e3f8-456c-9f07-50f3fc3812ef */
   public java.lang.String website;
   /** @pdOid 0e662b30-3f1a-42ad-bab9-6e7a09cd531a */
   public java.lang.String logo;
   /** @pdOid acc68aec-ff11-4b02-b98f-b306e54bd33f */
   public java.lang.String tagLine;
   /** @pdOid bea7e89f-f5f7-4b2e-8a3b-5f2b36856db1 */
   public java.util.Date createdAt;
   /** @pdOid d2a0b9d6-0b03-4c39-b12a-ad79ac7ab739 */
   public java.util.Date updatedAt;
   /** @pdOid 0a82dc62-a25a-466a-b1f7-81f1689158ca */
   public java.util.Date deletedAt;
   
   /** @pdRoleInfo migr=no name=Jobs assc=compnayJobs coll=java.util.Collection impl=java.util.HashSet mult=1..* */
   public java.util.Collection<Jobs> jobs;
   /** @pdRoleInfo migr=no name=CompanyNotifications assc=companyNotification coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   public java.util.Collection<CompanyNotifications> companyNotifications;
   public java.util.Collection userCompanyRoles;
   /** @pdRoleInfo migr=no name=Users assc=followCompanies coll=java.util.Collection impl=java.util.HashSet mult=0..* side=A */
   public java.util.Collection<Users> follow_companies;
   /** @pdRoleInfo migr=no name=OrganizationSizes assc=orgSizeCompanies mult=1..1 side=A */
   public OrganizationSizes organizationSizes;
   /** @pdRoleInfo migr=no name=Industries assc=industryCompanies mult=1..1 side=A */
   public Industries industries;
   /** @pdRoleInfo migr=no name=Users assc=userCreateCompanies mult=1..1 side=A */
   public Users users;
   
   
   /** @pdGenerated default getter */
   public java.util.Collection<Jobs> getJobs() {
      if (jobs == null)
         jobs = new java.util.HashSet<Jobs>();
      return jobs;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIteratorJobs() {
      if (jobs == null)
         jobs = new java.util.HashSet<Jobs>();
      return jobs.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newJobs */
   public void setJobs(java.util.Collection<Jobs> newJobs) {
      removeAllJobs();
      for (java.util.Iterator iter = newJobs.iterator(); iter.hasNext();)
         addJobs((Jobs)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newJobs */
   public void addJobs(Jobs newJobs) {
      if (newJobs == null)
         return;
      if (this.jobs == null)
         this.jobs = new java.util.HashSet<Jobs>();
      if (!this.jobs.contains(newJobs))
      {
         this.jobs.add(newJobs);
         newJobs.setCompanies(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param oldJobs */
   public void removeJobs(Jobs oldJobs) {
      if (oldJobs == null)
         return;
      if (this.jobs != null)
         if (this.jobs.contains(oldJobs))
         {
            this.jobs.remove(oldJobs);
            oldJobs.setCompanies((Companies)null);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllJobs() {
      if (jobs != null)
      {
         Jobs oldJobs;
         for (java.util.Iterator iter = getIteratorJobs(); iter.hasNext();)
         {
            oldJobs = (Jobs)iter.next();
            iter.remove();
            oldJobs.setCompanies((Companies)null);
         }
      }
   }
   /** @pdGenerated default getter */
   public java.util.Collection<CompanyNotifications> getCompanyNotifications() {
      if (companyNotifications == null)
         companyNotifications = new java.util.HashSet<CompanyNotifications>();
      return companyNotifications;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIteratorCompanyNotifications() {
      if (companyNotifications == null)
         companyNotifications = new java.util.HashSet<CompanyNotifications>();
      return companyNotifications.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newCompanyNotifications */
   public void setCompanyNotifications(java.util.Collection<CompanyNotifications> newCompanyNotifications) {
      removeAllCompanyNotifications();
      for (java.util.Iterator iter = newCompanyNotifications.iterator(); iter.hasNext();)
         addCompanyNotifications((CompanyNotifications)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newCompanyNotifications */
   public void addCompanyNotifications(CompanyNotifications newCompanyNotifications) {
      if (newCompanyNotifications == null)
         return;
      if (this.companyNotifications == null)
         this.companyNotifications = new java.util.HashSet<CompanyNotifications>();
      if (!this.companyNotifications.contains(newCompanyNotifications))
      {
         this.companyNotifications.add(newCompanyNotifications);
         newCompanyNotifications.setCompanies(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param oldCompanyNotifications */
   public void removeCompanyNotifications(CompanyNotifications oldCompanyNotifications) {
      if (oldCompanyNotifications == null)
         return;
      if (this.companyNotifications != null)
         if (this.companyNotifications.contains(oldCompanyNotifications))
         {
            this.companyNotifications.remove(oldCompanyNotifications);
            oldCompanyNotifications.setCompanies((Companies)null);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllCompanyNotifications() {
      if (companyNotifications != null)
      {
         CompanyNotifications oldCompanyNotifications;
         for (java.util.Iterator iter = getIteratorCompanyNotifications(); iter.hasNext();)
         {
            oldCompanyNotifications = (CompanyNotifications)iter.next();
            iter.remove();
            oldCompanyNotifications.setCompanies((Companies)null);
         }
      }
   }
   /** @pdGenerated default getter */
   public java.util.Collection<Users> getFollow_companies() {
      if (follow_companies == null)
         follow_companies = new java.util.HashSet<Users>();
      return follow_companies;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIteratorFollow_companies() {
      if (follow_companies == null)
         follow_companies = new java.util.HashSet<Users>();
      return follow_companies.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newFollow_companies */
   public void setFollow_companies(java.util.Collection<Users> newFollow_companies) {
      removeAllFollow_companies();
      for (java.util.Iterator iter = newFollow_companies.iterator(); iter.hasNext();)
         addFollow_companies((Users)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newUsers */
   public void addFollow_companies(Users newUsers) {
      if (newUsers == null)
         return;
      if (this.follow_companies == null)
         this.follow_companies = new java.util.HashSet<Users>();
      if (!this.follow_companies.contains(newUsers))
      {
         this.follow_companies.add(newUsers);
         newUsers.addFollow_companies(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param oldUsers */
   public void removeFollow_companies(Users oldUsers) {
      if (oldUsers == null)
         return;
      if (this.follow_companies != null)
         if (this.follow_companies.contains(oldUsers))
         {
            this.follow_companies.remove(oldUsers);
            oldUsers.removeFollow_companies(this);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllFollow_companies() {
      if (follow_companies != null)
      {
         Users oldUsers;
         for (java.util.Iterator iter = getIteratorFollow_companies(); iter.hasNext();)
         {
            oldUsers = (Users)iter.next();
            iter.remove();
            oldUsers.removeFollow_companies(this);
         }
      }
   }
   /** @pdGenerated default parent getter */
   public OrganizationSizes getOrganizationSizes() {
      return organizationSizes;
   }
   
   /** @pdGenerated default parent setter
     * @param newOrganizationSizes */
   public void setOrganizationSizes(OrganizationSizes newOrganizationSizes) {
      if (this.organizationSizes == null || !this.organizationSizes.equals(newOrganizationSizes))
      {
         if (this.organizationSizes != null)
         {
            OrganizationSizes oldOrganizationSizes = this.organizationSizes;
            this.organizationSizes = null;
            oldOrganizationSizes.removeCompanies(this);
         }
         if (newOrganizationSizes != null)
         {
            this.organizationSizes = newOrganizationSizes;
            this.organizationSizes.addCompanies(this);
         }
      }
   }
   /** @pdGenerated default parent getter */
   public Industries getIndustries() {
      return industries;
   }
   
   /** @pdGenerated default parent setter
     * @param newIndustries */
   public void setIndustries(Industries newIndustries) {
      if (this.industries == null || !this.industries.equals(newIndustries))
      {
         if (this.industries != null)
         {
            Industries oldIndustries = this.industries;
            this.industries = null;
            oldIndustries.removeCompanies(this);
         }
         if (newIndustries != null)
         {
            this.industries = newIndustries;
            this.industries.addCompanies(this);
         }
      }
   }
   /** @pdGenerated default parent getter */
   public Users getUsers() {
      return users;
   }
   
   /** @pdGenerated default parent setter
     * @param newUsers */
   public void setUsers(Users newUsers) {
      if (this.users == null || !this.users.equals(newUsers))
      {
         if (this.users != null)
         {
            Users oldUsers = this.users;
            this.users = null;
            oldUsers.removeCompanies(this);
         }
         if (newUsers != null)
         {
            this.users = newUsers;
            this.users.addCompanies(this);
         }
      }
   }

}