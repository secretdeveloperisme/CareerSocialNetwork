package com.hoanglinhplus.CareerSocialNetwork.mappers;

import com.hoanglinhplus.CareerSocialNetwork.dto.*;
import com.hoanglinhplus.CareerSocialNetwork.models.Education;
import com.hoanglinhplus.CareerSocialNetwork.models.Role;
import com.hoanglinhplus.CareerSocialNetwork.models.Skill;
import com.hoanglinhplus.CareerSocialNetwork.models.User;
import com.hoanglinhplus.CareerSocialNetwork.utils.PasswordUtil;
import org.modelmapper.Conditions;
import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class UserMapper {
  static public User toUser(UserCreationDTO userCreationDTO) {
    ModelMapper modelMapper = new ModelMapper();
    modelMapper.getConfiguration()
      .setMatchingStrategy(MatchingStrategies.STRICT)
      .setDeepCopyEnabled(true)
      .setPropertyCondition(Conditions.isNotNull());
    User user = modelMapper.map(userCreationDTO, User.class);
    user.setPasswordHash(PasswordUtil.getInstance().hashPassword(userCreationDTO.getPassword()));
    List<Long> roleIds = userCreationDTO.getRoleIds();
    if(roleIds != null)
        user.setRoles(roleIds.stream().map(roleId->Role.builder().roleId(roleId).build()).toList());
    List<Long> skillIds = userCreationDTO.getUserSkillIds();
    if(skillIds != null)
      user.setUserSkills(skillIds.stream().map(skillId-> Skill.builder().skillId(skillId).build()).toList());
    List<EducationDTO> educationDTOS = userCreationDTO.getEducations();
    if(educationDTOS != null){
      user.setEducations(educationDTOS.stream().map(
        educationDTO -> Education.builder().schoolName(educationDTO.getSchoolName())
          .startDate(educationDTO.getStartDate())
          .endDate(educationDTO.getEndDate()).build()
      ).toList());
    }
    return user;
  }
  static public UserDTO toUserDTO(User user) {
    ModelMapper modelMapper = new ModelMapper();
    modelMapper.getConfiguration()
      .setMatchingStrategy(MatchingStrategies.STRICT)
      .setDeepCopyEnabled(true)
      .setPropertyCondition(Conditions.isNotNull());
    UserDTO userDTO = modelMapper.map(user, UserDTO.class);
    List<Role> roles = user.getRoles();
    if(roles != null)
      userDTO.setRoles(roles.stream().map(role->
        new RoleDTO(role.getRoleId(), role.getName())
        ).toList());
    List<Skill> skills = user.getUserSkills();
    if(skills != null)
      userDTO.setUserSkills(skills.stream().map(skill-> new SkillDTO(skill.getSkillId(),skill.getName())).toList());
    List<Education> educations = user.getEducations();
    if(educations != null){
      userDTO.setEducations(educations.stream().map(
        education -> new EducationDTO(education.getEducationId(),education.getSchoolName(),
          education.getStartDate(),
          education.getEndDate(),
          education.getGrade())
      ).toList());
    }
    return userDTO;
  }
}
