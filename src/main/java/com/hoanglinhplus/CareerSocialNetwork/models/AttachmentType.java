package com.hoanglinhplus.CareerSocialNetwork.models;

import lombok.*;

import javax.persistence.*;
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
  @Column(name = "attachment_type_id")
  private Long attachmentTypeId;
  @Column(unique = true)
  private String type;
  @OneToMany(mappedBy = "attachmentType")
  private List<Attachment> attachments;
}