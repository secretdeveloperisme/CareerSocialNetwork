/***********************************************************************
 * Module:  Skills.java
 * Author:  linh2
 * Purpose: Defines the Class Skills
 ***********************************************************************/

import java.util.*;

/** @pdOid e88706d2-1c71-4028-b93b-40ca52b54a84 */
public class Skills {
   /** @pdOid 429717af-7e22-4b82-9604-89ebf3cfe7fb */
   public int skillId;
   /** @pdOid 90915d48-c66f-4ab9-8424-7855c42d81fe */
   public java.lang.String name;
   
   /** @pdRoleInfo migr=no name=Jobs assc=jobSkills coll=java.util.Collection impl=java.util.HashSet mult=1..* */
   public java.util.Collection<Jobs> job_skills;
   /** @pdRoleInfo migr=no name=Users assc=userSkills coll=java.util.Collection impl=java.util.HashSet mult=1..* side=A */
   public java.util.Collection<Users> user_skills;
   
   
   /** @pdGenerated default getter */
   public java.util.Collection<Jobs> getJob_skills() {
      if (job_skills == null)
         job_skills = new java.util.HashSet<Jobs>();
      return job_skills;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIteratorJob_skills() {
      if (job_skills == null)
         job_skills = new java.util.HashSet<Jobs>();
      return job_skills.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newJob_skills */
   public void setJob_skills(java.util.Collection<Jobs> newJob_skills) {
      removeAllJob_skills();
      for (java.util.Iterator iter = newJob_skills.iterator(); iter.hasNext();)
         addJob_skills((Jobs)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newJobs */
   public void addJob_skills(Jobs newJobs) {
      if (newJobs == null)
         return;
      if (this.job_skills == null)
         this.job_skills = new java.util.HashSet<Jobs>();
      if (!this.job_skills.contains(newJobs))
      {
         this.job_skills.add(newJobs);
         newJobs.addJob_skills(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param oldJobs */
   public void removeJob_skills(Jobs oldJobs) {
      if (oldJobs == null)
         return;
      if (this.job_skills != null)
         if (this.job_skills.contains(oldJobs))
         {
            this.job_skills.remove(oldJobs);
            oldJobs.removeJob_skills(this);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllJob_skills() {
      if (job_skills != null)
      {
         Jobs oldJobs;
         for (java.util.Iterator iter = getIteratorJob_skills(); iter.hasNext();)
         {
            oldJobs = (Jobs)iter.next();
            iter.remove();
            oldJobs.removeJob_skills(this);
         }
      }
   }
   /** @pdGenerated default getter */
   public java.util.Collection<Users> getUser_skills() {
      if (user_skills == null)
         user_skills = new java.util.HashSet<Users>();
      return user_skills;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIteratorUser_skills() {
      if (user_skills == null)
         user_skills = new java.util.HashSet<Users>();
      return user_skills.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newUser_skills */
   public void setUser_skills(java.util.Collection<Users> newUser_skills) {
      removeAllUser_skills();
      for (java.util.Iterator iter = newUser_skills.iterator(); iter.hasNext();)
         addUser_skills((Users)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newUsers */
   public void addUser_skills(Users newUsers) {
      if (newUsers == null)
         return;
      if (this.user_skills == null)
         this.user_skills = new java.util.HashSet<Users>();
      if (!this.user_skills.contains(newUsers))
      {
         this.user_skills.add(newUsers);
         newUsers.addUser_skills(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param oldUsers */
   public void removeUser_skills(Users oldUsers) {
      if (oldUsers == null)
         return;
      if (this.user_skills != null)
         if (this.user_skills.contains(oldUsers))
         {
            this.user_skills.remove(oldUsers);
            oldUsers.removeUser_skills(this);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllUser_skills() {
      if (user_skills != null)
      {
         Users oldUsers;
         for (java.util.Iterator iter = getIteratorUser_skills(); iter.hasNext();)
         {
            oldUsers = (Users)iter.next();
            iter.remove();
            oldUsers.removeUser_skills(this);
         }
      }
   }

}