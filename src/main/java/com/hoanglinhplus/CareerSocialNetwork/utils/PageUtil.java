package com.hoanglinhplus.CareerSocialNetwork.utils;

public class PageUtil {
  public static long calculateLastPage(long size, long total){
    if(total % size == 0){
      return total / size;
    }else {
      return (total / size) + 1;
    }
  }
}
