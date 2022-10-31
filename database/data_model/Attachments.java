/***********************************************************************
 * Module:  Attachments.java
 * Author:  linh2
 * Purpose: Defines the Class Attachments
 ***********************************************************************/

import java.util.*;

/** @pdOid 570cad4b-d890-424b-9b23-45ccd8bafb27 */
public class Attachments {
   /** @pdOid 3953b061-fe6d-470d-a32d-68b1769d3f60 */
   public int attachmentId;
   /** @pdOid e7a1ed88-3d22-4b91-819b-c0fc5cd8ee60 */
   public java.lang.String attachmentUrl;
   
   /** @pdRoleInfo migr=no name=Messages assc=messageAttactment mult=1..1 side=A */
   public Messages messages;
   /** @pdRoleInfo migr=no name=AttachmentTypes assc=attachmentType mult=1..1 side=A */
   public AttachmentTypes attachmentTypes;
   
   
   /** @pdGenerated default parent getter */
   public Messages getMessages() {
      return messages;
   }
   
   /** @pdGenerated default parent setter
     * @param newMessages */
   public void setMessages(Messages newMessages) {
      if (this.messages == null || !this.messages.equals(newMessages))
      {
         if (this.messages != null)
         {
            Messages oldMessages = this.messages;
            this.messages = null;
            oldMessages.removeAttachments(this);
         }
         if (newMessages != null)
         {
            this.messages = newMessages;
            this.messages.addAttachments(this);
         }
      }
   }
   /** @pdGenerated default parent getter */
   public AttachmentTypes getAttachmentTypes() {
      return attachmentTypes;
   }
   
   /** @pdGenerated default parent setter
     * @param newAttachmentTypes */
   public void setAttachmentTypes(AttachmentTypes newAttachmentTypes) {
      if (this.attachmentTypes == null || !this.attachmentTypes.equals(newAttachmentTypes))
      {
         if (this.attachmentTypes != null)
         {
            AttachmentTypes oldAttachmentTypes = this.attachmentTypes;
            this.attachmentTypes = null;
            oldAttachmentTypes.removeAttachments(this);
         }
         if (newAttachmentTypes != null)
         {
            this.attachmentTypes = newAttachmentTypes;
            this.attachmentTypes.addAttachments(this);
         }
      }
   }

}