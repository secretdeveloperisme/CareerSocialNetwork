package com.hoanglinhplus.CareerSocialNetwork.utils;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.hoanglinhplus.CareerSocialNetwork.securities.MyUser;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.HashMap;
import java.util.stream.Collectors;

@Component
public class JWTUtil {
  public static JWTUtil jwtUtil;
  public static JWTUtil getInstance(){
    return (jwtUtil == null)?new JWTUtil():jwtUtil;
  }
  private final String secretKey = "hoanglinh";
  private final Algorithm algorithm = Algorithm.HMAC256(secretKey.getBytes());

  public String generateToken (MyUser myUserDetails, int type){
    long expiredAccessToken =1000*60*60*24*3;
    long expiredRefreshToken = 1000*60*60*24*30L;
    Date expiredDate = type == 0 ?new Date(System.currentTimeMillis() + expiredAccessToken)
      :new Date(System.currentTimeMillis() + expiredRefreshToken);
    HashMap<String, Object> principal = new HashMap<>();
    principal.put("userId", myUserDetails.getUserId());
    principal.put("roles",myUserDetails.getAuthorities().stream().map(GrantedAuthority::getAuthority).collect(Collectors.toList()));
    String token = JWT.create().withSubject(myUserDetails.getUsername())
      .withIssuer("/auth/login").withExpiresAt(expiredDate)
      .withClaim("principal",principal)
      .sign(algorithm);
    return token;
  }
  public DecodedJWT decodeToken(String token){
    JWTVerifier jwtVerifier = JWT.require(algorithm).build();
    return jwtVerifier.verify(token);
  }
}