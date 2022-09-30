package com.hoanglinhplus.CareerSocialNetwork.services;

import com.hoanglinhplus.CareerSocialNetwork.exceptions.NotFoundException;
import com.hoanglinhplus.CareerSocialNetwork.models.Attachment;
import com.hoanglinhplus.CareerSocialNetwork.models.AttachmentType;
import com.hoanglinhplus.CareerSocialNetwork.repositories.AttachmentTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class AttachmentTypeService {
  private final AttachmentTypeRepository attachmentTypeRepository;

  @Autowired
  public AttachmentTypeService(AttachmentTypeRepository attachmentTypeRepository) {
    this.attachmentTypeRepository = attachmentTypeRepository;
  }

  public AttachmentType getAttachmentType(String type) {
    Optional<AttachmentType> attachmentTypeOptional = attachmentTypeRepository.findAttachmentTypeByType(type);
    return attachmentTypeOptional.orElse(null);
  }

  public AttachmentType create(String type){
    AttachmentType attachmentType = getAttachmentType(type);
    if(attachmentType != null){
      return attachmentType;
    }
    attachmentType = attachmentTypeRepository.save(AttachmentType.builder().type(type).build());
    return attachmentType;
  }
}
