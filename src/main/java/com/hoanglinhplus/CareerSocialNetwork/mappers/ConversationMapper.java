package com.hoanglinhplus.CareerSocialNetwork.mappers;

import com.hoanglinhplus.CareerSocialNetwork.dto.chat.ConversationDTO;
import com.hoanglinhplus.CareerSocialNetwork.models.Conversation;
import com.hoanglinhplus.CareerSocialNetwork.models.User;

public class ConversationMapper extends ModelMapperConfig{
  public static Conversation toEntity(ConversationDTO conversationDTO){
    Conversation conversation = modelMapper.map(conversationDTO, Conversation.class);
    return conversation;
  }

  public static ConversationDTO toDTO(Conversation conversation){
    ConversationDTO conversationDTO = modelMapper.map(conversation, ConversationDTO.class);
    conversationDTO.setUsernameParticipants(conversation.getParticipants().stream().map(User::getUsername).toList());
    return conversationDTO;
  }
}
