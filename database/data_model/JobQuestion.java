/***********************************************************************
 * Module:  JobQuestion.java
 * Author:  linh2
 * Purpose: Defines the Class JobQuestion
 ***********************************************************************/

import java.util.*;

/** @pdOid 8002040e-5cc9-47c3-8934-1bb61f3e1e98 */
public class JobQuestion {
   /** @pdOid e755b85d-a3a6-4fde-a1a0-de0c00af38ca */
   public int jobQueId;
   
   public java.util.Collection answers;
   /** @pdRoleInfo migr=no name=Jobs assc=jobQuestion mult=1..1 side=A */
   public Jobs jobs;
   /** @pdRoleInfo migr=no name=Questions assc=questionJobs mult=1..1 side=A */
   public Questions questions;
   
   
   /** @pdGenerated default parent getter */
   public Jobs getJobs() {
      return jobs;
   }
   
   /** @pdGenerated default parent setter
     * @param newJobs */
   public void setJobs(Jobs newJobs) {
      if (this.jobs == null || !this.jobs.equals(newJobs))
      {
         if (this.jobs != null)
         {
            Jobs oldJobs = this.jobs;
            this.jobs = null;
            oldJobs.removeJobQuestion(this);
         }
         if (newJobs != null)
         {
            this.jobs = newJobs;
            this.jobs.addJobQuestion(this);
         }
      }
   }
   /** @pdGenerated default parent getter */
   public Questions getQuestions() {
      return questions;
   }
   
   /** @pdGenerated default parent setter
     * @param newQuestions */
   public void setQuestions(Questions newQuestions) {
      if (this.questions == null || !this.questions.equals(newQuestions))
      {
         if (this.questions != null)
         {
            Questions oldQuestions = this.questions;
            this.questions = null;
            oldQuestions.removeJobQuestion(this);
         }
         if (newQuestions != null)
         {
            this.questions = newQuestions;
            this.questions.addJobQuestion(this);
         }
      }
   }

}