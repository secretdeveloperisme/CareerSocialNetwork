package com.hoanglinhplus.CareerSocialNetwork.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil{
  private static final String DATE_FORM = "yyyy/mm/dd";
  private static final SimpleDateFormat dateFormat = new SimpleDateFormat(DATE_FORM);
  public static Date toDateFromString(String dateStr){
    try {
      return dateFormat.parse(dateStr);
    } catch (ParseException e) {
      return null;
    }
  }
}
