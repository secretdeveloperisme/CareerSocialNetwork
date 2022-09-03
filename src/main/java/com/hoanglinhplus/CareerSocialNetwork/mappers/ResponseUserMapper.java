package com.hoanglinhplus.CareerSocialNetwork.mappers;

import com.hoanglinhplus.CareerSocialNetwork.dto.UserDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Component
public class ResponseUserMapper {
  public static ResponseObjectDTO toDTO(Page<User> userPage){
    List<UserDTO> usersDTO = userPage.getContent().stream().map(UserMapper::toUserDTO).collect(Collectors.toList());
    Map<String, Object> responseData = new HashMap<>();
    responseData.put("users", usersDTO);
    responseData.put("totalPages", userPage.getTotalPages());
    responseData.put("size", userPage.getSize());
    responseData.put("totalElements", userPage.getTotalElements());
    responseData.put("page", userPage.getNumber());
    responseData.put("numberOfElements", userPage.getNumberOfElements());
    return new ResponseObjectDTO("get all users successfully",responseData);
  }
}