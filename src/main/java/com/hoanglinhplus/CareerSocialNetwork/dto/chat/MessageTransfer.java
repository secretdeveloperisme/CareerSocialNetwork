package com.hoanglinhplus.CareerSocialNetwork.dto.chat;

import com.hoanglinhplus.CareerSocialNetwork.constants.MessageAction;
import lombok.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class MessageTransfer {
  private MessageDTO message;
  private MessageAction messageAction;
}
