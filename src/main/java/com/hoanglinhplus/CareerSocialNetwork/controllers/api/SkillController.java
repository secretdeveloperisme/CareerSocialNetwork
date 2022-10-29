package com.hoanglinhplus.CareerSocialNetwork.controllers.api;

import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.Map;


@RestController
@RequestMapping("/api/skill")
@Validated
public class SkillController {
  private final UserService userService;
  @Autowired
  public SkillController(UserService userService) {
    this.userService = userService;
  }

  @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
  @PostMapping(path= "/user-add",produces = MediaType.APPLICATION_JSON_VALUE)
  public ResponseEntity<ResponseObjectDTO> addSkill(@RequestBody Map<String, Long> params){
    return userService.addSkill(params.get("skillId"));
  }
  @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
  @DeleteMapping(path ="/user-delete", produces = MediaType.APPLICATION_JSON_VALUE)
  public ResponseEntity<ResponseObjectDTO> deleteSkill(@RequestBody Map<String, Long> params){
    return userService.deleteSkill(params.get("skillId"));
  }
}