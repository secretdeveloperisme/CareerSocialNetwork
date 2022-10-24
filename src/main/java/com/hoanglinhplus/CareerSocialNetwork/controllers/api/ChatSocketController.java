package com.hoanglinhplus.CareerSocialNetwork.controllers.api;

import com.hoanglinhplus.CareerSocialNetwork.dto.chat.MessageTransfer;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

@Controller
public class ChatSocketController {
  private final SimpMessagingTemplate simpMessagingTemplate;

  public ChatSocketController(SimpMessagingTemplate simpMessagingTemplate) {
    this.simpMessagingTemplate = simpMessagingTemplate;
  }


  @MessageMapping("/send-message/{conversationId}")
  public void createMessage(@DestinationVariable String conversationId, @Payload MessageTransfer messageTransfer) {
    simpMessagingTemplate.convertAndSend("/topic/"+conversationId, messageTransfer);
  }

}
