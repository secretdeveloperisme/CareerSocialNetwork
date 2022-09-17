package com.hoanglinhplus.CareerSocialNetwork.securities;

import com.hoanglinhplus.CareerSocialNetwork.repositories.UserRepository;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.Collection;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class MyUserDetailsService implements UserDetailsService {
  final
  UserRepository userRepository;

  public MyUserDetailsService(UserRepository userRepository) {
    this.userRepository = userRepository;
  }

  @Override
  @Transactional
  public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    System.out.println(username);
    MyUser myUser = null;
    com.hoanglinhplus.CareerSocialNetwork.models.User user = null;
    Optional<com.hoanglinhplus.CareerSocialNetwork.models.User> userOptional = userRepository.findByUsername(username);
    if (userOptional.isPresent()) {
      user = userOptional.get();
      List<GrantedAuthority> roles = user.getRoles().stream()
        .map(role -> new SimpleGrantedAuthority(role.getName()))
        .collect(Collectors.toList());
      myUser = new MyUser(user.getUserId(),user.getUsername(), user.getPasswordHash(), roles);
      return myUser;
    } else {
      throw new UsernameNotFoundException("username is not found");
    }
  }
  public Long getCurrentUserId(){
    return (Long) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
  }
}
