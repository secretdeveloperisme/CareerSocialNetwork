/***********************************************************************
 * Module:  Jobs.java
 * Author:  linh2
 * Purpose: Defines the Class Jobs
 ***********************************************************************/

import java.util.*;

/** @pdOid 3e12a102-d5b2-4f09-89f5-1f8a131cb632 */
public class Jobs {
   /** @pdOid cc3b3931-4dbf-46db-9853-b5954a1a76f0 */
   public int jobId;
   /** @pdOid 1f1d1815-5c7d-4b55-a4a9-8b42091c68bf */
   public java.lang.String title;
   /** @pdOid 863528aa-4d34-4165-8d78-90f0e583a08a */
   public java.lang.String description;
   /** @pdOid 72d062b6-9339-4f5b-a436-3098a269c8c9 */
   public java.lang.String image;
   /** @pdOid 9d47bab0-6047-4f41-9c89-d59e822cb782 */
   public java.lang.String location;
   /** @pdOid faa4c550-498a-4551-bb62-611293c1c42b */
   public int amount;
   /** @pdOid 90665c24-7527-42a7-9592-0a0f961879b4 */
   public java.util.Date startDate;
   /** @pdOid fe337717-cc9b-4190-8b1a-49676ec36de9 */
   public java.util.Date endDate;
   /** @pdOid 81582f73-f83d-4b1f-b036-f8006a1a22bf */
   public int salaryMin;
   /** @pdOid f2190ce8-e359-4cf6-a38d-3ae5b6c01b37 */
   public int salaryMax;
   /** @pdOid c4fd799e-b40c-4c4e-a692-e38ea3fa32eb */
   public java.util.Date createdAt;
   /** @pdOid 505af828-12a4-4c10-9bd3-5b09b2c6a4ff */
   public java.util.Date updatedAt;
   /** @pdOid efb55c05-9090-4f06-8c55-35d4177418bb */
   public java.util.Date deletedAt;
   /** @pdOid 6b776301-e9dd-4274-a3d6-0fa1cc42a8df */
   public int experience;
   
   /** @pdRoleInfo migr=no name=Tags assc=jobTags coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   public java.util.Collection<Tags> job_tags;
   /** @pdRoleInfo migr=no name=Comments assc=jobComment coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   public java.util.Collection<Comments> comments;
   /** @pdRoleInfo migr=no name=JobQuestion assc=jobQuestion coll=java.util.Collection impl=java.util.HashSet mult=1..* */
   public java.util.Collection<JobQuestion> jobQuestion;
   public java.util.Collection applications;
   public java.util.Collection likes;
   /** @pdRoleInfo migr=no name=Skills assc=jobSkills coll=java.util.Collection impl=java.util.HashSet mult=1..* side=A */
   public java.util.Collection<Skills> job_skills;
   /** @pdRoleInfo migr=no name=Users assc=bookmarks coll=java.util.Collection impl=java.util.HashSet mult=0..* side=A */
   public java.util.Collection<Users> bookmarks;
   /** @pdRoleInfo migr=no name=EmploymentType assc=employmentTypeJob mult=1..1 side=A */
   public EmploymentType employmentType;
   /** @pdRoleInfo migr=no name=Companies assc=compnayJobs mult=1..1 side=A */
   public Companies companies;
   /** @pdRoleInfo migr=no name=Positions assc=jobPosition mult=1..1 side=A */
   public Positions positions;
   /** @pdRoleInfo migr=no name=WorkPlaces assc=jobWorkPlace mult=1..1 side=A */
   public WorkPlaces workPlaces;
   
   
   /** @pdGenerated default getter */
   public java.util.Collection<Tags> getJob_tags() {
      if (job_tags == null)
         job_tags = new java.util.HashSet<Tags>();
      return job_tags;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIteratorJob_tags() {
      if (job_tags == null)
         job_tags = new java.util.HashSet<Tags>();
      return job_tags.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newJob_tags */
   public void setJob_tags(java.util.Collection<Tags> newJob_tags) {
      removeAllJob_tags();
      for (java.util.Iterator iter = newJob_tags.iterator(); iter.hasNext();)
         addJob_tags((Tags)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newTags */
   public void addJob_tags(Tags newTags) {
      if (newTags == null)
         return;
      if (this.job_tags == null)
         this.job_tags = new java.util.HashSet<Tags>();
      if (!this.job_tags.contains(newTags))
      {
         this.job_tags.add(newTags);
         newTags.addJob_tags(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param oldTags */
   public void removeJob_tags(Tags oldTags) {
      if (oldTags == null)
         return;
      if (this.job_tags != null)
         if (this.job_tags.contains(oldTags))
         {
            this.job_tags.remove(oldTags);
            oldTags.removeJob_tags(this);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllJob_tags() {
      if (job_tags != null)
      {
         Tags oldTags;
         for (java.util.Iterator iter = getIteratorJob_tags(); iter.hasNext();)
         {
            oldTags = (Tags)iter.next();
            iter.remove();
            oldTags.removeJob_tags(this);
         }
      }
   }
   /** @pdGenerated default getter */
   public java.util.Collection<Comments> getComments() {
      if (comments == null)
         comments = new java.util.HashSet<Comments>();
      return comments;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIteratorComments() {
      if (comments == null)
         comments = new java.util.HashSet<Comments>();
      return comments.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newComments */
   public void setComments(java.util.Collection<Comments> newComments) {
      removeAllComments();
      for (java.util.Iterator iter = newComments.iterator(); iter.hasNext();)
         addComments((Comments)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newComments */
   public void addComments(Comments newComments) {
      if (newComments == null)
         return;
      if (this.comments == null)
         this.comments = new java.util.HashSet<Comments>();
      if (!this.comments.contains(newComments))
      {
         this.comments.add(newComments);
         newComments.setJobs(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param oldComments */
   public void removeComments(Comments oldComments) {
      if (oldComments == null)
         return;
      if (this.comments != null)
         if (this.comments.contains(oldComments))
         {
            this.comments.remove(oldComments);
            oldComments.setJobs((Jobs)null);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllComments() {
      if (comments != null)
      {
         Comments oldComments;
         for (java.util.Iterator iter = getIteratorComments(); iter.hasNext();)
         {
            oldComments = (Comments)iter.next();
            iter.remove();
            oldComments.setJobs((Jobs)null);
         }
      }
   }
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
         newJobQuestion.setJobs(this);      
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
            oldJobQuestion.setJobs((Jobs)null);
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
            oldJobQuestion.setJobs((Jobs)null);
         }
      }
   }
   /** @pdGenerated default getter */
   public java.util.Collection<Skills> getJob_skills() {
      if (job_skills == null)
         job_skills = new java.util.HashSet<Skills>();
      return job_skills;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIteratorJob_skills() {
      if (job_skills == null)
         job_skills = new java.util.HashSet<Skills>();
      return job_skills.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newJob_skills */
   public void setJob_skills(java.util.Collection<Skills> newJob_skills) {
      removeAllJob_skills();
      for (java.util.Iterator iter = newJob_skills.iterator(); iter.hasNext();)
         addJob_skills((Skills)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newSkills */
   public void addJob_skills(Skills newSkills) {
      if (newSkills == null)
         return;
      if (this.job_skills == null)
         this.job_skills = new java.util.HashSet<Skills>();
      if (!this.job_skills.contains(newSkills))
      {
         this.job_skills.add(newSkills);
         newSkills.addJob_skills(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param oldSkills */
   public void removeJob_skills(Skills oldSkills) {
      if (oldSkills == null)
         return;
      if (this.job_skills != null)
         if (this.job_skills.contains(oldSkills))
         {
            this.job_skills.remove(oldSkills);
            oldSkills.removeJob_skills(this);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllJob_skills() {
      if (job_skills != null)
      {
         Skills oldSkills;
         for (java.util.Iterator iter = getIteratorJob_skills(); iter.hasNext();)
         {
            oldSkills = (Skills)iter.next();
            iter.remove();
            oldSkills.removeJob_skills(this);
         }
      }
   }
   /** @pdGenerated default getter */
   public java.util.Collection<Users> getBookmarks() {
      if (bookmarks == null)
         bookmarks = new java.util.HashSet<Users>();
      return bookmarks;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIteratorBookmarks() {
      if (bookmarks == null)
         bookmarks = new java.util.HashSet<Users>();
      return bookmarks.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newBookmarks */
   public void setBookmarks(java.util.Collection<Users> newBookmarks) {
      removeAllBookmarks();
      for (java.util.Iterator iter = newBookmarks.iterator(); iter.hasNext();)
         addBookmarks((Users)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newUsers */
   public void addBookmarks(Users newUsers) {
      if (newUsers == null)
         return;
      if (this.bookmarks == null)
         this.bookmarks = new java.util.HashSet<Users>();
      if (!this.bookmarks.contains(newUsers))
      {
         this.bookmarks.add(newUsers);
         newUsers.addBookmarks(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param oldUsers */
   public void removeBookmarks(Users oldUsers) {
      if (oldUsers == null)
         return;
      if (this.bookmarks != null)
         if (this.bookmarks.contains(oldUsers))
         {
            this.bookmarks.remove(oldUsers);
            oldUsers.removeBookmarks(this);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllBookmarks() {
      if (bookmarks != null)
      {
         Users oldUsers;
         for (java.util.Iterator iter = getIteratorBookmarks(); iter.hasNext();)
         {
            oldUsers = (Users)iter.next();
            iter.remove();
            oldUsers.removeBookmarks(this);
         }
      }
   }
   /** @pdGenerated default parent getter */
   public EmploymentType getEmploymentType() {
      return employmentType;
   }
   
   /** @pdGenerated default parent setter
     * @param newEmploymentType */
   public void setEmploymentType(EmploymentType newEmploymentType) {
      if (this.employmentType == null || !this.employmentType.equals(newEmploymentType))
      {
         if (this.employmentType != null)
         {
            EmploymentType oldEmploymentType = this.employmentType;
            this.employmentType = null;
            oldEmploymentType.removeJobs(this);
         }
         if (newEmploymentType != null)
         {
            this.employmentType = newEmploymentType;
            this.employmentType.addJobs(this);
         }
      }
   }
   /** @pdGenerated default parent getter */
   public Companies getCompanies() {
      return companies;
   }
   
   /** @pdGenerated default parent setter
     * @param newCompanies */
   public void setCompanies(Companies newCompanies) {
      if (this.companies == null || !this.companies.equals(newCompanies))
      {
         if (this.companies != null)
         {
            Companies oldCompanies = this.companies;
            this.companies = null;
            oldCompanies.removeJobs(this);
         }
         if (newCompanies != null)
         {
            this.companies = newCompanies;
            this.companies.addJobs(this);
         }
      }
   }
   /** @pdGenerated default parent getter */
   public WorkPlaces getWorkPlaces() {
      return workPlaces;
   }
   
   /** @pdGenerated default parent setter
     * @param newWorkPlaces */
   public void setWorkPlaces(WorkPlaces newWorkPlaces) {
      if (this.workPlaces == null || !this.workPlaces.equals(newWorkPlaces))
      {
         if (this.workPlaces != null)
         {
            WorkPlaces oldWorkPlaces = this.workPlaces;
            this.workPlaces = null;
            oldWorkPlaces.removeJobs(this);
         }
         if (newWorkPlaces != null)
         {
            this.workPlaces = newWorkPlaces;
            this.workPlaces.addJobs(this);
         }
      }
   }

}