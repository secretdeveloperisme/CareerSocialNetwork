package com.hoanglinhplus.CareerSocialNetwork.controllers.api;

import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.services.AuthService;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@RestController
@RequestMapping("/api/auth")
public class AuthController {
  final AuthService authService;

  public AuthController(AuthService authService) {
    this.authService = authService;
  }

  @PostMapping("/refresh-token")
  public ResponseEntity<Object> getAccessFromRefreshToken(HttpServletRequest request){
    return authService.refreshToken(request.getHeader(HttpHeaders.AUTHORIZATION));
  }
  @PostMapping("/logout")
  public ResponseEntity<ResponseObjectDTO> logout(HttpServletResponse response){
    return authService.logout(response);
  }
}
