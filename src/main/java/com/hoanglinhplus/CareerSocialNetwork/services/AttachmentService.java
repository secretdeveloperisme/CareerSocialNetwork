package com.hoanglinhplus.CareerSocialNetwork.services;

import com.hoanglinhplus.CareerSocialNetwork.dto.chat.AttachmentDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.NotFoundException;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.PermissionDeniedException;
import com.hoanglinhplus.CareerSocialNetwork.mappers.AttachmentMapper;
import com.hoanglinhplus.CareerSocialNetwork.models.*;
import com.hoanglinhplus.CareerSocialNetwork.repositories.AttachmentRepository;
import com.hoanglinhplus.CareerSocialNetwork.securities.MyUserDetailsService;
import com.hoanglinhplus.CareerSocialNetwork.securities.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public class AttachmentService {
  private final AttachmentRepository attachmentRepository;
  private final MessageService messageService;
  private final FileService fileService;
  private final AttachmentTypeService attachmentTypeService;
  private final PermissionService permissionService;
  private final ConversationService conversationService;
  private final MyUserDetailsService myUserDetailsService;
  @Autowired
  public AttachmentService(AttachmentRepository attachmentRepository, MessageService messageService, FileService fileService, AttachmentTypeService attachmentTypeService, PermissionService permissionService, ConversationService conversationService, MyUserDetailsService myUserDetailsService) {
    this.attachmentRepository = attachmentRepository;
    this.messageService = messageService;
    this.fileService = fileService;
    this.attachmentTypeService = attachmentTypeService;
    this.permissionService = permissionService;
    this.conversationService = conversationService;
    this.myUserDetailsService = myUserDetailsService;
  }
  public Attachment getAttachment(Long attachmentId) {
    Optional<Attachment> attachmentOptional = attachmentRepository.findById(attachmentId);
    if(attachmentOptional.isPresent()) {
      return attachmentOptional.get();
    }
    throw new NotFoundException("Attachment not found", attachmentId.toString(), "ID");
  }
  public ResponseEntity<ResponseObjectDTO> create(List<MultipartFile> files, Long messageId){
    Message message = messageService.getMessage(messageId);
    if(permissionService.isOwnerMessage(message)){
      List<FileInfo> fileInfos = fileService.processUploadFile(files);
      List<Attachment> attachments = fileInfos.stream().map(fileInfo ->
        {
          AttachmentType attachmentType = attachmentTypeService.create(fileInfo.getMimeType());
          return Attachment.builder().message(message).attachmentUrl(
            fileInfo.getFilePath()).attachmentType(attachmentType).build();
        }
      ).toList();
      List<Attachment> savedAttachments = attachmentRepository.saveAll(attachments);
      List<AttachmentDTO> savedAttachmentDTOs = savedAttachments.stream().map(AttachmentMapper::toDTO).toList();
      Map<String, Object> responseData = new HashMap<>();
      responseData.put("attachments", savedAttachmentDTOs);
      return ResponseEntity.ok(new ResponseObjectDTO("Create attachment successfully", responseData));
    }
    throw new PermissionDeniedException("You are not allowed to create attachments.");
  }
  public ResponseEntity<ResponseObjectDTO> create(AttachmentDTO attachmentDTO){
    Attachment attachment = AttachmentMapper.toEntity(attachmentDTO);
    Attachment savedAttachment = attachmentRepository.save(attachment);
    AttachmentDTO savedAttachmentDTO = AttachmentMapper.toDTO(savedAttachment);
    Map<String, Object> responseData = new HashMap<>();
    responseData.put("attachment", savedAttachmentDTO);
    return ResponseEntity.ok(new ResponseObjectDTO("Create attachment successfully", responseData));
  }

  public ResponseEntity<ResponseObjectDTO> remove(AttachmentDTO attachmentDTO){
    Attachment attachment = getAttachment(attachmentDTO.getAttachmentId());
    if(permissionService.isOwnerMessage(attachment.getMessage())){
      Map<String, Object> responseData = new HashMap<>();
      attachmentRepository.delete(attachment);
      responseData.put("deletedAttachment", attachmentDTO);
      return ResponseEntity.ok(new ResponseObjectDTO("Remove attachment successfully", responseData));
    }
    throw new PermissionDeniedException("You are not allowed to remove a message attachment.");
  }

  public ResponseEntity<ResponseObjectDTO> getAttachmentsByMessage(Long messageId){
    Message message = messageService.getMessage(messageId);
    User user  = User.builder().userId(myUserDetailsService.getCurrentUserId()).build();
    if(conversationService.isUserInConversation(user, message.getConversation())){
      List<Attachment> attachments =  message.getAttachments();
      List<AttachmentDTO> attachmentDTOS = attachments.stream().map(AttachmentMapper::toDTO).toList();
      Map<String, Object> responseData = new HashMap<>();
      responseData.put("attachments", attachmentDTOS);
      return ResponseEntity.ok(new ResponseObjectDTO("Get Attachments By Messages Successfully", responseData));
    }
    throw new PermissionDeniedException("You  are not allowed to get attachments. Because you are not in conversation");
  }
}
