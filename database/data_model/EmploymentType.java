/***********************************************************************
 * Module:  EmploymentType.java
 * Author:  linh2
 * Purpose: Defines the Class EmploymentType
 ***********************************************************************/

import java.util.*;

/** @pdOid 721ebe4a-3b03-4dce-a81f-38e76ae75861 */
public class EmploymentType {
   /** @pdOid 0ade4e1f-7c5a-4342-8c93-d0c051357b98 */
   public int employmentTypeId;
   /** @pdOid dcfaf9b3-8733-473b-8997-f0d012731d10 */
   public java.lang.String name;
   
   /** @pdRoleInfo migr=no name=Jobs assc=employmentTypeJob coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   public java.util.Collection<Jobs> jobs;
   
   
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
         newJobs.setEmploymentType(this);      
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
            oldJobs.setEmploymentType((EmploymentType)null);
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
            oldJobs.setEmploymentType((EmploymentType)null);
         }
      }
   }

}