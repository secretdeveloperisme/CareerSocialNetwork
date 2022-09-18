package com.hoanglinhplus.CareerSocialNetwork.dto.job_action;

import lombok.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class BookmarkDTO {
  Long userId;
  Long jobId;
}