/***********************************************************************
 * Module:  Tags.java
 * Author:  linh2
 * Purpose: Defines the Class Tags
 ***********************************************************************/

import java.util.*;

/** @pdOid 7506ba67-da3f-417d-ac73-47a3d2b5cbd3 */
public class Tags {
   /** @pdOid 74cd3d23-ea21-44b9-b2df-bac9a8f52cfd */
   public int tagId;
   /** @pdOid 47135841-9bbf-4350-ba59-eb92e72ed8b7 */
   public java.lang.String name;
   
   /** @pdRoleInfo migr=no name=Posts assc=postTag coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   public java.util.Collection<Posts> post_tag;
   /** @pdRoleInfo migr=no name=Jobs assc=jobTags coll=java.util.Collection impl=java.util.HashSet mult=1..* side=A */
   public java.util.Collection<Jobs> job_tags;
   /** @pdRoleInfo migr=no name=Users assc=followTags coll=java.util.Collection impl=java.util.HashSet mult=0..* side=A */
   public java.util.Collection<Users> follow_tags;
   
   
   /** @pdGenerated default getter */
   public java.util.Collection<Posts> getPost_tag() {
      if (post_tag == null)
         post_tag = new java.util.HashSet<Posts>();
      return post_tag;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIteratorPost_tag() {
      if (post_tag == null)
         post_tag = new java.util.HashSet<Posts>();
      return post_tag.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newPost_tag */
   public void setPost_tag(java.util.Collection<Posts> newPost_tag) {
      removeAllPost_tag();
      for (java.util.Iterator iter = newPost_tag.iterator(); iter.hasNext();)
         addPost_tag((Posts)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newPosts */
   public void addPost_tag(Posts newPosts) {
      if (newPosts == null)
         return;
      if (this.post_tag == null)
         this.post_tag = new java.util.HashSet<Posts>();
      if (!this.post_tag.contains(newPosts))
      {
         this.post_tag.add(newPosts);
         newPosts.addPost_tag(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param oldPosts */
   public void removePost_tag(Posts oldPosts) {
      if (oldPosts == null)
         return;
      if (this.post_tag != null)
         if (this.post_tag.contains(oldPosts))
         {
            this.post_tag.remove(oldPosts);
            oldPosts.removePost_tag(this);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllPost_tag() {
      if (post_tag != null)
      {
         Posts oldPosts;
         for (java.util.Iterator iter = getIteratorPost_tag(); iter.hasNext();)
         {
            oldPosts = (Posts)iter.next();
            iter.remove();
            oldPosts.removePost_tag(this);
         }
      }
   }
   /** @pdGenerated default getter */
   public java.util.Collection<Jobs> getJob_tags() {
      if (job_tags == null)
         job_tags = new java.util.HashSet<Jobs>();
      return job_tags;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIteratorJob_tags() {
      if (job_tags == null)
         job_tags = new java.util.HashSet<Jobs>();
      return job_tags.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newJob_tags */
   public void setJob_tags(java.util.Collection<Jobs> newJob_tags) {
      removeAllJob_tags();
      for (java.util.Iterator iter = newJob_tags.iterator(); iter.hasNext();)
         addJob_tags((Jobs)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newJobs */
   public void addJob_tags(Jobs newJobs) {
      if (newJobs == null)
         return;
      if (this.job_tags == null)
         this.job_tags = new java.util.HashSet<Jobs>();
      if (!this.job_tags.contains(newJobs))
      {
         this.job_tags.add(newJobs);
         newJobs.addJob_tags(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param oldJobs */
   public void removeJob_tags(Jobs oldJobs) {
      if (oldJobs == null)
         return;
      if (this.job_tags != null)
         if (this.job_tags.contains(oldJobs))
         {
            this.job_tags.remove(oldJobs);
            oldJobs.removeJob_tags(this);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllJob_tags() {
      if (job_tags != null)
      {
         Jobs oldJobs;
         for (java.util.Iterator iter = getIteratorJob_tags(); iter.hasNext();)
         {
            oldJobs = (Jobs)iter.next();
            iter.remove();
            oldJobs.removeJob_tags(this);
         }
      }
   }
   /** @pdGenerated default getter */
   public java.util.Collection<Users> getFollow_tags() {
      if (follow_tags == null)
         follow_tags = new java.util.HashSet<Users>();
      return follow_tags;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIteratorFollow_tags() {
      if (follow_tags == null)
         follow_tags = new java.util.HashSet<Users>();
      return follow_tags.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newFollow_tags */
   public void setFollow_tags(java.util.Collection<Users> newFollow_tags) {
      removeAllFollow_tags();
      for (java.util.Iterator iter = newFollow_tags.iterator(); iter.hasNext();)
         addFollow_tags((Users)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newUsers */
   public void addFollow_tags(Users newUsers) {
      if (newUsers == null)
         return;
      if (this.follow_tags == null)
         this.follow_tags = new java.util.HashSet<Users>();
      if (!this.follow_tags.contains(newUsers))
      {
         this.follow_tags.add(newUsers);
         newUsers.addFollow_tags(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param oldUsers */
   public void removeFollow_tags(Users oldUsers) {
      if (oldUsers == null)
         return;
      if (this.follow_tags != null)
         if (this.follow_tags.contains(oldUsers))
         {
            this.follow_tags.remove(oldUsers);
            oldUsers.removeFollow_tags(this);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllFollow_tags() {
      if (follow_tags != null)
      {
         Users oldUsers;
         for (java.util.Iterator iter = getIteratorFollow_tags(); iter.hasNext();)
         {
            oldUsers = (Users)iter.next();
            iter.remove();
            oldUsers.removeFollow_tags(this);
         }
      }
   }

}