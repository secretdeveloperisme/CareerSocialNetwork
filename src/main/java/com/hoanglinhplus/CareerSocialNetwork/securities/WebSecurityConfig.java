package com.hoanglinhplus.CareerSocialNetwork.securities;

import com.hoanglinhplus.CareerSocialNetwork.constants.RoleConstant;
import com.hoanglinhplus.CareerSocialNetwork.filters.AuthenticationFilter;
import com.hoanglinhplus.CareerSocialNetwork.filters.CustomOnePerRequestFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@EnableWebSecurity
@EnableGlobalMethodSecurity(jsr250Enabled = true,prePostEnabled = true,securedEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
  @Autowired
  MyUserDetailsService myUserDetailsService;
  @Override
  protected void configure(AuthenticationManagerBuilder auth) throws Exception {
    auth.userDetailsService(myUserDetailsService).and();
  }

  @Override
  protected void configure(HttpSecurity http) throws Exception {
    AuthenticationFilter authenticationFilter = new AuthenticationFilter(this.authenticationManagerBean());
    authenticationFilter.setFilterProcessesUrl("/auth/login");
    http.csrf().disable()
      .authorizeHttpRequests().anyRequest().permitAll()
      .and().addFilter(authenticationFilter)
      .formLogin().loginPage("/auth/login").loginProcessingUrl("/auth/login");
    http.addFilterBefore(new CustomOnePerRequestFilter(), UsernamePasswordAuthenticationFilter.class);
  }
  @Bean
  PasswordEncoder passwordEncoder(){
    return new BCryptPasswordEncoder();
  }

}


