/***********************************************************************
 * Module:  Conversations.java
 * Author:  linh2
 * Purpose: Defines the Class Conversations
 ***********************************************************************/

import java.util.*;

/** @pdOid 1a2e9e44-c362-42d3-a670-12c24f7ec849 */
public class Conversations {
   /** @pdOid 65d2d76d-cbed-4009-8049-32d72d47d720 */
   public int conversationId;
   /** @pdOid e4913b80-aa33-41d4-819f-885700379def */
   public java.util.Date createAt;
   /** @pdOid 192b4fd4-197a-4507-a322-30a2b80f22b5 */
   public java.util.Date updateAt;
   /** @pdOid 06fc1bb3-c0b4-4bd0-89f0-6c6777d82ec0 */
   public java.util.Date deleteAt;
   
   /** @pdRoleInfo migr=no name=Users assc=participants coll=java.util.Collection impl=java.util.HashSet mult=1..* */
   public java.util.Collection<Users> participants;
   /** @pdRoleInfo migr=no name=Messages assc=conservationMessages coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   public java.util.Collection<Messages> messages;
   /** @pdRoleInfo migr=no name=Users assc=userCreateConsversations mult=1..1 side=A */
   public Users users;
   
   
   /** @pdGenerated default getter */
   public java.util.Collection<Users> getParticipants() {
      if (participants == null)
         participants = new java.util.HashSet<Users>();
      return participants;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIteratorParticipants() {
      if (participants == null)
         participants = new java.util.HashSet<Users>();
      return participants.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newParticipants */
   public void setParticipants(java.util.Collection<Users> newParticipants) {
      removeAllParticipants();
      for (java.util.Iterator iter = newParticipants.iterator(); iter.hasNext();)
         addParticipants((Users)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newUsers */
   public void addParticipants(Users newUsers) {
      if (newUsers == null)
         return;
      if (this.participants == null)
         this.participants = new java.util.HashSet<Users>();
      if (!this.participants.contains(newUsers))
      {
         this.participants.add(newUsers);
         newUsers.addParticipants(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param oldUsers */
   public void removeParticipants(Users oldUsers) {
      if (oldUsers == null)
         return;
      if (this.participants != null)
         if (this.participants.contains(oldUsers))
         {
            this.participants.remove(oldUsers);
            oldUsers.removeParticipants(this);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllParticipants() {
      if (participants != null)
      {
         Users oldUsers;
         for (java.util.Iterator iter = getIteratorParticipants(); iter.hasNext();)
         {
            oldUsers = (Users)iter.next();
            iter.remove();
            oldUsers.removeParticipants(this);
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
         newMessages.setConversations(this);      
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
            oldMessages.setConversations((Conversations)null);
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
            oldMessages.setConversations((Conversations)null);
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
            oldUsers.removeConversations(this);
         }
         if (newUsers != null)
         {
            this.users = newUsers;
            this.users.addConversations(this);
         }
      }
   }

}