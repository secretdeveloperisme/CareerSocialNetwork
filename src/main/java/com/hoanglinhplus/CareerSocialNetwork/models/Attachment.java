package com.hoanglinhplus.CareerSocialNetwork.models;

import lombok.*;

import javax.persistence.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "attachments")
public class Attachment {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long attachmentId;
  @Column(nullable = false, length = 1000)
  private String attachmentUrl;
  @ManyToOne(cascade = {CascadeType.PERSIST})
  @JoinColumn(name = "message_id", referencedColumnName = "message_id", nullable = false)
  private Message message;
  @ManyToOne(cascade = CascadeType.PERSIST)
  @JoinColumn(name = "attachment_type_id", referencedColumnName = "attachment_type_id", nullable = false)
  private AttachmentType attachmentType;
  public Message getMessages() {
    return message;
  }
  public void setMessages(Message newMessage) {
    if (this.message == null || !this.message.equals(newMessage)) {
      if (this.message != null) {
        Message oldMessage = this.message;
        this.message = null;
        oldMessage.removeAttachments(this);
      }
      if (newMessage != null) {
        this.message = newMessage;
        this.message.addAttachments(this);
      }
    }
  }

  public AttachmentType getAttachmentTypes() {
    return attachmentType;
  }

  public void setAttachmentTypes(AttachmentType newAttachmentType) {
    if (this.attachmentType == null || !this.attachmentType.equals(newAttachmentType)) {
      if (this.attachmentType != null) {
        AttachmentType oldAttachmentType = this.attachmentType;
        this.attachmentType = null;
        oldAttachmentType.removeAttachments(this);
      }
      if (newAttachmentType != null) {
        this.attachmentType = newAttachmentType;
        this.attachmentType.addAttachments(this);
      }
    }
  }

}