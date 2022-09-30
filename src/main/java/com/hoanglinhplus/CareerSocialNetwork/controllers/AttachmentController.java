package com.hoanglinhplus.CareerSocialNetwork.controllers;

import com.hoanglinhplus.CareerSocialNetwork.dto.chat.AttachmentDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.services.AttachmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/chat/message/attachment")
public class AttachmentController {
  private final AttachmentService attachmentService;
  @Autowired
  public AttachmentController(AttachmentService attachment) {
    this.attachmentService = attachment;
  }
  @PostMapping("/many")
  public ResponseEntity<ResponseObjectDTO> createAttachments(@RequestPart List<MultipartFile> files, Long messageId){
    return attachmentService.create(files,messageId);
  }

  @PostMapping
  public ResponseEntity<ResponseObjectDTO> createAttachment(AttachmentDTO attachmentDTO){
    return attachmentService.create(attachmentDTO);
  }
  @DeleteMapping
  public ResponseEntity<ResponseObjectDTO> delete(AttachmentDTO attachmentDTO) {
    return attachmentService.remove(attachmentDTO);
  }
}
