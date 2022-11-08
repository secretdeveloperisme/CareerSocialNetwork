package com.hoanglinhplus.CareerSocialNetwork.mappers;

import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseDataDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.user.UserDTO;
import com.hoanglinhplus.CareerSocialNetwork.models.User;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class ResponseUserMapper {
  public static ResponseDataDTO<UserDTO> toDTO(Page<User> userPage){
    List<UserDTO> usersDTO = userPage.getContent().stream().map(UserMapper::toDTO).collect(Collectors.toList());
    return new ResponseDataDTO<>("Get All Users Successfully"
      ,usersDTO, (long) userPage.getTotalPages(), userPage.getTotalElements() );
  }
}