package com.hoanglinhplus.CareerSocialNetwork.controllers.api;

import com.hoanglinhplus.CareerSocialNetwork.dto.chat.MessageDTO;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChatSocketController {
  private final SimpMessagingTemplate simpMessagingTemplate;

  public ChatSocketController(SimpMessagingTemplate simpMessagingTemplate) {
    this.simpMessagingTemplate = simpMessagingTemplate;
  }


  @MessageMapping("/send-message/{conversationId}")
  public void createMessage(@DestinationVariable String conversationId, MessageDTO messageDTO) {
    System.out.println(messageDTO.toString());
    simpMessagingTemplate.convertAndSend("/topic/"+conversationId, messageDTO);
  }

  @GetMapping("/chat")
  public String chat(){
    return "chat/chat";
  }
}
