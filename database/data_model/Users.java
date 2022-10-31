/***********************************************************************
 * Module:  Users.java
 * Author:  linh2
 * Purpose: Defines the Class Users
 ***********************************************************************/

import java.util.*;

/** @pdOid 8bfec769-821f-4b3c-bc8b-f9acf254463c */
public class Users {
   /** @pdOid 4b9cb11a-ac75-4299-aa50-8614a8345a9e */
   public int userId;
   /** @pdOid d91e1342-e89b-4804-9927-c64a903cfac3 */
   public java.lang.String username;
   /** @pdOid 4e7835ed-7270-4400-8020-2dd1216bcda7 */
   public java.lang.String fullname;
   /** @pdOid 8ad101e7-1ea9-4f5f-969e-3d862d6e8d39 */
   public java.lang.String passwordHash;
   /** @pdOid dc060d24-a2c0-4afe-b0a4-efef6fa8dbbd */
   public java.lang.String email;
   /** @pdOid 640620e9-f45c-4d7f-92b2-9106636fddbf */
   public java.lang.String gender;
   /** @pdOid 6bd6e2a9-0642-482d-a236-39e4e3be19ba */
   public java.lang.String biography;
   /** @pdOid 21fadcfa-4b3d-4a9c-b02b-9944da42ddc7 */
   public java.lang.String avatar;
   /** @pdOid c576ef56-a8a2-4157-80bb-795b529b0092 */
   public java.lang.String address;
   /** @pdOid 2ee11ace-e1ab-4343-b153-521e0792457b */
   public java.lang.String cvUrl;
   /** @pdOid a6cde5cd-7e4d-47ff-be79-96797507dcbd */
   public java.util.Date dob;
   /** @pdOid 7384b24b-75f3-42d3-bf46-c64290b09151 */
   public java.lang.String externalLoginType;
   /** @pdOid 14a7565b-ce16-417e-a821-f6252584234e */
   public boolean isEnabled;
   /** @pdOid 8650c5c0-f380-435a-bd0c-44132b4906b1 */
   public java.lang.String externalLoginId;
   /** @pdOid 19aedf9a-380f-417e-9411-3fa48a893195 */
   public java.util.Date createdAt;
   /** @pdOid 683e4584-f584-44ec-9d02-cb81d64f1804 */
   public java.util.Date updatedAt;
   /** @pdOid a8d58cf6-6e15-45c2-bc8b-401ea13f687a */
   public java.util.Date deletedAt;
   
   public java.util.Collection commentLikes;
   public java.util.Collection applications;
   public java.util.Collection userCompanyRoles;
   public java.util.Collection postLikes;
   public java.util.Collection likes;
   /** @pdRoleInfo migr=no name=Companies assc=followCompanies coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   public java.util.Collection<Companies> follow_companies;
   /** @pdRoleInfo migr=no name=Skills assc=userSkills coll=java.util.Collection impl=java.util.HashSet mult=1..* */
   public java.util.Collection<Skills> user_skills;
   /** @pdRoleInfo migr=no name=UserNotifications assc=userNotificationsRelationship coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   public java.util.Collection<UserNotifications> user_notifications_relationship;
   /** @pdRoleInfo migr=no name=Tags assc=followTags coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   public java.util.Collection<Tags> follow_tags;
   /** @pdRoleInfo migr=no name=Jobs assc=bookmarks coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   public java.util.Collection<Jobs> bookmarks;
   /** @pdRoleInfo migr=no name=Comments assc=userComment coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   public java.util.Collection<Comments> comments;
   /** @pdRoleInfo migr=no name=Companies assc=userCreateCompanies coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   public java.util.Collection<Companies> companies;
   /** @pdRoleInfo migr=no name=Conversations assc=userCreateConsversations coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   public java.util.Collection<Conversations> conversations;
   /** @pdRoleInfo migr=no name=Messages assc=userCreateMessage coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   public java.util.Collection<Messages> messages;
   /** @pdRoleInfo migr=no name=Educations assc=userEducation coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   public java.util.Collection<Educations> educations;
   /** @pdRoleInfo migr=no name=Posts assc=userPosts coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   public java.util.Collection<Posts> posts;
   /** @pdRoleInfo migr=no name=Users assc=followUsers coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   public java.util.Collection<Users> follow_users2;
   public java.util.Collection answers;
   /** @pdRoleInfo migr=no name=Roles assc=userRoles coll=java.util.Collection impl=java.util.HashSet mult=1..* side=A */
   public java.util.Collection<Roles> user_roles;
   /** @pdRoleInfo migr=no name=Conversations assc=participants coll=java.util.Collection impl=java.util.HashSet mult=0..* side=A */
   public java.util.Collection<Conversations> participants;
   /** @pdRoleInfo migr=no name=Users assc=followUsers coll=java.util.Collection impl=java.util.HashSet mult=0..* side=A */
   public java.util.Collection<Users> follow_users;
   
   
   /** @pdGenerated default getter */
   public java.util.Collection<Companies> getFollow_companies() {
      if (follow_companies == null)
         follow_companies = new java.util.HashSet<Companies>();
      return follow_companies;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIteratorFollow_companies() {
      if (follow_companies == null)
         follow_companies = new java.util.HashSet<Companies>();
      return follow_companies.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newFollow_companies */
   public void setFollow_companies(java.util.Collection<Companies> newFollow_companies) {
      removeAllFollow_companies();
      for (java.util.Iterator iter = newFollow_companies.iterator(); iter.hasNext();)
         addFollow_companies((Companies)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newCompanies */
   public void addFollow_companies(Companies newCompanies) {
      if (newCompanies == null)
         return;
      if (this.follow_companies == null)
         this.follow_companies = new java.util.HashSet<Companies>();
      if (!this.follow_companies.contains(newCompanies))
      {
         this.follow_companies.add(newCompanies);
         newCompanies.addFollow_companies(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param oldCompanies */
   public void removeFollow_companies(Companies oldCompanies) {
      if (oldCompanies == null)
         return;
      if (this.follow_companies != null)
         if (this.follow_companies.contains(oldCompanies))
         {
            this.follow_companies.remove(oldCompanies);
            oldCompanies.removeFollow_companies(this);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllFollow_companies() {
      if (follow_companies != null)
      {
         Companies oldCompanies;
         for (java.util.Iterator iter = getIteratorFollow_companies(); iter.hasNext();)
         {
            oldCompanies = (Companies)iter.next();
            iter.remove();
            oldCompanies.removeFollow_companies(this);
         }
      }
   }
   /** @pdGenerated default getter */
   public java.util.Collection<Skills> getUser_skills() {
      if (user_skills == null)
         user_skills = new java.util.HashSet<Skills>();
      return user_skills;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIteratorUser_skills() {
      if (user_skills == null)
         user_skills = new java.util.HashSet<Skills>();
      return user_skills.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newUser_skills */
   public void setUser_skills(java.util.Collection<Skills> newUser_skills) {
      removeAllUser_skills();
      for (java.util.Iterator iter = newUser_skills.iterator(); iter.hasNext();)
         addUser_skills((Skills)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newSkills */
   public void addUser_skills(Skills newSkills) {
      if (newSkills == null)
         return;
      if (this.user_skills == null)
         this.user_skills = new java.util.HashSet<Skills>();
      if (!this.user_skills.contains(newSkills))
      {
         this.user_skills.add(newSkills);
         newSkills.addUser_skills(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param oldSkills */
   public void removeUser_skills(Skills oldSkills) {
      if (oldSkills == null)
         return;
      if (this.user_skills != null)
         if (this.user_skills.contains(oldSkills))
         {
            this.user_skills.remove(oldSkills);
            oldSkills.removeUser_skills(this);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllUser_skills() {
      if (user_skills != null)
      {
         Skills oldSkills;
         for (java.util.Iterator iter = getIteratorUser_skills(); iter.hasNext();)
         {
            oldSkills = (Skills)iter.next();
            iter.remove();
            oldSkills.removeUser_skills(this);
         }
      }
   }
   /** @pdGenerated default getter */
   public java.util.Collection<UserNotifications> getUser_notifications_relationship() {
      if (user_notifications_relationship == null)
         user_notifications_relationship = new java.util.HashSet<UserNotifications>();
      return user_notifications_relationship;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIteratorUser_notifications_relationship() {
      if (user_notifications_relationship == null)
         user_notifications_relationship = new java.util.HashSet<UserNotifications>();
      return user_notifications_relationship.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newUser_notifications_relationship */
   public void setUser_notifications_relationship(java.util.Collection<UserNotifications> newUser_notifications_relationship) {
      removeAllUser_notifications_relationship();
      for (java.util.Iterator iter = newUser_notifications_relationship.iterator(); iter.hasNext();)
         addUser_notifications_relationship((UserNotifications)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newUserNotifications */
   public void addUser_notifications_relationship(UserNotifications newUserNotifications) {
      if (newUserNotifications == null)
         return;
      if (this.user_notifications_relationship == null)
         this.user_notifications_relationship = new java.util.HashSet<UserNotifications>();
      if (!this.user_notifications_relationship.contains(newUserNotifications))
      {
         this.user_notifications_relationship.add(newUserNotifications);
         newUserNotifications.addUser_notifications_relationship(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param oldUserNotifications */
   public void removeUser_notifications_relationship(UserNotifications oldUserNotifications) {
      if (oldUserNotifications == null)
         return;
      if (this.user_notifications_relationship != null)
         if (this.user_notifications_relationship.contains(oldUserNotifications))
         {
            this.user_notifications_relationship.remove(oldUserNotifications);
            oldUserNotifications.removeUser_notifications_relationship(this);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllUser_notifications_relationship() {
      if (user_notifications_relationship != null)
      {
         UserNotifications oldUserNotifications;
         for (java.util.Iterator iter = getIteratorUser_notifications_relationship(); iter.hasNext();)
         {
            oldUserNotifications = (UserNotifications)iter.next();
            iter.remove();
            oldUserNotifications.removeUser_notifications_relationship(this);
         }
      }
   }
   /** @pdGenerated default getter */
   public java.util.Collection<Tags> getFollow_tags() {
      if (follow_tags == null)
         follow_tags = new java.util.HashSet<Tags>();
      return follow_tags;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIteratorFollow_tags() {
      if (follow_tags == null)
         follow_tags = new java.util.HashSet<Tags>();
      return follow_tags.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newFollow_tags */
   public void setFollow_tags(java.util.Collection<Tags> newFollow_tags) {
      removeAllFollow_tags();
      for (java.util.Iterator iter = newFollow_tags.iterator(); iter.hasNext();)
         addFollow_tags((Tags)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newTags */
   public void addFollow_tags(Tags newTags) {
      if (newTags == null)
         return;
      if (this.follow_tags == null)
         this.follow_tags = new java.util.HashSet<Tags>();
      if (!this.follow_tags.contains(newTags))
      {
         this.follow_tags.add(newTags);
         newTags.addFollow_tags(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param oldTags */
   public void removeFollow_tags(Tags oldTags) {
      if (oldTags == null)
         return;
      if (this.follow_tags != null)
         if (this.follow_tags.contains(oldTags))
         {
            this.follow_tags.remove(oldTags);
            oldTags.removeFollow_tags(this);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllFollow_tags() {
      if (follow_tags != null)
      {
         Tags oldTags;
         for (java.util.Iterator iter = getIteratorFollow_tags(); iter.hasNext();)
         {
            oldTags = (Tags)iter.next();
            iter.remove();
            oldTags.removeFollow_tags(this);
         }
      }
   }
   /** @pdGenerated default getter */
   public java.util.Collection<Jobs> getBookmarks() {
      if (bookmarks == null)
         bookmarks = new java.util.HashSet<Jobs>();
      return bookmarks;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIteratorBookmarks() {
      if (bookmarks == null)
         bookmarks = new java.util.HashSet<Jobs>();
      return bookmarks.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newBookmarks */
   public void setBookmarks(java.util.Collection<Jobs> newBookmarks) {
      removeAllBookmarks();
      for (java.util.Iterator iter = newBookmarks.iterator(); iter.hasNext();)
         addBookmarks((Jobs)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newJobs */
   public void addBookmarks(Jobs newJobs) {
      if (newJobs == null)
         return;
      if (this.bookmarks == null)
         this.bookmarks = new java.util.HashSet<Jobs>();
      if (!this.bookmarks.contains(newJobs))
      {
         this.bookmarks.add(newJobs);
         newJobs.addBookmarks(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param oldJobs */
   public void removeBookmarks(Jobs oldJobs) {
      if (oldJobs == null)
         return;
      if (this.bookmarks != null)
         if (this.bookmarks.contains(oldJobs))
         {
            this.bookmarks.remove(oldJobs);
            oldJobs.removeBookmarks(this);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllBookmarks() {
      if (bookmarks != null)
      {
         Jobs oldJobs;
         for (java.util.Iterator iter = getIteratorBookmarks(); iter.hasNext();)
         {
            oldJobs = (Jobs)iter.next();
            iter.remove();
            oldJobs.removeBookmarks(this);
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
         newComments.setUsers(this);      
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
            oldComments.setUsers((Users)null);
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
            oldComments.setUsers((Users)null);
         }
      }
   }
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
         newCompanies.setUsers(this);      
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
            oldCompanies.setUsers((Users)null);
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
            oldCompanies.setUsers((Users)null);
         }
      }
   }
   /** @pdGenerated default getter */
   public java.util.Collection<Conversations> getConversations() {
      if (conversations == null)
         conversations = new java.util.HashSet<Conversations>();
      return conversations;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIteratorConversations() {
      if (conversations == null)
         conversations = new java.util.HashSet<Conversations>();
      return conversations.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newConversations */
   public void setConversations(java.util.Collection<Conversations> newConversations) {
      removeAllConversations();
      for (java.util.Iterator iter = newConversations.iterator(); iter.hasNext();)
         addConversations((Conversations)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newConversations */
   public void addConversations(Conversations newConversations) {
      if (newConversations == null)
         return;
      if (this.conversations == null)
         this.conversations = new java.util.HashSet<Conversations>();
      if (!this.conversations.contains(newConversations))
      {
         this.conversations.add(newConversations);
         newConversations.setUsers(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param oldConversations */
   public void removeConversations(Conversations oldConversations) {
      if (oldConversations == null)
         return;
      if (this.conversations != null)
         if (this.conversations.contains(oldConversations))
         {
            this.conversations.remove(oldConversations);
            oldConversations.setUsers((Users)null);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllConversations() {
      if (conversations != null)
      {
         Conversations oldConversations;
         for (java.util.Iterator iter = getIteratorConversations(); iter.hasNext();)
         {
            oldConversations = (Conversations)iter.next();
            iter.remove();
            oldConversations.setUsers((Users)null);
         }
      }
   }
   /** @pdGenerated default getter */
   public java.util.Collection<Messages> getMessages() {
      if (messages == null)
         messages = new java.util.HashSet<Messages>();
      return messages;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIteratorMessages() {
      if (messages == null)
         messages = new java.util.HashSet<Messages>();
      return messages.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newMessages */
   public void setMessages(java.util.Collection<Messages> newMessages) {
      removeAllMessages();
      for (java.util.Iterator iter = newMessages.iterator(); iter.hasNext();)
         addMessages((Messages)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newMessages */
   public void addMessages(Messages newMessages) {
      if (newMessages == null)
         return;
      if (this.messages == null)
         this.messages = new java.util.HashSet<Messages>();
      if (!this.messages.contains(newMessages))
      {
         this.messages.add(newMessages);
         newMessages.setUsers(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param oldMessages */
   public void removeMessages(Messages oldMessages) {
      if (oldMessages == null)
         return;
      if (this.messages != null)
         if (this.messages.contains(oldMessages))
         {
            this.messages.remove(oldMessages);
            oldMessages.setUsers((Users)null);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllMessages() {
      if (messages != null)
      {
         Messages oldMessages;
         for (java.util.Iterator iter = getIteratorMessages(); iter.hasNext();)
         {
            oldMessages = (Messages)iter.next();
            iter.remove();
            oldMessages.setUsers((Users)null);
         }
      }
   }
   /** @pdGenerated default getter */
   public java.util.Collection<Educations> getEducations() {
      if (educations == null)
         educations = new java.util.HashSet<Educations>();
      return educations;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIteratorEducations() {
      if (educations == null)
         educations = new java.util.HashSet<Educations>();
      return educations.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newEducations */
   public void setEducations(java.util.Collection<Educations> newEducations) {
      removeAllEducations();
      for (java.util.Iterator iter = newEducations.iterator(); iter.hasNext();)
         addEducations((Educations)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newEducations */
   public void addEducations(Educations newEducations) {
      if (newEducations == null)
         return;
      if (this.educations == null)
         this.educations = new java.util.HashSet<Educations>();
      if (!this.educations.contains(newEducations))
      {
         this.educations.add(newEducations);
         newEducations.setUsers(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param oldEducations */
   public void removeEducations(Educations oldEducations) {
      if (oldEducations == null)
         return;
      if (this.educations != null)
         if (this.educations.contains(oldEducations))
         {
            this.educations.remove(oldEducations);
            oldEducations.setUsers((Users)null);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllEducations() {
      if (educations != null)
      {
         Educations oldEducations;
         for (java.util.Iterator iter = getIteratorEducations(); iter.hasNext();)
         {
            oldEducations = (Educations)iter.next();
            iter.remove();
            oldEducations.setUsers((Users)null);
         }
      }
   }
   /** @pdGenerated default getter */
   public java.util.Collection<Posts> getPosts() {
      if (posts == null)
         posts = new java.util.HashSet<Posts>();
      return posts;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIteratorPosts() {
      if (posts == null)
         posts = new java.util.HashSet<Posts>();
      return posts.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newPosts */
   public void setPosts(java.util.Collection<Posts> newPosts) {
      removeAllPosts();
      for (java.util.Iterator iter = newPosts.iterator(); iter.hasNext();)
         addPosts((Posts)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newPosts */
   public void addPosts(Posts newPosts) {
      if (newPosts == null)
         return;
      if (this.posts == null)
         this.posts = new java.util.HashSet<Posts>();
      if (!this.posts.contains(newPosts))
      {
         this.posts.add(newPosts);
         newPosts.setUsers(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param oldPosts */
   public void removePosts(Posts oldPosts) {
      if (oldPosts == null)
         return;
      if (this.posts != null)
         if (this.posts.contains(oldPosts))
         {
            this.posts.remove(oldPosts);
            oldPosts.setUsers((Users)null);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllPosts() {
      if (posts != null)
      {
         Posts oldPosts;
         for (java.util.Iterator iter = getIteratorPosts(); iter.hasNext();)
         {
            oldPosts = (Posts)iter.next();
            iter.remove();
            oldPosts.setUsers((Users)null);
         }
      }
   }
   /** @pdGenerated default getter */
   public java.util.Collection<Users> getFollow_users2() {
      if (follow_users2 == null)
         follow_users2 = new java.util.HashSet<Users>();
      return follow_users2;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIteratorFollow_users2() {
      if (follow_users2 == null)
         follow_users2 = new java.util.HashSet<Users>();
      return follow_users2.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newFollow_users2 */
   public void setFollow_users2(java.util.Collection<Users> newFollow_users2) {
      removeAllFollow_users2();
      for (java.util.Iterator iter = newFollow_users2.iterator(); iter.hasNext();)
         addFollow_users2((Users)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newUsers */
   public void addFollow_users2(Users newUsers) {
      if (newUsers == null)
         return;
      if (this.follow_users2 == null)
         this.follow_users2 = new java.util.HashSet<Users>();
      if (!this.follow_users2.contains(newUsers))
      {
         this.follow_users2.add(newUsers);
         newUsers.addFollow_users(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param oldUsers */
   public void removeFollow_users2(Users oldUsers) {
      if (oldUsers == null)
         return;
      if (this.follow_users2 != null)
         if (this.follow_users2.contains(oldUsers))
         {
            this.follow_users2.remove(oldUsers);
            oldUsers.removeFollow_users(this);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllFollow_users2() {
      if (follow_users2 != null)
      {
         Users oldUsers;
         for (java.util.Iterator iter = getIteratorFollow_users2(); iter.hasNext();)
         {
            oldUsers = (Users)iter.next();
            iter.remove();
            oldUsers.removeFollow_users(this);
         }
      }
   }
   /** @pdGenerated default getter */
   public java.util.Collection<Roles> getUser_roles() {
      if (user_roles == null)
         user_roles = new java.util.HashSet<Roles>();
      return user_roles;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIteratorUser_roles() {
      if (user_roles == null)
         user_roles = new java.util.HashSet<Roles>();
      return user_roles.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newUser_roles */
   public void setUser_roles(java.util.Collection<Roles> newUser_roles) {
      removeAllUser_roles();
      for (java.util.Iterator iter = newUser_roles.iterator(); iter.hasNext();)
         addUser_roles((Roles)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newRoles */
   public void addUser_roles(Roles newRoles) {
      if (newRoles == null)
         return;
      if (this.user_roles == null)
         this.user_roles = new java.util.HashSet<Roles>();
      if (!this.user_roles.contains(newRoles))
      {
         this.user_roles.add(newRoles);
         newRoles.addUser_roles(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param oldRoles */
   public void removeUser_roles(Roles oldRoles) {
      if (oldRoles == null)
         return;
      if (this.user_roles != null)
         if (this.user_roles.contains(oldRoles))
         {
            this.user_roles.remove(oldRoles);
            oldRoles.removeUser_roles(this);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllUser_roles() {
      if (user_roles != null)
      {
         Roles oldRoles;
         for (java.util.Iterator iter = getIteratorUser_roles(); iter.hasNext();)
         {
            oldRoles = (Roles)iter.next();
            iter.remove();
            oldRoles.removeUser_roles(this);
         }
      }
   }
   /** @pdGenerated default getter */
   public java.util.Collection<Conversations> getParticipants() {
      if (participants == null)
         participants = new java.util.HashSet<Conversations>();
      return participants;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIteratorParticipants() {
      if (participants == null)
         participants = new java.util.HashSet<Conversations>();
      return participants.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newParticipants */
   public void setParticipants(java.util.Collection<Conversations> newParticipants) {
      removeAllParticipants();
      for (java.util.Iterator iter = newParticipants.iterator(); iter.hasNext();)
         addParticipants((Conversations)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newConversations */
   public void addParticipants(Conversations newConversations) {
      if (newConversations == null)
         return;
      if (this.participants == null)
         this.participants = new java.util.HashSet<Conversations>();
      if (!this.participants.contains(newConversations))
      {
         this.participants.add(newConversations);
         newConversations.addParticipants(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param oldConversations */
   public void removeParticipants(Conversations oldConversations) {
      if (oldConversations == null)
         return;
      if (this.participants != null)
         if (this.participants.contains(oldConversations))
         {
            this.participants.remove(oldConversations);
            oldConversations.removeParticipants(this);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllParticipants() {
      if (participants != null)
      {
         Conversations oldConversations;
         for (java.util.Iterator iter = getIteratorParticipants(); iter.hasNext();)
         {
            oldConversations = (Conversations)iter.next();
            iter.remove();
            oldConversations.removeParticipants(this);
         }
      }
   }
   /** @pdGenerated default getter */
   public java.util.Collection<Users> getFollow_users() {
      if (follow_users == null)
         follow_users = new java.util.HashSet<Users>();
      return follow_users;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIteratorFollow_users() {
      if (follow_users == null)
         follow_users = new java.util.HashSet<Users>();
      return follow_users.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newFollow_users */
   public void setFollow_users(java.util.Collection<Users> newFollow_users) {
      removeAllFollow_users();
      for (java.util.Iterator iter = newFollow_users.iterator(); iter.hasNext();)
         addFollow_users((Users)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newUsers */
   public void addFollow_users(Users newUsers) {
      if (newUsers == null)
         return;
      if (this.follow_users == null)
         this.follow_users = new java.util.HashSet<Users>();
      if (!this.follow_users.contains(newUsers))
      {
         this.follow_users.add(newUsers);
         newUsers.addFollow_users2(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param oldUsers */
   public void removeFollow_users(Users oldUsers) {
      if (oldUsers == null)
         return;
      if (this.follow_users != null)
         if (this.follow_users.contains(oldUsers))
         {
            this.follow_users.remove(oldUsers);
            oldUsers.removeFollow_users2(this);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllFollow_users() {
      if (follow_users != null)
      {
         Users oldUsers;
         for (java.util.Iterator iter = getIteratorFollow_users(); iter.hasNext();)
         {
            oldUsers = (Users)iter.next();
            iter.remove();
            oldUsers.removeFollow_users2(this);
         }
      }
   }

}