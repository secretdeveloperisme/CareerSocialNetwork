package com.hoanglinhplus.CareerSocialNetwork.dto.job_question;

import lombok.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class JobQuestionDTO {
  private Long jobQueId;
  private Long jobId;
  private QuestionDTO question;
}
