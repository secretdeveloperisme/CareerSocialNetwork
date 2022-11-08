package com.hoanglinhplus.CareerSocialNetwork.controllers.api;

import com.hoanglinhplus.CareerSocialNetwork.dto.PageableDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.user.UserCreationDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.user.UserUpdateDTO;
import com.hoanglinhplus.CareerSocialNetwork.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import javax.validation.constraints.Size;
import java.util.List;
import java.util.Map;


@RestController
@RequestMapping("/api/user")
@Validated
public class UserController {
  private final UserService userService;
  @Autowired
  UserController(UserService userService){
    this.userService = userService;
  }
  @PreAuthorize("hasAuthority('ADMIN') or hasAnyAuthority('USER')")
  @GetMapping("/get-all-users")
  public ResponseEntity<?> getAllUsers(
    @RequestParam(required = false)  @Size(min = 1, max = 1, message = "gender's length must be 1 ")  String gender
    , @RequestParam(required = false) @Size(min = 1, max = 255, message = "address's length must be from 1 to 255")  String address
    ,@RequestParam(required = false) @Size(min = 1, max = 255, message = "address's length must be from 1 to 255")  String username
    ,@RequestParam(required = false, name = "enabled") String enable
    , @Valid PageableDTO pageableDTO
  ){
    return userService.getAllUsers(gender, address, username, enable,  pageableDTO);
  }

  @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
  @GetMapping("/get-user")
  public ResponseEntity<ResponseObjectDTO> getUser(
    @RequestParam @Size(min = 5, max = 255, message = "username's length must be from 5 to 255") String username){
    return userService.responseGetUserByUsername(username);
  }
  @PostMapping(produces = MediaType.APPLICATION_JSON_VALUE)
  public ResponseEntity<ResponseObjectDTO> createUser(@RequestBody @Valid UserCreationDTO userCreationDTO){
    return userService.createUser(userCreationDTO);
  }
  @PreAuthorize("hasAuthority('ADMIN') or (hasAuthority('USER'))")
  @PutMapping(produces = MediaType.APPLICATION_JSON_VALUE)
  public ResponseEntity<ResponseObjectDTO> updateUser(@RequestBody @Valid UserUpdateDTO userUpdateDTO){
    return userService.updateUser(userUpdateDTO);
  }
  @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
  @DeleteMapping(produces = MediaType.APPLICATION_JSON_VALUE)
  public ResponseEntity<ResponseObjectDTO> deleteUser(@RequestBody Map<String, Long> params){
    return userService.deleteUser(params.get("userId"));
  }
  @PreAuthorize("hasAuthority('ADMIN')")
  @DeleteMapping(path = "/many",produces = MediaType.APPLICATION_JSON_VALUE)
  public ResponseEntity<ResponseObjectDTO> deleteUsers(@RequestBody List<Long> ids) {
    return userService.deleteUsers(ids);
  }
}