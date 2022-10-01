package com.hoanglinhplus.CareerSocialNetwork.controllers;

import com.hoanglinhplus.CareerSocialNetwork.dto.chat.ConversationDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.services.ConversationService;
import lombok.Builder;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.Null;

@RestController
@RequestMapping("/chat/conversation")
public class ConversationController {
  private final ConversationService conversationService;

  public ConversationController(ConversationService conversationService) {
    this.conversationService = conversationService;
  }
  @GetMapping("/get-user-conversations")
  @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
  public ResponseEntity<ResponseObjectDTO> getConversations (){
    return conversationService.getConversations();
  }
  @GetMapping("/get-all-conversations")
  @PreAuthorize("hasAuthority('ADMIN')")
  public ResponseEntity<ResponseObjectDTO> getAllConversations (){
    return conversationService.getAllConversations();
  }

  @PostMapping
  public ResponseEntity<ResponseObjectDTO> createConversation(@RequestBody ConversationDTO conversationDTO){
    return conversationService.create(conversationDTO);
  }
  @DeleteMapping
  public ResponseEntity<ResponseObjectDTO> deleteConversation(@RequestBody ConversationDTO conversationDTO){
    return conversationService.delete(conversationDTO);
  }
}
