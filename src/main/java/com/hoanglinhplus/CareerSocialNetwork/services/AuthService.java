package com.hoanglinhplus.CareerSocialNetwork.services;

import com.auth0.jwt.interfaces.DecodedJWT;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseErrorDTO;
import com.hoanglinhplus.CareerSocialNetwork.utils.JWTUtil;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class AuthService {
  private final JWTUtil jwtUtil = new JWTUtil();
  public ResponseEntity<Object> refreshToken(String authorizationHeader){
    if(authorizationHeader != null && authorizationHeader.startsWith("Bearer ")){
      String token = authorizationHeader.substring("Bearer ".length());
      try{
        DecodedJWT decodedJWT = JWTUtil.getInstance().decodeToken(token);
        UserDetails userDetails
          = new User(
          decodedJWT.getSubject()
          , ""
          , decodedJWT.getClaim("roles").asList(String.class).stream().map(SimpleGrantedAuthority::new
        ).collect(Collectors.toList()));
        String accessToken = jwtUtil.generateToken(userDetails , 0);
        String refreshToken = jwtUtil.generateToken(userDetails, 1);
        Map<String, String> responseMap = new HashMap<>();
        responseMap.put("accessToken", accessToken);
        responseMap.put("refreshToken", refreshToken);
        return ResponseEntity.ok(responseMap);
      }catch (Exception e){
        ResponseErrorDTO responseErrorDTO = new ResponseErrorDTO("Token is not valid", new HashMap<>());
        responseErrorDTO.getErrors().put("cause", e.getMessage());
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(responseErrorDTO);
      }
    }
    else {
      ResponseErrorDTO responseErrorDTO = new ResponseErrorDTO("Authentication header is not valid", null);
      return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(responseErrorDTO);
    }
  }
}

