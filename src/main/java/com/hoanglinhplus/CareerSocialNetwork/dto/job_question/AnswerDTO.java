package com.hoanglinhplus.CareerSocialNetwork.dto.job_question;


import lombok.*;

import java.util.Date;


@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class AnswerDTO {
  private Long jobQueId;
  private Long userId;
  private String answer;
  private Date createdAt;
}