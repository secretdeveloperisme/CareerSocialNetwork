package com.hoanglinhplus.CareerSocialNetwork.dto.chat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;

@NoArgsConstructor
@AllArgsConstructor
@Setter @Getter
public class ParticipantDTO implements Serializable {
  private Long inviteUserId;
  private Long conversationId;
}
