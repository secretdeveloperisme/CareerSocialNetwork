package com.hoanglinhplus.CareerSocialNetwork.dto.stastistic;

import lombok.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class AdminStatistics {
  long amountOfCompanies;
  long amountOfJobs;
  long amountOfUsers;
  long amountOfPosts;
  long amountOfTags;
}
