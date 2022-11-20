package com.hoanglinhplus.CareerSocialNetwork.controllers.api;

import com.hoanglinhplus.CareerSocialNetwork.dto.comment.CommentTransfer;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

@Controller
public class CommentSocketController {
  private final SimpMessagingTemplate simpMessagingTemplate;

  public CommentSocketController(SimpMessagingTemplate simpMessagingTemplate) {
    this.simpMessagingTemplate = simpMessagingTemplate;
  }

  @MessageMapping("/comment-socket/{jobId}")
  public void createMessage(@DestinationVariable String jobId, @Payload CommentTransfer commentTransfer) {
    simpMessagingTemplate.convertAndSend("/topic/comment/"+jobId, commentTransfer);
  }

}
