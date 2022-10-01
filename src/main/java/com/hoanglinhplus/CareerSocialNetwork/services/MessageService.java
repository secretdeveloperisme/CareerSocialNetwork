package com.hoanglinhplus.CareerSocialNetwork.services;

import com.hoanglinhplus.CareerSocialNetwork.dto.PageableDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.chat.MessageDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.InputNotValidException;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.NotFoundException;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.PermissionDeniedException;
import com.hoanglinhplus.CareerSocialNetwork.mappers.MessageMapper;
import com.hoanglinhplus.CareerSocialNetwork.mappers.ResponseMessageMapper;
import com.hoanglinhplus.CareerSocialNetwork.models.Conversation;
import com.hoanglinhplus.CareerSocialNetwork.models.Message;
import com.hoanglinhplus.CareerSocialNetwork.models.Message_;
import com.hoanglinhplus.CareerSocialNetwork.models.User;
import com.hoanglinhplus.CareerSocialNetwork.repositories.MessageRepository;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.MessageSpecification;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.SearchCriteria;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.SearchOperator;
import com.hoanglinhplus.CareerSocialNetwork.securities.MyUserDetailsService;
import com.hoanglinhplus.CareerSocialNetwork.securities.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.*;

@Service
public class MessageService {
  private final MessageRepository messageRepository;
  private final MyUserDetailsService myUserDetailsService;
  private final ConversationService conversationService;
  private final PermissionService permissionService;

  @Autowired
  public MessageService(MessageRepository messageRepository, MyUserDetailsService myUserDetailsService, ConversationService conversationService, PermissionService permissionService) {
    this.messageRepository = messageRepository;
    this.myUserDetailsService = myUserDetailsService;
    this.conversationService = conversationService;
    this.permissionService = permissionService;
  }

  public Message getMessage(Long messageId) {
    Optional<Message> message = messageRepository.findById(messageId);
    if (message.isPresent()) {
      return message.get();
    }
    throw new NotFoundException("Message not found", messageId.toString(), "ID");
  }
  public ResponseEntity<ResponseObjectDTO> getMessageByConversation(Long conversationId, PageableDTO pageableDTO){
    Conversation conversation = conversationService.getConversation(conversationId);
    User user = User.builder().userId(myUserDetailsService.getCurrentUserId()).build();
    if(conversationService.isUserInConversation(user, conversation)){
      SearchCriteria<Message, Conversation> searchCriteria = new SearchCriteria<>(Message_.conversation, conversation, SearchOperator.EQUAL);
      MessageSpecification messageSpecification = new MessageSpecification();
      messageSpecification.getConditions().add(searchCriteria);
      PageRequest pageRequest =PageRequest.of(pageableDTO.getPage()
        , pageableDTO.getSize(), Sort.by(Sort.Order.by("createdAt").with(Sort.Direction.ASC)));
      Page<Message> messagePage = messageRepository.findAll(messageSpecification,pageRequest);
      ResponseObjectDTO responseObjectDTO = ResponseMessageMapper.toDTO(messagePage);
      return ResponseEntity.ok(responseObjectDTO);
    }
    return ResponseEntity.status(HttpStatus.FORBIDDEN).body(new ResponseObjectDTO("You are not in conversation", null));
  }
  public ResponseEntity<ResponseObjectDTO> getAllMessages(PageableDTO pageableDTO){
    List<Message> messages = messageRepository.findAll();
    List<MessageDTO> messageDTOS = messages.stream().map(MessageMapper::toDTO).toList();
    PageRequest pageRequest =PageRequest.of(pageableDTO.getPage()
      , pageableDTO.getSize(), Sort.by(Sort.Order.by("createdAt").with(Sort.Direction.ASC)));
    Page<Message> messagePage = messageRepository.findAll(pageRequest);
    ResponseObjectDTO responseObjectDTO = ResponseMessageMapper.toDTO(messagePage);
    return ResponseEntity.ok(responseObjectDTO);
  }
  public ResponseEntity<ResponseObjectDTO> create(MessageDTO messageDTO) {
    Long currentUserId = myUserDetailsService.getCurrentUserId();
    messageDTO.setUserId(currentUserId);
    Message message = MessageMapper.toEntity(messageDTO);
    if (permissionService.isAdmin() || conversationService.isUserInConversation(message.getUser(), message.getConversation())){
      Message savedMessage = messageRepository.save(message);
      MessageDTO savedMessageDTO = MessageMapper.toDTO(savedMessage);
      Map<String, Object> responseData = new HashMap<>();
      responseData.put("message", savedMessageDTO);
      return ResponseEntity.ok(new ResponseObjectDTO("Create Message Successfully", responseData));
    }
    throw new PermissionDeniedException("You are not allowed to create messages because you are not in this conversation");


  }

  public ResponseEntity<ResponseObjectDTO> update(MessageDTO messageDTO){
    Message message = getMessage(messageDTO.getMessageId());
    if(permissionService.isOwnerMessage(message)){
      if(messageDTO.getMessage() != null ){
        message.setMessage(messageDTO.getMessage());
      }
      if(messageDTO.getMessageType() != null ){
        message.setMessageType(messageDTO.getMessageType());
      }
      Message updatedMessage = messageRepository.save(message);
      MessageDTO updatedMessageDTO = MessageMapper.toDTO(updatedMessage);
      Map<String, Object> responseData = new HashMap<>();
      responseData.put("message", updatedMessageDTO);
      return ResponseEntity.ok(new ResponseObjectDTO("Updated Message Successfully", responseData));
    }
    throw new PermissionDeniedException("You are not allowed to modify this message.");
  }
  public ResponseEntity<ResponseObjectDTO> remove(MessageDTO messageDTO){
    Message message = getMessage(messageDTO.getMessageId());
    if(permissionService.isOwnerMessage(message)){
      Map<String, Object> responseData = new HashMap<>();
      messageRepository.delete(message);
      responseData.put("removedMessage", messageDTO);
      return ResponseEntity.ok(new ResponseObjectDTO("Remove message successfully", responseData));
    }
    throw new PermissionDeniedException("You are not allowed to delete a message.");
  }

  @Transactional
  public ResponseEntity<ResponseObjectDTO> deleteMessages(List<Long> ids) {
    List<Long> notExistIds = new ArrayList<>();
    List<Long> existedIds = messageRepository.findExistedIds(ids);
    ids.forEach(id->{
      if(!existedIds.contains(id))
        notExistIds.add(id);
    });
    if(notExistIds.size() == 0){
      ids.forEach(this::deleteMessageById);
      Map<String, Object> responseData = new HashMap<>();
      responseData.put("deletedIds", ids);
      ResponseObjectDTO responseObjectDTO = new ResponseObjectDTO(
        "delete messages successfully "
        ,responseData);
      return ResponseEntity.ok(responseObjectDTO);
    }
    else{
      InputNotValidException inputNotValidException = new InputNotValidException("some ids is not found");
      inputNotValidException.getCauses().put("invalidIds", notExistIds);
      throw inputNotValidException;
    }
  }
  public ResponseEntity<ResponseObjectDTO> deleteMessage(Long id){
    Message message = getMessage(id);
    Map<String, Object> responseData = new HashMap<>();
    if(permissionService.isOwnerMessage(message)){
      responseData.put("deletedId", message.getMessageId());
      return ResponseEntity.ok(new ResponseObjectDTO("Remove message successfully", responseData));
    }
    return ResponseEntity.status(HttpStatus.FORBIDDEN).body(new ResponseObjectDTO("You do not have permission to remove this message", null));
  }
  public void deleteMessageById(Long id) {
    Message message = getMessage(id);
    messageRepository.delete(message);
  }
}
