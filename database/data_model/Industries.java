/***********************************************************************
 * Module:  Industries.java
 * Author:  linh2
 * Purpose: Defines the Class Industries
 ***********************************************************************/

import java.util.*;

/** @pdOid 60cd4ebe-7922-4203-86f0-eb3011368115 */
public class Industries {
   /** @pdOid 50101b69-fe0a-4dd3-ad67-10160dcb29bc */
   public int industryId;
   /** @pdOid e7fbc4da-3fb3-497b-9cb1-b62bd60d0bbf */
   public java.lang.String name;
   
   /** @pdRoleInfo migr=no name=Companies assc=industryCompanies coll=java.util.Collection impl=java.util.HashSet mult=0..* */
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
         newCompanies.setIndustries(this);      
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
            oldCompanies.setIndustries((Industries)null);
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
            oldCompanies.setIndustries((Industries)null);
         }
      }
   }

}