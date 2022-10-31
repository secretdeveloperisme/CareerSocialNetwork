/***********************************************************************
 * Module:  WorkPlaces.java
 * Author:  linh2
 * Purpose: Defines the Class WorkPlaces
 ***********************************************************************/

import java.util.*;

/** @pdOid c570e7aa-f180-4456-b906-7fc3ea3f8154 */
public class WorkPlaces {
   /** @pdOid 7c839add-09a7-47d1-abc2-8e9ee11f9155 */
   public int workPlace;
   /** @pdOid 1aaebf0c-5a89-4b53-922d-5cab91e910ab */
   public java.lang.String place;
   
   /** @pdRoleInfo migr=no name=Jobs assc=jobWorkPlace coll=java.util.Collection impl=java.util.HashSet mult=0..* */
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
         newJobs.setWorkPlaces(this);      
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
            oldJobs.setWorkPlaces((WorkPlaces)null);
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
            oldJobs.setWorkPlaces((WorkPlaces)null);
         }
      }
   }

}