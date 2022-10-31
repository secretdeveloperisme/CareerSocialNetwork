/***********************************************************************
 * Module:  Comments.java
 * Author:  linh2
 * Purpose: Defines the Class Comments
 ***********************************************************************/

import java.util.*;

/** @pdOid c8207b4e-b4dc-4dfe-8cb9-b3b4ad5c9d0f */
public class Comments {
   /** @pdOid ff85f7bd-ee84-4b17-b46f-0273fb72e5b5 */
   public int commentId;
   /** @pdOid 08c6f2dc-199b-4bf9-8751-b4483f1ad2f0 */
   public java.lang.String content;
   /** @pdOid a01edf2d-fcac-4296-8b9e-36b596d655b4 */
   public java.util.Date createdAt;
   
   /** @pdRoleInfo migr=no name=Comments assc=parentComment mult=1..1 */
   public Comments commentsB;
   public java.util.Collection commentLikes;
   /** @pdRoleInfo migr=no name=Users assc=userComment mult=1..1 side=A */
   public Users users;
   /** @pdRoleInfo migr=no name=Jobs assc=jobComment mult=0..1 side=A */
   public Jobs jobs;
   /** @pdRoleInfo migr=no name=Comments assc=parentComment mult=0..1 side=A */
   public Comments commentsA;
   /** @pdRoleInfo migr=no name=Posts assc=postComment mult=0..1 side=A */
   public Posts posts;
   
   
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
            oldUsers.removeComments(this);
         }
         if (newUsers != null)
         {
            this.users = newUsers;
            this.users.addComments(this);
         }
      }
   }
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
            oldJobs.removeComments(this);
         }
         if (newJobs != null)
         {
            this.jobs = newJobs;
            this.jobs.addComments(this);
         }
      }
   }
   /** @pdGenerated default parent getter */
   public Posts getPosts() {
      return posts;
   }
   
   /** @pdGenerated default parent setter
     * @param newPosts */
   public void setPosts(Posts newPosts) {
      if (this.posts == null || !this.posts.equals(newPosts))
      {
         if (this.posts != null)
         {
            Posts oldPosts = this.posts;
            this.posts = null;
            oldPosts.removeComments(this);
         }
         if (newPosts != null)
         {
            this.posts = newPosts;
            this.posts.addComments(this);
         }
      }
   }

}