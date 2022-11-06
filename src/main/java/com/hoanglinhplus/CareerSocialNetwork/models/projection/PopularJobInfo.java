package com.hoanglinhplus.CareerSocialNetwork.models.projection;

public interface PopularJobInfo extends JobInfo{
  long getNumberOfLikes();
  long getNumberOfApplications();
}
