/***********************************************************************
 * Module:  CompanyNotifications.java
 * Author:  linh2
 * Purpose: Defines the Class CompanyNotifications
 ***********************************************************************/

import java.util.*;

/** @pdOid 16888816-479c-437a-8b0d-49bc40e7c58e */
public class CompanyNotifications {
   /** @pdOid 1ea40e36-79a3-4891-baaf-36e0eee09a27 */
   public java.lang.String title;
   /** @pdOid 7e348845-fbc8-4971-a8a5-4665a5b4f750 */
   public java.lang.String content;
   /** @pdOid 0a3e95e7-613b-4c8f-881f-582a2820c481 */
   public java.lang.String type;
   /** @pdOid 2e381922-e338-42c8-aa48-1fb51ded2f6a */
   public java.util.Date createdAt;
   /** @pdOid b388403b-abf7-4b1a-a558-8887b22768e8 */
   public java.util.Date deletedAt;
   /** @pdOid 5dbda414-c728-4225-9e87-27c85785d8e9 */
   public boolean isRead;
   
   /** @pdRoleInfo migr=no name=Companies assc=companyNotification mult=0..1 side=A */
   public Companies companies;
   /** @pdRoleInfo migr=no name=Notifications assc=companyNotifiacationExtend mult=1..1 side=A */
   public Notifications notifications;
   
   
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
            oldCompanies.removeCompanyNotifications(this);
         }
         if (newCompanies != null)
         {
            this.companies = newCompanies;
            this.companies.addCompanyNotifications(this);
         }
      }
   }

}