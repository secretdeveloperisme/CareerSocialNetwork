/***********************************************************************
 * Module:  Notifications.java
 * Author:  linh2
 * Purpose: Defines the Class Notifications
 ***********************************************************************/

import java.util.*;

/** @pdOid f4dd1790-448e-4826-acd7-9918578de54f */
public class Notifications {
   /** @pdOid d0a7faf0-b13e-4f4a-9e58-d8f9c692fe17 */
   public int notificationId;
   /** @pdOid 77f27fa3-d0ec-40b8-8874-14efa0fdf869 */
   public java.lang.String title;
   /** @pdOid 82035c0b-b786-462c-b214-0259cd1052ef */
   public java.lang.String content;
   /** @pdOid 75ddcdac-32ad-491b-8501-a061e591fc63 */
   public java.lang.String type;
   /** @pdOid b12433d7-31db-4ce3-9a8b-afc7f19d5d67 */
   public java.util.Date createdAt;
   /** @pdOid d5b31008-fc60-42b2-a95e-3fbe67166f85 */
   public java.util.Date deletedAt;
   /** @pdOid 78db4ad4-d886-45c9-b837-8d0f9dd9f427 */
   public boolean isRead;
   
   /** @pdRoleInfo migr=no name=UserNotifications assc=userNotifiacationExtend mult=0..1 type=Composition */
   public UserNotifications userNotifications;
   /** @pdRoleInfo migr=no name=CompanyNotifications assc=companyNotifiacationExtend mult=0..1 type=Composition */
   public CompanyNotifications companyNotifications;

}