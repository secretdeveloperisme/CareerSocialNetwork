/***********************************************************************
 * Module:  OrganizationSizes.java
 * Author:  linh2
 * Purpose: Defines the Class OrganizationSizes
 ***********************************************************************/

import java.util.*;

/** @pdOid 6a7d3a5c-2ff4-46ed-a126-8dd5427dd90a */
public class OrganizationSizes {
   /** @pdOid eee5e757-2225-45da-b9d6-bc1735af7784 */
   public int organizationSizeId;
   /** @pdOid c558cd03-7873-4c00-8aaa-3fbc485d1448 */
   public java.lang.String name;
   
   /** @pdRoleInfo migr=no name=Companies assc=orgSizeCompanies coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   public java.util.Collection<Companies> companies;
   
   
   /** @pdGenerated default getter */
   public java.util.Collection<Companies> getCompanies() {
      if (companies == null)
         companies = new java.util.HashSet<Companies>();
      return companies;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIteratorCompanies() {
      if (companies == null)
         companies = new java.util.HashSet<Companies>();
      return companies.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newCompanies */
   public void setCompanies(java.util.Collection<Companies> newCompanies) {
      removeAllCompanies();
      for (java.util.Iterator iter = newCompanies.iterator(); iter.hasNext();)
         addCompanies((Companies)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newCompanies */
   public void addCompanies(Companies newCompanies) {
      if (newCompanies == null)
         return;
      if (this.companies == null)
         this.companies = new java.util.HashSet<Companies>();
      if (!this.companies.contains(newCompanies))
      {
         this.companies.add(newCompanies);
         newCompanies.setOrganizationSizes(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param oldCompanies */
   public void removeCompanies(Companies oldCompanies) {
      if (oldCompanies == null)
         return;
      if (this.companies != null)
         if (this.companies.contains(oldCompanies))
         {
            this.companies.remove(oldCompanies);
            oldCompanies.setOrganizationSizes((OrganizationSizes)null);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllCompanies() {
      if (companies != null)
      {
         Companies oldCompanies;
         for (java.util.Iterator iter = getIteratorCompanies(); iter.hasNext();)
         {
            oldCompanies = (Companies)iter.next();
            iter.remove();
            oldCompanies.setOrganizationSizes((OrganizationSizes)null);
         }
      }
   }

}