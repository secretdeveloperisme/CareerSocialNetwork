package com.hoanglinhplus.CareerSocialNetwork.dto.chat;

import com.hoanglinhplus.CareerSocialNetwork.constants.MessageType;
import lombok.*;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter @Setter
@ToString
public class MessageDTO implements Serializable {
  private Long messageId;
  private String message;
  private MessageType messageType;
  private Date createdAt;
  private Date updatedAt;
  private List<AttachmentDTO> attachments;
  private ConversationDTO conversation;
  private Long userId;
}