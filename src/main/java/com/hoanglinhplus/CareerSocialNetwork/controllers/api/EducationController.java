package com.hoanglinhplus.CareerSocialNetwork.controllers.api;

import com.hoanglinhplus.CareerSocialNetwork.dto.EducationDTO;
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
@RequestMapping("/api/education")
@Validated
public class EducationController {
  private final UserService userService;
  @Autowired
  public EducationController(UserService userService) {
    this.userService = userService;
  }

  @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
  @PostMapping(path= "/user-add",produces = MediaType.APPLICATION_JSON_VALUE)
  public ResponseEntity<ResponseObjectDTO> addEducation(@RequestBody EducationDTO educationDTO){
    return userService.addEducation(educationDTO);
  }
  @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
  @PutMapping(path ="/user-update", produces = MediaType.APPLICATION_JSON_VALUE)
  public ResponseEntity<ResponseObjectDTO> deleteEducation(@RequestBody EducationDTO educationDTO){
    return userService.updateEducation(educationDTO);
  }
  @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
  @DeleteMapping(path ="/user-delete", produces = MediaType.APPLICATION_JSON_VALUE)
  public ResponseEntity<ResponseObjectDTO> deleteEducation(@RequestBody Map<String, Long> params){
    return userService.deleteEducation(params.get("educationId"));
  }
}