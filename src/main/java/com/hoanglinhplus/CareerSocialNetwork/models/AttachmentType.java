package com.hoanglinhplus.CareerSocialNetwork.models;

import lombok.*;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;


@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "attachment_types")
public class AttachmentType {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long attachmentTypeId;
  @Column(unique = true, length = 255)
  private String type;
  @OneToMany(mappedBy = "attachmentType")
  private List<Attachment> attachments;
  private List<Attachment> getAttachments() {
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
      newAttachment.setAttachmentTypes(this);
    }
  }
  public void removeAttachments(Attachment oldAttachment) {
    if (oldAttachment == null)
      return;
    if (this.attachments != null)
      if (this.attachments.contains(oldAttachment))
      {
        this.attachments.remove(oldAttachment);
        oldAttachment.setAttachmentTypes(null);
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
        oldAttachment.setAttachmentTypes(null);
      }
    }
  }

}