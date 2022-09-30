package com.hoanglinhplus.CareerSocialNetwork.services;

import com.hoanglinhplus.CareerSocialNetwork.dto.chat.ParticipantDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.models.Conversation;
import com.hoanglinhplus.CareerSocialNetwork.models.User;
import com.hoanglinhplus.CareerSocialNetwork.repositories.UserRepository;
import com.hoanglinhplus.CareerSocialNetwork.securities.MyUserDetailsService;
import com.hoanglinhplus.CareerSocialNetwork.securities.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class ParticipantService {
  private final UserService userService;
  private final ConversationService conversationService;
  private final UserRepository userRepository;
  private final MyUserDetailsService myUserDetailsService;
  private final PermissionService permission;
  @Autowired
  public ParticipantService(UserService userService, ConversationService conversationService, UserRepository userRepository, MyUserDetailsService myUserDetailsService, PermissionService permission) {
    this.userService = userService;
    this.conversationService = conversationService;
    this.userRepository = userRepository;
    this.myUserDetailsService = myUserDetailsService;
    this.permission = permission;
  }
  public ResponseEntity<ResponseObjectDTO> addParticipant(ParticipantDTO participantDTO) {
    Conversation conversation = conversationService.getConversation(participantDTO.getConversationId());
    User user = userService.getUser(participantDTO.getInviteUserId());
    User currentUser = User.builder().userId(myUserDetailsService.getCurrentUserId()).build();
    Map<String, Object> responseData = new HashMap<>();
    if(conversationService.isUserInConversation(currentUser,conversation)) {
      user.getParticipants().add(conversation);
      userRepository.save(user);
      responseData.put("conversationId", conversation.getConversationId());
      responseData.put("userId", user.getUserId());
      return ResponseEntity.ok(new ResponseObjectDTO("Add User to Conversation Successfully", responseData));
    }
    return ResponseEntity.ok(new ResponseObjectDTO("you don't have permission to add User to Conversation",null));
  }

  public ResponseEntity<ResponseObjectDTO> removeParticipant(ParticipantDTO participantDTO) {
    Conversation conversation = conversationService.getConversation(participantDTO.getConversationId());
    User currentUser = userService.getUser(myUserDetailsService.getCurrentUserId());
    Map<String, Object> responseData = new HashMap<>();
    if(conversationService.isUserInConversation(currentUser, conversation)) {
      currentUser.getParticipants().remove(conversation);
      userRepository.save(currentUser);
      responseData.put("conversationId", conversation.getConversationId());
      responseData.put("userId", currentUser.getUserId());
      return ResponseEntity.ok(new ResponseObjectDTO("Remove User to Conversation Successfully", responseData));
    }
    return ResponseEntity.ok(new ResponseObjectDTO("you don't have permission to Remove User to Conversation",null));
  }

}
