/***********************************************************************
 * Module:  AttachmentTypes.java
 * Author:  linh2
 * Purpose: Defines the Class AttachmentTypes
 ***********************************************************************/

import java.util.*;

/** @pdOid 5f975fa9-5fcd-492c-bb90-71323bd77c84 */
public class AttachmentTypes {
   /** @pdOid d3c18342-2cc1-493b-874e-0d7b3bc31f29 */
   public int attachmentTypeId;
   /** @pdOid 9cc0b9a6-0234-468d-ba46-cfe02e163fcc */
   public java.lang.String type;
   
   /** @pdRoleInfo migr=no name=Attachments assc=attachmentType coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   public java.util.Collection<Attachments> attachments;
   
   
   /** @pdGenerated default getter */
   public java.util.Collection<Attachments> getAttachments() {
      if (attachments == null)
         attachments = new java.util.HashSet<Attachments>();
      return attachments;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIteratorAttachments() {
      if (attachments == null)
         attachments = new java.util.HashSet<Attachments>();
      return attachments.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newAttachments */
   public void setAttachments(java.util.Collection<Attachments> newAttachments) {
      removeAllAttachments();
      for (java.util.Iterator iter = newAttachments.iterator(); iter.hasNext();)
         addAttachments((Attachments)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newAttachments */
   public void addAttachments(Attachments newAttachments) {
      if (newAttachments == null)
         return;
      if (this.attachments == null)
         this.attachments = new java.util.HashSet<Attachments>();
      if (!this.attachments.contains(newAttachments))
      {
         this.attachments.add(newAttachments);
         newAttachments.setAttachmentTypes(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param oldAttachments */
   public void removeAttachments(Attachments oldAttachments) {
      if (oldAttachments == null)
         return;
      if (this.attachments != null)
         if (this.attachments.contains(oldAttachments))
         {
            this.attachments.remove(oldAttachments);
            oldAttachments.setAttachmentTypes((AttachmentTypes)null);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllAttachments() {
      if (attachments != null)
      {
         Attachments oldAttachments;
         for (java.util.Iterator iter = getIteratorAttachments(); iter.hasNext();)
         {
            oldAttachments = (Attachments)iter.next();
            iter.remove();
            oldAttachments.setAttachmentTypes((AttachmentTypes)null);
         }
      }
   }

}