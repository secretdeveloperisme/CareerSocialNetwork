package com.hoanglinhplus.CareerSocialNetwork.filters;

import com.auth0.jwt.interfaces.DecodedJWT;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseErrorDTO;
import com.hoanglinhplus.CareerSocialNetwork.securities.MyUser;
import com.hoanglinhplus.CareerSocialNetwork.utils.JWTUtil;
import org.jetbrains.annotations.NotNull;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class CustomOnePerRequestFilter extends OncePerRequestFilter {
  @Override
  protected void doFilterInternal(HttpServletRequest request, @NotNull HttpServletResponse response, @NotNull FilterChain filterChain) throws ServletException, IOException {
    if(request.getServletPath().equalsIgnoreCase("/auth/login")
      || request.getServletPath().equalsIgnoreCase("/auth/refresh-token")
      || (request.getMethod().equalsIgnoreCase("POST") && request.getServletPath().equalsIgnoreCase("/user"))){
      filterChain.doFilter(request, response);
    }else {
      String authorizationHeader = request.getHeader(HttpHeaders.AUTHORIZATION);
      if(authorizationHeader != null && authorizationHeader.startsWith("Bearer ")){
        String token = authorizationHeader.substring("Bearer ".length());
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