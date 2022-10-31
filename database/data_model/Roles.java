/***********************************************************************
 * Module:  Roles.java
 * Author:  linh2
 * Purpose: Defines the Class Roles
 ***********************************************************************/

import java.util.*;

/** @pdOid 82fab9a4-f3fe-448f-8f6c-83465a505ba2 */
public class Roles {
   /** @pdOid b2d948fe-199f-4240-b505-0f2f766f9d3c */
   public int roleId;
   /** @pdOid 94307de2-194f-4105-8748-0888627fdcaa */
   public java.lang.String name;
   
   /** @pdRoleInfo migr=no name=Users assc=userRoles coll=java.util.Collection impl=java.util.HashSet mult=1..* */
   public java.util.Collection<Users> user_roles;
   
   
   /** @pdGenerated default getter */
   public java.util.Collection<Users> getUser_roles() {
      if (user_roles == null)
         user_roles = new java.util.HashSet<Users>();
      return user_roles;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIteratorUser_roles() {
      if (user_roles == null)
         user_roles = new java.util.HashSet<Users>();
      return user_roles.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newUser_roles */
   public void setUser_roles(java.util.Collection<Users> newUser_roles) {
      removeAllUser_roles();
      for (java.util.Iterator iter = newUser_roles.iterator(); iter.hasNext();)
         addUser_roles((Users)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newUsers */
   public void addUser_roles(Users newUsers) {
      if (newUsers == null)
         return;
      if (this.user_roles == null)
         this.user_roles = new java.util.HashSet<Users>();
      if (!this.user_roles.contains(newUsers))
      {
         this.user_roles.add(newUsers);
         newUsers.addUser_roles(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param oldUsers */
   public void removeUser_roles(Users oldUsers) {
      if (oldUsers == null)
         return;
      if (this.user_roles != null)
         if (this.user_roles.contains(oldUsers))
         {
            this.user_roles.remove(oldUsers);
            oldUsers.removeUser_roles(this);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllUser_roles() {
      if (user_roles != null)
      {
         Users oldUsers;
         for (java.util.Iterator iter = getIteratorUser_roles(); iter.hasNext();)
         {
            oldUsers = (Users)iter.next();
            iter.remove();
            oldUsers.removeUser_roles(this);
         }
      }
   }

}