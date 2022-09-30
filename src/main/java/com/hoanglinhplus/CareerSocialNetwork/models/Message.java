package com.hoanglinhplus.CareerSocialNetwork.models;

import com.hoanglinhplus.CareerSocialNetwork.constants.MessageType;
import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.util.List;
import java.util.Date;
import java.util.ArrayList;
import java.util.Iterator;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
@EntityListeners(AuditingEntityListener.class)
@Table(name = "messages")
public class Message {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "message_id")
  private Long messageId;
  private String message;
  @Enumerated(EnumType.STRING)
  private MessageType messageType;
  @CreatedDate
  private Date createdAt;
  @LastModifiedDate
  private Date updatedAt;
  private Date deletedAt;
  @OneToMany(mappedBy = "message", orphanRemoval = true, cascade = {CascadeType.PERSIST, CascadeType.MERGE})
  private List<Attachment> attachments;
  @ManyToOne
  @JoinColumn(name = "conversation_id", referencedColumnName = "conversation_id", nullable = false)
  private Conversation conversation;
  @ManyToOne
  @JoinColumn(name = "user_id", referencedColumnName = "user_id", nullable = false)
  private User user;

  public List<Attachment> getAttachments() {
    if (attachments == null)
      attachments = new ArrayList<>();
    return attachments;
  }

  public Iterator<Attachment> getIteratorAttachments() {
    if (attachments == null)
      attachments = new ArrayList<>();
    return attachments.iterator();
  }


  public void setAttachments(List<Attachment> newAttachments) {
    removeAllAttachments();
    for (Attachment newAttachment : newAttachments) addAttachments(newAttachment);
  }

  public void addAttachments(Attachment newAttachment) {
    if (newAttachment == null)
      return;
    if (this.attachments == null)
      this.attachments = new ArrayList<>();
    if (!this.attachments.contains(newAttachment))
    {
      this.attachments.add(newAttachment);
      newAttachment.setMessages(this);
    }
  }

  public void removeAttachments(Attachment oldAttachment) {
    if (oldAttachment == null)
      return;
    if (this.attachments != null)
      if (this.attachments.contains(oldAttachment))
      {
        this.attachments.remove(oldAttachment);
        oldAttachment.setMessages(null);
      }
  }

  public void removeAllAttachments() {
    if (attachments != null)
    {
      Attachment oldAttachment;
      for (Iterator<Attachment> iter = getIteratorAttachments(); iter.hasNext();)
      {
        oldAttachment = iter.next();
        iter.remove();
        oldAttachment.setMessages(null);
      }
    }
  }
  public Conversation getConversations() {
    return conversation;
  }


  public void setConversations(Conversation newConversation) {
    if (this.conversation == null || !this.conversation.equals(newConversation))
    {
      if (this.conversation != null)
      {
        Conversation oldConversation = this.conversation;
        this.conversation = null;
        oldConversation.removeMessages(this);
      }
      if (newConversation != null)
      {
        this.conversation = newConversation;
        this.conversation.addMessages(this);
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
        oldUser.removeMessages(this);
      }
      if (newUser != null)
      {
        this.user = newUser;
        this.user.addMessages(this);
      }
    }
  }
}