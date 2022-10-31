/***********************************************************************
 * Module:  Educations.java
 * Author:  linh2
 * Purpose: Defines the Class Educations
 ***********************************************************************/

import java.util.*;

/** @pdOid 77744409-5251-4cac-a03d-94e9f8c9f462 */
public class Educations {
   /** @pdOid 2a57e5db-4768-4f02-971c-e8a5955a6132 */
   public int educationId;
   /** @pdOid 7d048d89-f602-4f55-9d0a-24efa26c5d85 */
   public java.lang.String schoolName;
   /** @pdOid c867fc13-1915-42d3-ae11-68942dec5a2a */
   public java.util.Date startDate;
   /** @pdOid b4fab687-7d50-49f7-b32e-de2841d7cd25 */
   public java.util.Date endDate;
   /** @pdOid 0401fb45-c3e4-4ecc-920c-aab899194871 */
   public float grade;
   
   /** @pdRoleInfo migr=no name=Users assc=userEducation mult=1..1 side=A */
   public Users users;
   
   
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
            oldUsers.removeEducations(this);
         }
         if (newUsers != null)
         {
            this.users = newUsers;
            this.users.addEducations(this);
         }
      }
   }

}