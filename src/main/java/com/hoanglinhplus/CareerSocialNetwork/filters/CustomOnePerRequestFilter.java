package com.hoanglinhplus.CareerSocialNetwork.filters;

import com.auth0.jwt.interfaces.DecodedJWT;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseErrorDTO;
import com.hoanglinhplus.CareerSocialNetwork.securities.AllowedRequests;
import com.hoanglinhplus.CareerSocialNetwork.securities.RequestInfo;
import com.hoanglinhplus.CareerSocialNetwork.utils.JWTUtil;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class CustomOnePerRequestFilter extends OncePerRequestFilter {

  @Override
  protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {

    if(AllowedRequests.isAllowed(new RequestInfo(request.getMethod(), request.getServletPath()))
      || (request.getMethod().equalsIgnoreCase("GET") && !request.getServletPath().startsWith("/api"))){
      filterChain.doFilter(request, response);
    }else {
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
          Map<String, Object> principal = decodedJWT.getClaim("principal").asMap();
          List<String> roles = (List<String>) principal.get("roles");
          Long userId = ((Integer) principal.get("userId")).longValue();
          UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken
            = new UsernamePasswordAuthenticationToken(
            userId
            , null
            , roles.stream().map(SimpleGrantedAuthority::new
          ).collect(Collectors.toList()));
          SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);
          filterChain.doFilter(request, response);
        }catch (Exception e){
          e.printStackTrace();
          ResponseErrorDTO responseErrorDTO = new ResponseErrorDTO("Token is not valid", new HashMap<>());
          responseErrorDTO.getErrors().put("cause", e.getMessage());
          response.setStatus(400);
          response.setContentType(MediaType.APPLICATION_JSON_VALUE);
          response.getWriter().write(new ObjectMapper().writeValueAsString(responseErrorDTO));
        }
      }
      else {
        ResponseErrorDTO responseErrorDTO = new ResponseErrorDTO("Authentication header is not valid", null);
        response.setStatus(400);
        response.setContentType(MediaType.APPLICATION_JSON_VALUE);
        response.getWriter().write(new ObjectMapper().writeValueAsString(responseErrorDTO));
      }
    }
  }
}