package com.hoanglinhplus.CareerSocialNetwork.utils;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.stream.Collectors;

@Component
public class JWTUtil {
  public static JWTUtil jwtUtil;
  public static JWTUtil getInstance(){
    return (jwtUtil == null)?new JWTUtil():jwtUtil;
  }
  private final String secretKey = "hoanglinh";
  private final Algorithm algorithm = Algorithm.HMAC256(secretKey.getBytes());

  public String generateToken (UserDetails userDetails, int type){
    long expiredAccessToken =1000*60*60*24*3;
    long expiredRefreshToken = 1000*60*60*24*15;
    Date expiredDate = type == 0 ?new Date(System.currentTimeMillis() + expiredAccessToken)
      :new Date(System.currentTimeMillis() + expiredRefreshToken);
    String token = JWT.create().withSubject(userDetails.getUsername())
      .withIssuer("/auth/login").withExpiresAt(expiredDate)
      .withClaim("roles", userDetails.getAuthorities().stream().map(GrantedAuthority::getAuthority).collect(Collectors.toList()))
      .sign(algorithm);
    return token;
  }
  public DecodedJWT decodeToken(String token){
    JWTVerifier jwtVerifier = JWT.require(algorithm).build();
    return jwtVerifier.verify(token);
  }
}