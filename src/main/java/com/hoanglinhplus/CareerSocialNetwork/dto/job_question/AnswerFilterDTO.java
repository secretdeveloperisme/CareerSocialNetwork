package com.hoanglinhplus.CareerSocialNetwork.dto.job_question;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class AnswerFilterDTO {
  private Long jobId;
  private Long userId;
}
