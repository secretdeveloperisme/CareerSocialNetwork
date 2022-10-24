package com.hoanglinhplus.CareerSocialNetwork.dto.chat;

import com.hoanglinhplus.CareerSocialNetwork.dto.user.UserCreationDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.user.UserIDDTO;
import lombok.*;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter @Setter
public class ConversationDTO implements Serializable {
  private Long conversationId;
  private Date createAt;
  private Date updateAt;
  private Date deleteAt;
  private UserCreationDTO user;
  private List<UserCreationDTO> participants = new ArrayList<>();
  private List<String> usernameParticipants = new ArrayList<>();
}