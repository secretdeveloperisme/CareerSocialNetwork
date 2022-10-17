package com.hoanglinhplus.CareerSocialNetwork.services;

import com.auth0.jwt.interfaces.DecodedJWT;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseErrorDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.PermissionDeniedException;
import com.hoanglinhplus.CareerSocialNetwork.securities.MyUser;
import com.hoanglinhplus.CareerSocialNetwork.securities.MyUserDetailsService;
import com.hoanglinhplus.CareerSocialNetwork.utils.JWTUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class AuthService {
  private final MyUserDetailsService myUserDetailsService;
  private final JWTUtil jwtUtil = new JWTUtil();

  @Autowired
  public AuthService(MyUserDetailsService myUserDetailsService) {
    this.myUserDetailsService = myUserDetailsService;
  }

  public ResponseEntity<Object> refreshToken(String authorizationHeader){
    if(authorizationHeader != null && authorizationHeader.startsWith("Bearer ")){
      String token = authorizationHeader.substring("Bearer ".length());
      try{
        DecodedJWT decodedJWT = JWTUtil.getInstance().decodeToken(token);
        Map<String, Object> principal = decodedJWT.getClaim("principal").asMap();
        List<String> roles = (List<String>) principal.get("roles");
        MyUser myUser
          = new MyUser(
          (Long) principal.get("userId"),
          decodedJWT.getSubject()
          , ""
          , roles.stream().map(SimpleGrantedAuthority::new
        ).collect(Collectors.toList()));
        String accessToken = jwtUtil.generateToken(myUser , 0);
        String refreshToken = jwtUtil.generateToken(myUser, 1);
        Map<String, String> responseMap = new HashMap<>();
        responseMap.put("accessToken", accessToken);
        responseMap.put("refreshToken", refreshToken);
        return ResponseEntity.ok(responseMap);
      }catch (Exception e){
        HashMap<String, Object> errors = new HashMap<>();
        ResponseErrorDTO responseErrorDTO = new ResponseErrorDTO("Token is not valid",errors);
        responseErrorDTO.getErrors().put("cause", e.getMessage());
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(responseErrorDTO);
      }
    }
    else {
      ResponseErrorDTO responseErrorDTO = new ResponseErrorDTO("Authentication header is not valid", null);
      return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(responseErrorDTO);
    }
  }
  public void checkPermission(Long targetUserId){
    Long currentUserId = myUserDetailsService.getCurrentUserId();
    if(!(currentUserId.longValue() == targetUserId.longValue()))
      throw new PermissionDeniedException("You don't have permission");
  }
  public ResponseEntity<ResponseObjectDTO> logout(HttpServletResponse response){
    Cookie accessToken = new Cookie("accessToken", null);
    accessToken.setPath("/");
    accessToken.setHttpOnly(true);
    accessToken.setMaxAge(0);
    response.addCookie(accessToken);
    Cookie refreshToken = new Cookie("refreshToken", null);
    refreshToken.setPath("/");
    refreshToken.setHttpOnly(true);
    refreshToken.setMaxAge(0);
    response.addCookie(refreshToken);
    return ResponseEntity.ok(new ResponseObjectDTO("Logout successfully !", null));
  }
}

