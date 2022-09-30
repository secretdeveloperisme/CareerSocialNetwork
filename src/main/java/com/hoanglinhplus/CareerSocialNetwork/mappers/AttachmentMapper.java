package com.hoanglinhplus.CareerSocialNetwork.mappers;

import com.hoanglinhplus.CareerSocialNetwork.dto.chat.AttachmentDTO;
import com.hoanglinhplus.CareerSocialNetwork.models.Attachment;
import com.hoanglinhplus.CareerSocialNetwork.models.AttachmentType;

public class AttachmentMapper extends ModelMapperConfig{
  public static Attachment toEntity(AttachmentDTO attachmentDTO) {
    Attachment attachment = modelMapper.map(attachmentDTO, Attachment.class);
    attachment.setAttachmentType(AttachmentType.builder().type(attachmentDTO.getAttachmentType()).build());
    return attachment;
  }
  public static AttachmentDTO toDTO(Attachment message) {
    AttachmentDTO attachmentDTO = modelMapper.map(message, AttachmentDTO.class);
    attachmentDTO.setAttachmentType(message.getAttachmentType().getType());
    return attachmentDTO;
  }
}
