package com.hoanglinhplus.CareerSocialNetwork.filters;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.hoanglinhplus.CareerSocialNetwork.securities.MyUser;
import com.hoanglinhplus.CareerSocialNetwork.utils.JWTUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Slf4j
public class AuthenticationFilter extends UsernamePasswordAuthenticationFilter {

  private final JWTUtil jwtUtil = new JWTUtil();
  private final AuthenticationManager authenticationManager;

  public AuthenticationFilter(AuthenticationManager authenticationManager) {
    this.authenticationManager = authenticationManager;
  }

  @Override
  public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) throws AuthenticationException {
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken =
      new UsernamePasswordAuthenticationToken(username, password);
    return authenticationManager.authenticate(usernamePasswordAuthenticationToken);
  }

  @Override
  protected void successfulAuthentication(HttpServletRequest request, HttpServletResponse response, FilterChain chain, Authentication authResult) throws IOException, ServletException {
    String accessToken = jwtUtil.generateToken((MyUser) authResult.getPrincipal(), 0);
    String refreshToken = jwtUtil.generateToken((MyUser) authResult.getPrincipal(), 1);
    Cookie accessTokenCookie = new Cookie("accessToken", accessToken);
    Cookie refreshTokenCookie = new Cookie("refreshToken", refreshToken);
    accessTokenCookie.setHttpOnly(true);
    refreshTokenCookie.setHttpOnly(true);
    accessTokenCookie.setMaxAge(24*60*60*1000*7);
    refreshTokenCookie.setMaxAge(24*60*60*1000*7);
    accessTokenCookie.setPath("/");
    refreshTokenCookie.setPath("/");
    response.addCookie(accessTokenCookie);
    response.addCookie(refreshTokenCookie);
    Map<String, String> responseMap = new HashMap<>();
    responseMap.put("accessToken", accessToken);
    responseMap.put("refreshToken", refreshToken);
    response.setContentType(MediaType.APPLICATION_JSON_VALUE);
    response.getWriter().write(new ObjectMapper().writeValueAsString(responseMap));
  }
}