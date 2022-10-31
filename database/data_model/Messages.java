/***********************************************************************
 * Module:  Messages.java
 * Author:  linh2
 * Purpose: Defines the Class Messages
 ***********************************************************************/

import java.util.*;

/** @pdOid 726441a5-1566-48d2-8607-d46e648ad664 */
public class Messages {
   /** @pdOid df64bbbc-f6a8-42cb-b9dc-ce8ffb616a71 */
   public int messageId;
   /** @pdOid 2a456bc2-d7f5-4df1-8035-0441cd7b19c4 */
   public java.lang.String message;
   /** @pdOid 71c14570-726e-4c01-a362-b7da59f55377 */
   public java.lang.String messageType;
   /** @pdOid f160300c-7b5e-4ec8-8b41-09861a6f2c59 */
   public java.util.Date createdAt;
   /** @pdOid f504a9c6-3d0d-422a-921e-02bc72e2c859 */
   public java.util.Date updatedAt;
   /** @pdOid 618ca76c-3911-4cb0-b085-7cbaa2fb7d6b */
   public java.util.Date deletedAt;
   
   /** @pdRoleInfo migr=no name=Attachments assc=messageAttactment coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   public java.util.Collection<Attachments> attachments;
   /** @pdRoleInfo migr=no name=Conversations assc=conservationMessages mult=1..1 side=A */
   public Conversations conversations;
   /** @pdRoleInfo migr=no name=Users assc=userCreateMessage mult=1..1 side=A */
   public Users users;
   
   
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
         newAttachments.setMessages(this);      
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
            oldAttachments.setMessages((Messages)null);
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
            oldAttachments.setMessages((Messages)null);
         }
      }
   }
   /** @pdGenerated default parent getter */
   public Conversations getConversations() {
      return conversations;
   }
   
   /** @pdGenerated default parent setter
     * @param newConversations */
   public void setConversations(Conversations newConversations) {
      if (this.conversations == null || !this.conversations.equals(newConversations))
      {
         if (this.conversations != null)
         {
            Conversations oldConversations = this.conversations;
            this.conversations = null;
            oldConversations.removeMessages(this);
         }
         if (newConversations != null)
         {
            this.conversations = newConversations;
            this.conversations.addMessages(this);
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
            oldUsers.removeMessages(this);
         }
         if (newUsers != null)
         {
            this.users = newUsers;
            this.users.addMessages(this);
         }
      }
   }

}