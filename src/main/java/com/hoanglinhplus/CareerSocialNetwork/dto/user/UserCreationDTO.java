package com.hoanglinhplus.CareerSocialNetwork.dto.user;

import com.hoanglinhplus.CareerSocialNetwork.dto.EducationDTO;
import lombok.*;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class UserCreationDTO {
  private Long userId;
  @Pattern(regexp = "^[a-zA-Z\\d]+$", message = "username contain[a-zA-Z0-9] characters")
  private String username;
  @NotBlank(message = "password must no be empty")
  @Pattern(regexp = "(?=.*[^\\w\\d\\s:]).*", message = "password must have special characters" )
  @Pattern(regexp = "(?=.*\\d).*", message = "password must have digits" )
  @Pattern(regexp = "(?=.*[A-Z])+.*", message = "password must have upper characters" )
  @Pattern(regexp = "(?=.*[a-z]).*", message = "password must have lower character" )
  @Pattern(regexp = "(\\S).*", message = "password must not have blank character" )
  @Pattern(regexp = ".{8,16}", message = "password must have 8-16 characters" )
  private String password;
  @Email
  private String email;
  private String fullname;
  @NotBlank @NotNull
  private String gender;
  private String biography;
  private String avatar;
  private String address;
  private String cvUrl;
  private Date dob;
  private String externalLoginType;
  private boolean isEnabled = true;
  private String externalLoginId;
  private Date createdAt;
  private Date updatedAt;
  private Date deletedAt;
  private List<Long> userSkillIds;
  private List<EducationDTO> educations;
  private List<Long> roleIds = List.of(1L);
}
