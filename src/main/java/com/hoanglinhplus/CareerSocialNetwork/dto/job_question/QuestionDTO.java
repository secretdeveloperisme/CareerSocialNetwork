package com.hoanglinhplus.CareerSocialNetwork.dto.job_question;

import lombok.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class QuestionDTO {
  private Long questionId;
  private String content;
}
