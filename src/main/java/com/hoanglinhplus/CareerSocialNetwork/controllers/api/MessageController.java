package com.hoanglinhplus.CareerSocialNetwork.controllers.api;


import com.hoanglinhplus.CareerSocialNetwork.dto.PageableDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.chat.MessageDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.services.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/chat/message")
public class MessageController {
  private final MessageService messageService;
  @Autowired
  public MessageController(MessageService messageService) {
    this.messageService = messageService;
  }
  @PostMapping
  public ResponseEntity<ResponseObjectDTO> create(@RequestBody MessageDTO messageDTO){
    return messageService.create(messageDTO);
  }
  @PutMapping
  public ResponseEntity<ResponseObjectDTO> update(@RequestBody MessageDTO messageDTO){
    return messageService.update(messageDTO);
  }
  @DeleteMapping
  @PreAuthorize("hasAnyAuthority('USER')")
  public ResponseEntity<ResponseObjectDTO> delete(@RequestBody MessageDTO messageDTO){
    return messageService.deleteMessage(messageDTO.getMessageId());
  }
  @DeleteMapping("/many")
  @PreAuthorize("hasAuthority('ADMIN')")
  public ResponseEntity<ResponseObjectDTO> deleteMessages(@RequestBody List<Long> ids){
    return messageService.deleteMessages(ids);
  }
  @GetMapping("/get-message-by-conversation")
  public ResponseEntity<ResponseObjectDTO> getMessageByConversation(Long conversationId, PageableDTO pageableDTO){
    return messageService.getMessageByConversation(conversationId ,pageableDTO);
  }
  @GetMapping("/get-all-messages")
  @PreAuthorize("hasAuthority('ADMIN')")
  public ResponseEntity<ResponseObjectDTO> getAllMessages(PageableDTO pageableDTO){
    return messageService.getAllMessages(pageableDTO);
  }
}
