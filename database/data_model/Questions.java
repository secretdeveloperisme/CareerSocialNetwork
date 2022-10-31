/***********************************************************************
 * Module:  Questions.java
 * Author:  linh2
 * Purpose: Defines the Class Questions
 ***********************************************************************/

import java.util.*;

/** @pdOid e396c907-5c86-48cb-84d2-57266a05e8c7 */
public class Questions {
   /** @pdOid c82483b5-70e2-4989-a3a1-17f9863b29bb */
   public int questionId;
   /** @pdOid 92564bde-7277-42c1-9565-089f9aab2144 */
   public java.lang.String content;
   
   /** @pdRoleInfo migr=no name=JobQuestion assc=questionJobs coll=java.util.Collection impl=java.util.HashSet mult=1..* */
   public java.util.Collection<JobQuestion> jobQuestion;
   
   
   /** @pdGenerated default getter */
   public java.util.Collection<JobQuestion> getJobQuestion() {
      if (jobQuestion == null)
         jobQuestion = new java.util.HashSet<JobQuestion>();
      return jobQuestion;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIteratorJobQuestion() {
      if (jobQuestion == null)
         jobQuestion = new java.util.HashSet<JobQuestion>();
      return jobQuestion.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newJobQuestion */
   public void setJobQuestion(java.util.Collection<JobQuestion> newJobQuestion) {
      removeAllJobQuestion();
      for (java.util.Iterator iter = newJobQuestion.iterator(); iter.hasNext();)
         addJobQuestion((JobQuestion)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newJobQuestion */
   public void addJobQuestion(JobQuestion newJobQuestion) {
      if (newJobQuestion == null)
         return;
      if (this.jobQuestion == null)
         this.jobQuestion = new java.util.HashSet<JobQuestion>();
      if (!this.jobQuestion.contains(newJobQuestion))
      {
         this.jobQuestion.add(newJobQuestion);
         newJobQuestion.setQuestions(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param oldJobQuestion */
   public void removeJobQuestion(JobQuestion oldJobQuestion) {
      if (oldJobQuestion == null)
         return;
      if (this.jobQuestion != null)
         if (this.jobQuestion.contains(oldJobQuestion))
         {
            this.jobQuestion.remove(oldJobQuestion);
            oldJobQuestion.setQuestions((Questions)null);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllJobQuestion() {
      if (jobQuestion != null)
      {
         JobQuestion oldJobQuestion;
         for (java.util.Iterator iter = getIteratorJobQuestion(); iter.hasNext();)
         {
            oldJobQuestion = (JobQuestion)iter.next();
            iter.remove();
            oldJobQuestion.setQuestions((Questions)null);
         }
      }
   }

}