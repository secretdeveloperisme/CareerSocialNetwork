package com.hoanglinhplus.CareerSocialNetwork.securities;

import java.util.ArrayList;
import java.util.List;


public class AllowedRequests {
  private static final List<RequestInfo> allowedRequests = new ArrayList<>();

  static{
    init();;
  }
  private static void init() {
    allowedRequests.add(new RequestInfo("POST", "/api/auth/login"));
    allowedRequests.add(new RequestInfo("POST", "/api/auth/refresh-token"));
    allowedRequests.add(new RequestInfo("POST", "/api/user"));
    allowedRequests.add(new RequestInfo("GET","/api/file"));
    allowedRequests.add(new RequestInfo("POST","/api/file/upload"));
    allowedRequests.add(new RequestInfo("GET","/api/job/get-all-jobs"));
  }
  public static boolean isAllowed(RequestInfo targetRequestInfo) {
    return allowedRequests.stream().anyMatch(allowedRequests->allowedRequests.equals(targetRequestInfo));
  }
}
