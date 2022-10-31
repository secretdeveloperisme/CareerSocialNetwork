/***********************************************************************
 * Module:  UserNotifications.java
 * Author:  linh2
 * Purpose: Defines the Class UserNotifications
 ***********************************************************************/

import java.util.*;

/** @pdOid 88acbea9-eea7-4a66-b0dc-ad761cb4f906 */
public class UserNotifications {
   /** @pdOid a2e89d1e-01cc-4ae5-a9d5-d1454a0c5f03 */
   public java.lang.String title;
   /** @pdOid b6caae0c-426e-46f6-8886-d1de6739fb8b */
   public java.lang.String content;
   /** @pdOid 14eebf73-9da1-462f-b9e6-18df7757eb58 */
   public java.lang.String type;
   /** @pdOid 9d55f75c-ccc1-4946-b046-c3915300c4c7 */
   public java.util.Date createdAt;
   /** @pdOid 94314fb5-555a-4e35-9f2a-8d366024ed01 */
   public java.util.Date deletedAt;
   /** @pdOid 3b5f5762-abf9-48a7-8e95-06915f9243f2 */
   public boolean isRead;
   
   /** @pdRoleInfo migr=no name=Users assc=userNotificationsRelationship coll=java.util.Collection impl=java.util.HashSet mult=0..* side=A */
   public java.util.Collection<Users> user_notifications_relationship;
   /** @pdRoleInfo migr=no name=Notifications assc=userNotifiacationExtend mult=1..1 side=A */
   public Notifications notifications;
   
   
   /** @pdGenerated default getter */
   public java.util.Collection<Users> getUser_notifications_relationship() {
      if (user_notifications_relationship == null)
         user_notifications_relationship = new java.util.HashSet<Users>();
      return user_notifications_relationship;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIteratorUser_notifications_relationship() {
      if (user_notifications_relationship == null)
         user_notifications_relationship = new java.util.HashSet<Users>();
      return user_notifications_relationship.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newUser_notifications_relationship */
   public void setUser_notifications_relationship(java.util.Collection<Users> newUser_notifications_relationship) {
      removeAllUser_notifications_relationship();
      for (java.util.Iterator iter = newUser_notifications_relationship.iterator(); iter.hasNext();)
         addUser_notifications_relationship((Users)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newUsers */
   public void addUser_notifications_relationship(Users newUsers) {
      if (newUsers == null)
         return;
      if (this.user_notifications_relationship == null)
         this.user_notifications_relationship = new java.util.HashSet<Users>();
      if (!this.user_notifications_relationship.contains(newUsers))
      {
         this.user_notifications_relationship.add(newUsers);
         newUsers.addUser_notifications_relationship(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param oldUsers */
   public void removeUser_notifications_relationship(Users oldUsers) {
      if (oldUsers == null)
         return;
      if (this.user_notifications_relationship != null)
         if (this.user_notifications_relationship.contains(oldUsers))
         {
            this.user_notifications_relationship.remove(oldUsers);
            oldUsers.removeUser_notifications_relationship(this);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllUser_notifications_relationship() {
      if (user_notifications_relationship != null)
      {
         Users oldUsers;
         for (java.util.Iterator iter = getIteratorUser_notifications_relationship(); iter.hasNext();)
         {
            oldUsers = (Users)iter.next();
            iter.remove();
            oldUsers.removeUser_notifications_relationship(this);
         }
      }
   }

}