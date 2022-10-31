/***********************************************************************
 * Module:  Posts.java
 * Author:  linh2
 * Purpose: Defines the Class Posts
 ***********************************************************************/

import java.util.*;

/** @pdOid 161cf6a8-8472-4c0e-b40f-6994f1690ee6 */
public class Posts {
   /** @pdOid 73e32fbe-9c07-4105-bdfb-fcbe75780fba */
   public int postId;
   /** @pdOid b8ecbabb-cba1-46bc-bcee-87b6c6f99d94 */
   public java.lang.String title;
   /** @pdOid 6cec4626-ca74-4ad1-9809-b1735290fa44 */
   public java.lang.String slug;
   /** @pdOid f021d52e-a5f2-4801-8239-ed52ddfae06a */
   public java.lang.String description;
   /** @pdOid 41073286-c631-495a-ad1d-53239898707e */
   public java.lang.String image;
   /** @pdOid a9676f6b-5ef4-4ec2-b6c8-dddc21b01477 */
   public java.lang.String content;
   /** @pdOid a952519d-0af6-4b38-b3f2-49f96cb831b5 */
   public java.util.Date createdAt;
   /** @pdOid ebcac339-34c1-42d4-99c0-3a27dc3c3aab */
   public java.util.Date updatedAt;
   /** @pdOid 36a7d9c6-00c6-4d46-b9ce-8a6689d41be7 */
   public java.util.Date deletedAt;
   
   /** @pdRoleInfo migr=no name=Comments assc=postComment coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   public java.util.Collection<Comments> comments;
   public java.util.Collection postLikes;
   /** @pdRoleInfo migr=no name=Tags assc=postTag coll=java.util.Collection impl=java.util.HashSet mult=0..* side=A */
   public java.util.Collection<Tags> post_tag;
   /** @pdRoleInfo migr=no name=Users assc=userPosts mult=1..1 side=A */
   public Users users;
   
   
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
         newComments.setPosts(this);      
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
            oldComments.setPosts((Posts)null);
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
            oldComments.setPosts((Posts)null);
         }
      }
   }
   /** @pdGenerated default getter */
   public java.util.Collection<Tags> getPost_tag() {
      if (post_tag == null)
         post_tag = new java.util.HashSet<Tags>();
      return post_tag;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIteratorPost_tag() {
      if (post_tag == null)
         post_tag = new java.util.HashSet<Tags>();
      return post_tag.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newPost_tag */
   public void setPost_tag(java.util.Collection<Tags> newPost_tag) {
      removeAllPost_tag();
      for (java.util.Iterator iter = newPost_tag.iterator(); iter.hasNext();)
         addPost_tag((Tags)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newTags */
   public void addPost_tag(Tags newTags) {
      if (newTags == null)
         return;
      if (this.post_tag == null)
         this.post_tag = new java.util.HashSet<Tags>();
      if (!this.post_tag.contains(newTags))
      {
         this.post_tag.add(newTags);
         newTags.addPost_tag(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param oldTags */
   public void removePost_tag(Tags oldTags) {
      if (oldTags == null)
         return;
      if (this.post_tag != null)
         if (this.post_tag.contains(oldTags))
         {
            this.post_tag.remove(oldTags);
            oldTags.removePost_tag(this);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllPost_tag() {
      if (post_tag != null)
      {
         Tags oldTags;
         for (java.util.Iterator iter = getIteratorPost_tag(); iter.hasNext();)
         {
            oldTags = (Tags)iter.next();
            iter.remove();
            oldTags.removePost_tag(this);
         }
      }
   }
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
            oldUsers.removePosts(this);
         }
         if (newUsers != null)
         {
            this.users = newUsers;
            this.users.addPosts(this);
         }
      }
   }

}