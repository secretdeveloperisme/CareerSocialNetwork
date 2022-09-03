package com.hoanglinhplus.CareerSocialNetwork.utils;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

public class PasswordUtil {
  private final PasswordEncoder passwordEncoder;
  private static PasswordUtil passwordUtil;

  public PasswordUtil() {
    this.passwordEncoder = new BCryptPasswordEncoder(BCryptPasswordEncoder.BCryptVersion.$2A);
  }

  public static PasswordUtil getInstance(){
    if(passwordUtil == null)
      return new PasswordUtil();
    else
      return passwordUtil;
  }

  public String hashPassword(String password){
    return passwordEncoder.encode(password);
  }
  public boolean checkPassword(String password, String hashPassword){
    return passwordEncoder.matches(password, hashPassword);
  }
}