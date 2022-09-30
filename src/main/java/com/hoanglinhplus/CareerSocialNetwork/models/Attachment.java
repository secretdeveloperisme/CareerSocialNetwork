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
  @Column(name = "attachment_id")
  private Long attachmentId;
  @Column(nullable = false, length = 1000)
  private String attachmentUrl;
  @ManyToOne
  @JoinColumn(name = "message_id", referencedColumnName = "message_id", nullable = false)
  private Message message;
  @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
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



}