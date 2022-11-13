package com.hoanglinhplus.CareerSocialNetwork.dto.chat;

import com.hoanglinhplus.CareerSocialNetwork.dto.user.UserCreationDTO;
import lombok.*;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.function.LongUnaryOperator;


@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter @Setter
public class FilterConversationDTO implements Serializable {
  private Long createUserId;
  private List<Long> participantId = new ArrayList<>();
}