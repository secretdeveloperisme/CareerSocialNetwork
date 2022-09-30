package com.hoanglinhplus.CareerSocialNetwork.mappers;

import com.hoanglinhplus.CareerSocialNetwork.dto.chat.MessageDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.models.Message;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Component
public class ResponseMessageMapper {
  public static ResponseObjectDTO toDTO(Page<Message> messagePage){
    List<MessageDTO> usersDTO = messagePage.getContent().stream().map(MessageMapper::toDTO).collect(Collectors.toList());
    Map<String, Object> responseData = new HashMap<>();
    responseData.put("message", usersDTO);
    responseData.put("totalPages", messagePage.getTotalPages());
    responseData.put("size", messagePage.getSize());
    responseData.put("totalElements", messagePage.getTotalElements());
    responseData.put("page", messagePage.getNumber());
    responseData.put("numberOfElements", messagePage.getNumberOfElements());
    return new ResponseObjectDTO("get all message successfully",responseData);
  }
}