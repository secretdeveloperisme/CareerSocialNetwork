package com.hoanglinhplus.CareerSocialNetwork.models;

import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.util.*;


@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
@EntityListeners(AuditingEntityListener.class)
@Table(name = "Conversations")
public class Conversation {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "conversation_id")
  private Long conversationId;
  @CreatedDate
  private Date createAt;
  @LastModifiedDate
  private Date updateAt;
  private Date deleteAt;
  @ManyToMany
  @JoinTable(name = "participants",joinColumns = @JoinColumn(name = "conversation_id", referencedColumnName = "conversation_id", nullable = false)
      , inverseJoinColumns = @JoinColumn(name = "user_id", referencedColumnName = "user_id"))
  private List<User> participants;
  @OneToMany(mappedBy = "conversation", orphanRemoval = true)
  private List<Message> messages;
  @ManyToOne
  @JoinColumn(name = "user_id", referencedColumnName = "user_id", nullable = false)
  private User user;
  public Collection<User> getParticipants() {
    if (participants == null)
      participants = new ArrayList<>();
    return participants;
  }

  public Iterator<User> getIteratorParticipants() {
    if (participants == null)
      participants = new ArrayList<>();
    return participants.iterator();
  }

  public void setParticipants(Collection<User> newPaticipants) {
    removeAllParticipants();
    for (User newParticipant : newPaticipants) {
      addParticipants(newParticipant);
    }
  }

  public void addParticipants(User newUser) {
    if (newUser == null)
      return;
    if (this.participants == null)
      this.participants = new ArrayList<>();
    if (!this.participants.contains(newUser))
    {
      this.participants.add(newUser);
      newUser.addParticipants(this);
    }
  }

  public void removeParticipants(User oldUser) {
    if (oldUser == null)
      return;
    if (this.participants != null)
      if (this.participants.contains(oldUser))
      {
        this.participants.remove(oldUser);
        oldUser.removeParticipants(this);
      }
  }

  public void removeAllParticipants() {
    if (participants != null)
    {
      User oldUser;
      for (Iterator<User> iter = getIteratorParticipants(); iter.hasNext();)
      {
        oldUser = iter.next();
        iter.remove();
        oldUser.removeParticipants(this);
      }
    }
  }

  public Iterator<Message> getIteratorMessages() {
    if (messages == null)
      messages = new ArrayList<>();
    return messages.iterator();
  }

  public void setMessages(Collection<Message> newMessages) {
    removeAllMessages();
    for (Message newMessage : newMessages) addMessages(newMessage);
  }

  public void addMessages(Message newMessage) {
    if (newMessage == null)
      return;
    if (this.messages == null)
      this.messages = new ArrayList<>();
    if (!this.messages.contains(newMessage))
    {
      this.messages.add(newMessage);
      newMessage.setConversations(this);
    }
  }

  public void removeMessages(Message oldMessage) {
    if (oldMessage == null)
      return;
    if (this.messages != null)
      if (this.messages.contains(oldMessage))
      {
        this.messages.remove(oldMessage);
        oldMessage.setConversations(null);
      }
  }

  public void removeAllMessages() {
    if (messages != null)
    {
      Message oldMessage;
      for (Iterator<Message> iter = getIteratorMessages(); iter.hasNext();)
      {
        oldMessage = iter.next();
        iter.remove();
        oldMessage.setConversations(null);
      }
    }
  }

  public User getUsers() {
    return user;
  }

  public void setUsers(User newUser) {
    if (this.user == null || !this.user.equals(newUser))
    {
      if (this.user != null)
      {
        User oldUser = this.user;
        this.user = null;
        oldUser.removeConversations(this);
      }
      if (newUser != null)
      {
        this.user = newUser;
        this.user.addConversations(this);
      }
    }
  }

}