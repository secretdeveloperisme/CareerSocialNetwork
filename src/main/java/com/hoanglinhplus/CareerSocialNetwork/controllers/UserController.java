package com.hoanglinhplus.CareerSocialNetwork.controllers;

import com.hoanglinhplus.CareerSocialNetwork.dto.PageableDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.UserCreationDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
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
@RequestMapping("/user")
@Validated
public class UserController {
  private final UserService userService;
  @Autowired
  UserController(UserService userService){
    this.userService = userService;
  }
  @PreAuthorize("hasAuthority('ADMIN')")
  @GetMapping("/get-all-users")
  public ResponseEntity<?> getAllUsers(
    @RequestParam(required = false)  @Size(min = 1, max = 1, message = "gender's length must be 1 ")  String gender
    , @RequestParam(required = false) @Size(min = 1, max = 255, message = "address's length must be from 1 to 255")  String address
    ,@RequestParam(required = false) @Size(min = 1, max = 255, message = "address's length must be from 1 to 255")  String username
    , @Valid PageableDTO pageableDTO
  ){
    return userService.getAllUsers(gender, address, username,  pageableDTO);
  }

  @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
  @GetMapping("/get-user")
  public ResponseEntity<ResponseObjectDTO> getUser(
    @RequestParam @Size(min = 5, max = 255, message = "username's length must be from 5 to 255") String username){
    return userService.getUser(username);
  }
  @PostMapping(produces = MediaType.APPLICATION_JSON_VALUE)
  public ResponseEntity<ResponseObjectDTO> createUser(@RequestBody @Valid UserCreationDTO userCreationDTO){
    return userService.createUser(userCreationDTO);
  }
  @PreAuthorize("hasAuthority('ADMIN') or (hasAuthority('USER') and #userUpdateDTO.username = principal.username) ")
  @PutMapping(produces = MediaType.APPLICATION_JSON_VALUE)
  public ResponseEntity<ResponseObjectDTO> updateUser(@RequestBody @Valid UserCreationDTO userUpdateDTO){
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