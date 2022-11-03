package com.hoanglinhplus.CareerSocialNetwork.dto.stastistic;

import lombok.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class MeStatistics {
  long amountOfCompanies;
  long amountOfDeletedCompanies;
  long amountOfFollowedCompanies;
  long amountOfFollowedUsers;
  long amountOfFollowedTags;
  long amountOfApplications;
  long amountOfPosts;
}
