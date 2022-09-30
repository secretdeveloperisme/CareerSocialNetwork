package com.hoanglinhplus.CareerSocialNetwork.dto.chat;

import lombok.*;

import java.io.Serializable;


@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter @Setter
public class AttachmentDTO implements Serializable {
  private Long attachmentId;
  private String attachmentUrl;
  private String attachmentType;
}