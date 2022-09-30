package com.hoanglinhplus.CareerSocialNetwork.services;

import com.hoanglinhplus.CareerSocialNetwork.dto.chat.AttachmentDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.mappers.AttachmentMapper;
import com.hoanglinhplus.CareerSocialNetwork.models.Attachment;
import com.hoanglinhplus.CareerSocialNetwork.models.AttachmentType;
import com.hoanglinhplus.CareerSocialNetwork.models.FileInfo;
import com.hoanglinhplus.CareerSocialNetwork.models.Message;
import com.hoanglinhplus.CareerSocialNetwork.repositories.AttachmentRepository;
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
  @Autowired
  public AttachmentService(AttachmentRepository attachmentRepository, MessageService messageService, FileService fileService, AttachmentTypeService attachmentTypeService) {
    this.attachmentRepository = attachmentRepository;
    this.messageService = messageService;
    this.fileService = fileService;
    this.attachmentTypeService = attachmentTypeService;
  }

  public ResponseEntity<ResponseObjectDTO> create(List<MultipartFile> files, Long messageId){
    Message message = messageService.getMessage(messageId);
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
  public ResponseEntity<ResponseObjectDTO> create(AttachmentDTO attachmentDTO){
    Attachment attachment = AttachmentMapper.toEntity(attachmentDTO);
    Attachment savedAttachment = attachmentRepository.save(attachment);
    AttachmentDTO savedAttachmentDTO = AttachmentMapper.toDTO(savedAttachment);
    Map<String, Object> responseData = new HashMap<>();
    responseData.put("attachment", savedAttachmentDTO);
    return ResponseEntity.ok(new ResponseObjectDTO("Create attachment successfully", responseData));
  }

  public ResponseEntity<ResponseObjectDTO> remove(AttachmentDTO attachmentDTO){
    Optional<Attachment> attachmentOptional = attachmentRepository.findById(attachmentDTO.getAttachmentId());
    Map<String, Object> responseData = new HashMap<>();
    if(attachmentOptional.isPresent()) {
      attachmentRepository.delete(attachmentOptional.get());
      responseData.put("deletedAttachment", attachmentDTO);
      return ResponseEntity.ok(new ResponseObjectDTO("Remove attachment successfully", responseData));
    }
    return ResponseEntity.ok(new ResponseObjectDTO("Remove attachment failed", responseData));
  }

  public ResponseEntity<ResponseObjectDTO> getAttachmentsByMessage(Long messageId){
    Message message = messageService.getMessage(messageId);
    List<Attachment> attachments =  message.getAttachments();
    List<AttachmentDTO> attachmentDTOS = attachments.stream().map(AttachmentMapper::toDTO).toList();
    Map<String, Object> responseData = new HashMap<>();
    responseData.put("attachments", attachmentDTOS);
    return ResponseEntity.ok(new ResponseObjectDTO("Get Attachments By Messages Successfully", responseData));
  }
}
