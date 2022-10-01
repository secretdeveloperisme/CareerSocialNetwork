package com.hoanglinhplus.CareerSocialNetwork.services;

import com.hoanglinhplus.CareerSocialNetwork.dto.chat.ConversationDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.user.UserIDDTO;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.NotFoundException;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.PermissionDeniedException;
import com.hoanglinhplus.CareerSocialNetwork.mappers.ConversationMapper;
import com.hoanglinhplus.CareerSocialNetwork.models.Conversation;
import com.hoanglinhplus.CareerSocialNetwork.models.Conversation_;
import com.hoanglinhplus.CareerSocialNetwork.models.User;
import com.hoanglinhplus.CareerSocialNetwork.repositories.ConversationRepository;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.ConversationSpecification;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.SearchCriteria;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.SearchOperator;
import com.hoanglinhplus.CareerSocialNetwork.securities.MyUserDetailsService;
import com.hoanglinhplus.CareerSocialNetwork.securities.PermissionService;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public class ConversationService {
  private final ConversationRepository conversationRepository;
  private final MyUserDetailsService myUserDetailsService;
  private final PermissionService permissionService;
  public ConversationService(ConversationRepository conversationRepository, MyUserDetailsService myUserDetailsService, PermissionService permissionService) {
    this.conversationRepository = conversationRepository;
    this.myUserDetailsService = myUserDetailsService;
    this.permissionService = permissionService;
  }
  public Conversation getConversation(Long conversationId) {
    Optional<Conversation> conversationOptional = conversationRepository.findById(conversationId);
    if (conversationOptional.isPresent()) {
      return conversationOptional.get();
    }
    throw new NotFoundException("Conversation not found", conversationId.toString(), "ID");
  }

  public ResponseEntity<ResponseObjectDTO> create(ConversationDTO conversationDTO){
    conversationDTO.setUser(new UserIDDTO(myUserDetailsService.getCurrentUserId()));
    Conversation conversation = ConversationMapper.toEntity(conversationDTO);
    conversation.getParticipants().add(User.builder().userId(myUserDetailsService.getCurrentUserId()).build());
    Conversation savedConversation = conversationRepository.save(conversation);
    ConversationDTO savedConversationDTO = ConversationMapper.toDTO(savedConversation);
    Map<String, Object> responseData = new HashMap<>();
    responseData.put("conversation", savedConversationDTO);
    return ResponseEntity.ok(new ResponseObjectDTO("Create Conversation Successfully ",responseData));
  }

  public ResponseEntity<ResponseObjectDTO> delete(ConversationDTO conversationDTO){
    Conversation conversation = getConversation(conversationDTO.getConversationId());
    if(permissionService.isAdmin() || (permissionService.isUser() && permissionService.isOwnerConversation(conversation))){
      conversationRepository.delete(conversation);
      Map<String, Object> responseData = new HashMap<>();
      responseData.put("deleted conversation", conversationDTO);
      return ResponseEntity.ok(new ResponseObjectDTO("Create Conversation Successfully ",responseData));
    }
    throw new PermissionDeniedException("You don't have permission to delete a conversation");
  }

  public ResponseEntity<ResponseObjectDTO> getAllConversations(){
    List<Conversation> userConversations = conversationRepository.findAll();
    List<ConversationDTO>  userConversationDTOs = userConversations.stream().map(ConversationMapper::toDTO).toList();
    Map<String,Object> responseData = new HashMap<>();
    responseData.put("allConversations", userConversationDTOs);
    return ResponseEntity.ok(new ResponseObjectDTO("Get All Conversations Successfully", responseData));
  }

  public ResponseEntity<ResponseObjectDTO> getConversations(){
    Long currentUserId = myUserDetailsService.getCurrentUserId();
    Specification<Conversation> conversationSpecification = ConversationSpecification
      .joinParticipants(User.builder().userId(currentUserId).build());
    List<Conversation> userConversations = conversationRepository.findAll(conversationSpecification);
    List<ConversationDTO>  userConversationDTOs = userConversations.stream().map(ConversationMapper::toDTO).toList();
    Map<String,Object> responseData = new HashMap<>();
    responseData.put("userConversations", userConversationDTOs);
    return ResponseEntity.ok(new ResponseObjectDTO("Get User Conversations Successfully", responseData));
  }

  public boolean isUserInConversation(User user, Conversation conversation){
    Specification<Conversation> conversationSpecAll = ConversationSpecification.joinParticipants(user);
    SearchCriteria<Conversation, Long> searchIdCriteria = new SearchCriteria<>(
      Conversation_.conversationId, conversation.getConversationId(), SearchOperator.EQUAL);
    ConversationSpecification conversationSpecId = new ConversationSpecification();
    conversationSpecId.getConditions().add(searchIdCriteria);
    conversationSpecAll = conversationSpecAll.and(conversationSpecId);
    List<Conversation> userConversation = conversationRepository.findAll(conversationSpecAll);
    return userConversation.size() > 0;
  }

}
