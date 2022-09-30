package com.hoanglinhplus.CareerSocialNetwork.mappers;

import com.hoanglinhplus.CareerSocialNetwork.dto.chat.MessageDTO;
import com.hoanglinhplus.CareerSocialNetwork.models.Message;
import com.hoanglinhplus.CareerSocialNetwork.models.User;

public class MessageMapper extends ModelMapperConfig{
  public static Message toEntity(MessageDTO messageDTO) {
    Message message = modelMapper.map(messageDTO, Message.class);
    message.setUser(User.builder().userId(messageDTO.getUserId()).build());
    if(messageDTO.getAttachments() != null)
      message.setAttachments(messageDTO.getAttachments().stream().map(AttachmentMapper::toEntity).toList());
    return message;
  }
  public static MessageDTO toDTO(Message message) {
    MessageDTO messageDTO = modelMapper.map(message, MessageDTO.class);
    messageDTO.setUserId(message.getUser().getUserId());
    messageDTO.setAttachments(message.getAttachments().stream().map(AttachmentMapper::toDTO).toList());
    return messageDTO;
  }
}
