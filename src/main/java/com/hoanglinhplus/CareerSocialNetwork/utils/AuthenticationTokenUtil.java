package com.hoanglinhplus.CareerSocialNetwork.utils;

import com.auth0.jwt.interfaces.DecodedJWT;
import com.hoanglinhplus.CareerSocialNetwork.utils.JWTUtil;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Component;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Component
public class AuthenticationTokenUtil {
  public Map<String, Object> getPrincipalFromToken(HttpServletRequest request) {
    String authorizationHeader = request.getHeader(HttpHeaders.AUTHORIZATION);
    String token = null;
    Cookie[] cookies = request.getCookies();
    if(cookies != null) {
      for (Cookie cookie : cookies) {
        if(cookie.getName().equals("accessToken")){
          token = cookie.getValue();
        }
      }
    }
    if(authorizationHeader != null && authorizationHeader.startsWith("Bearer ")){
      token = authorizationHeader.substring("Bearer ".length());
    }
    if(token != null){
      try{
        DecodedJWT decodedJWT = JWTUtil.getInstance().decodeToken(token);
        return decodedJWT.getClaim("principal").asMap();
      }catch (Exception e){
        return null;
      }
    }
    else {
      return null;
    }
  }
}
