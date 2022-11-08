package com.hoanglinhplus.CareerSocialNetwork.services;

import com.hoanglinhplus.CareerSocialNetwork.constants.PageConstant;
import com.hoanglinhplus.CareerSocialNetwork.dto.EducationDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.PageableDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.SkillDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseDataDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.user.UserCreationDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.user.UserDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.user.UserUpdateDTO;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.*;
import com.hoanglinhplus.CareerSocialNetwork.mappers.EducationMapper;
import com.hoanglinhplus.CareerSocialNetwork.mappers.ResponseUserMapper;
import com.hoanglinhplus.CareerSocialNetwork.mappers.SkillMapper;
import com.hoanglinhplus.CareerSocialNetwork.mappers.UserMapper;
import com.hoanglinhplus.CareerSocialNetwork.models.Education;
import com.hoanglinhplus.CareerSocialNetwork.models.Skill;
import com.hoanglinhplus.CareerSocialNetwork.models.User;
import com.hoanglinhplus.CareerSocialNetwork.models.User_;
import com.hoanglinhplus.CareerSocialNetwork.repositories.SkillRepository;
import com.hoanglinhplus.CareerSocialNetwork.repositories.UserRepository;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.SearchCriteria;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.SearchOperator;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.UserSpecification;
import com.hoanglinhplus.CareerSocialNetwork.securities.MyUserDetailsService;
import com.hoanglinhplus.CareerSocialNetwork.securities.PermissionService;
import com.hoanglinhplus.CareerSocialNetwork.utils.PasswordUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.*;


@Service
public class UserService {
  private final UserRepository userRepository;
  private final SkillRepository skillRepository;
  private final EducationService educationService;
  private final SkillService skillService;
  private final PermissionService permissionService;
  private final MyUserDetailsService myUserDetailsService;

  @Autowired
  public UserService(UserRepository userRepository, SkillRepository skillRepository
    , EducationService educationService, SkillService skillService, PermissionService permissionService, MyUserDetailsService myUserDetailsService){
    this.userRepository = userRepository;
    this.skillRepository = skillRepository;
    this.educationService = educationService;
    this.skillService = skillService;
    this.permissionService = permissionService;
    this.myUserDetailsService = myUserDetailsService;
  }
  public ResponseEntity<ResponseObjectDTO> responseGetUserByUsername(String username){
    Optional<User> userOptional = userRepository.findByUsername(username);
    if(userOptional.isPresent()){
      UserDTO userDTO = UserMapper.toDTO(userOptional.get());
      Map<String, Object> responseData = new HashMap<>();
      responseData.put("user", userDTO);
      return ResponseEntity.ok(new ResponseObjectDTO("get user successfully ",responseData));
    }
    throw new MyUsernameNotFoundException("username is not found", username);
  }
  boolean isAdmin(User user){
    return user.getRoles().stream().anyMatch(role -> role.getName().equals("ADMIN"));
  }
  public User getUser(Long userId) {
    Optional<User> userOptional = userRepository.findById(userId);
    if (userOptional.isPresent()) {
      User user = userOptional.get();
      user.setAdmin(isAdmin(user));
      return userOptional.get();
    }
    throw new NotFoundException("User not found", userId.toString(), "UserID");
  }
  public User getUser(String username) {
    Optional<User> userOptional = userRepository.findByUsername(username);
    if (userOptional.isPresent()) {
      return userOptional.get();
    }
    throw new NotFoundException("User not found", username, "username");
  }
  Skill getExistedSkill(Long skillId, User user) {
    Optional<Skill> foundSkill = user.getUserSkills().stream().filter(skill1 -> skill1.getSkillId() == skillId).findFirst();
    return foundSkill.orElse(null);
  }
  public ResponseEntity<ResponseObjectDTO> addSkill(Long skillId){
    User user = getUser(myUserDetailsService.getCurrentUserId());
    Skill existedSkill = getExistedSkill(skillId, user);
    if (existedSkill != null)
      throw new InputNotValidException("User had the skill");

    Skill skill = skillService.getSkill(skillId);
    user.getUserSkills().add(skillService.getSkill(skillId));
    userRepository.save(user);
    SkillDTO skillDTO = SkillMapper.toDTO(skill);
    Map<String, Object > responseData = new HashMap<>();
    responseData.put("skill", skillDTO);
    return ResponseEntity.ok(new ResponseObjectDTO("Add User Skill Successfully ", responseData));
  }
  public ResponseEntity<ResponseObjectDTO> deleteSkill(Long skillId){
    User user = getUser(myUserDetailsService.getCurrentUserId());
    Skill skill = getExistedSkill(skillId,user);
    if(skill == null)
      throw new NotFoundException("User does not have skill", skillId.toString(), "ID");
    user.getUserSkills().remove(skill);
    userRepository.save(user);
    return ResponseEntity.ok(new ResponseObjectDTO("Delete User Skill Successfully ", null));
  }
  Education getExistedEducation(Long educationId, User user) {
    Optional<Education> foundEducation = user.getEducations().stream().filter(education -> education.getEducationId().equals(educationId)).findFirst();
    return foundEducation.orElse(null);
  }
  @Transactional
  public ResponseEntity<ResponseObjectDTO> addEducation(EducationDTO educationDTO){
    User user = getUser(myUserDetailsService.getCurrentUserId());
    Education education = educationService.createEducation(educationDTO);
    user.getEducations().add(education);
    userRepository.save(user);
    EducationDTO savedEducation = EducationMapper.toDTO(education);
    Map<String, Object > responseData = new HashMap<>();
    responseData.put("education", savedEducation);
    return ResponseEntity.ok(new ResponseObjectDTO("Add Education Successfully ", responseData));
  }
  public ResponseEntity<ResponseObjectDTO> updateEducation(EducationDTO educationDTO){
    User user = getUser(myUserDetailsService.getCurrentUserId());
    Education education = educationService.getEducation(educationDTO.getEducationId());
    if(!permissionService.isOwnerEducation(education))
      throw new PermissionDeniedException("You don't have permission to update education");
    EducationDTO updatedEducation = educationService.updateEducation(educationDTO);
    Map<String, Object > responseData = new HashMap<>();
    responseData.put("updatedEducation", updatedEducation);
    return ResponseEntity.ok(new ResponseObjectDTO("Update Education Successfully ", responseData));
  }

  public ResponseEntity<ResponseObjectDTO> deleteEducation(Long educationId){
    User user = getUser(myUserDetailsService.getCurrentUserId());
    Education education = getExistedEducation(educationId,user);
    if(education == null)
      throw new NotFoundException("User does not have education", educationId.toString(), "ID");
    user.getEducations().remove(education);
    userRepository.save(user);
    educationService.deleteEducation(educationId);
    return ResponseEntity.ok(new ResponseObjectDTO("Delete User Education Successfully ", null));
  }
  public ResponseEntity<ResponseDataDTO<UserDTO>> getAllUsers(String gender, String address
    , String username, String isEnable,  PageableDTO pageableDTO){
    UserSpecification userSpecification = new UserSpecification();
    if(gender != null && !gender.isEmpty()){
      SearchCriteria<User, String> criteria = new SearchCriteria<>(User_.gender, gender, SearchOperator.LIKE);
      userSpecification.getConditions().add(criteria);
    }
    if(username != null && !username.isEmpty()){
      SearchCriteria<User,String> criteria = new SearchCriteria<>(User_.username, username, SearchOperator.LIKE);
      userSpecification.getConditions().add(criteria);
    }
    if(address != null && !address.isEmpty()){
      SearchCriteria<User,String>criteria = new SearchCriteria<>(User_.address, address, SearchOperator.LIKE);
      userSpecification.getConditions().add(criteria);
    }
    if(isEnable != null && isEnable.equals("true")){
      SearchCriteria<User,Boolean>criteria = new SearchCriteria<>(User_.isEnabled, true, SearchOperator.EQUAL);
      userSpecification.getConditions().add(criteria);
    }
    if(isEnable != null && isEnable.equals("false")){
      SearchCriteria<User,Boolean>criteria = new SearchCriteria<>(User_.isEnabled, false, SearchOperator.EQUAL);
      userSpecification.getConditions().add(criteria);
    }
    List<Sort.Order> orders = new ArrayList<>();
    if(pageableDTO.getSort() != null){
      pageableDTO.getSort().forEach(s->{
        String[] sortParams = s.split("[\\-_\\.]");
        if(sortParams.length == PageConstant.SORT_ARGUMENT_SIZE){
          if(sortParams[1].equalsIgnoreCase(PageConstant.DESCENDING)){
            orders.add(Sort.Order.by(sortParams[0]).with(Sort.Direction.DESC));
          }else
            orders.add(Sort.Order.by(sortParams[0]).with(Sort.Direction.ASC));
        }
        else if(sortParams.length == 1){
          orders.add(Sort.Order.by(sortParams[0]).with(Sort.Direction.ASC));
        }
      });
    }
    Page<User> userPage;
    Pageable pageable = PageRequest.of(pageableDTO.getPage() - 1,pageableDTO.getSize(),Sort.by(orders));
    if(!userSpecification.getConditions().isEmpty()){
      userPage = userRepository.findAll(userSpecification, pageable);
    }
    else{
      userPage = userRepository.findAll(pageable);
    }
    return ResponseEntity.ok(ResponseUserMapper.toDTO(userPage));
  }
  public ResponseEntity<ResponseObjectDTO> createUser(UserCreationDTO userCreationDTO){
    User user = UserMapper.toEntity(userCreationDTO);
    Optional<User> userOptional = userRepository.findByUsername(user.getUsername());
    if(userOptional.isEmpty()){
      User savedUser = userRepository.save(user);
      Map<String, Object> responseData = new HashMap<>();
      UserDTO userDTO = UserMapper.toDTO(savedUser);
      responseData.put("createdUser", userDTO);
      ResponseObjectDTO responseObjectDTO = new ResponseObjectDTO(
        "create user successfully"
        ,responseData);
      return ResponseEntity.ok(responseObjectDTO);
    }
    else {
      throw new UserNameExistedException("username is existed", user.getUsername());
    }
  }
  public ResponseEntity<ResponseObjectDTO> updateUser(UserUpdateDTO userUpdateDTO){
    User user = UserMapper.toEntity(userUpdateDTO);
    Optional<User> userOptional = userRepository.findByUsername(user.getUsername());
    if(userOptional.isPresent()){
      User targetUser = userOptional.get();
      if(!permissionService.isAdmin())
        if (!myUserDetailsService.getCurrentUserId().equals(targetUser.getUserId()))
          throw new PermissionDeniedException("You don't have permission to update user");
      if(user.getDob() != null){
        targetUser.setDob(user.getDob());
      }
      if(user.getGender() != null){
        targetUser.setGender(user.getGender());
      }
      if(user.getAddress() != null){
        targetUser.setAddress(user.getAddress());
      }
      if(user.getEmail() != null){
        targetUser.setEmail(user.getEmail());
      }
      if(user.getCvUrl() != null){
        targetUser.setCvUrl(user.getCvUrl());
      }
      if(user.getFullname() != null){
        targetUser.setFullname(user.getFullname());
      }
      if(user.getAvatar() != null){
        targetUser.setAvatar(user.getAvatar());
      }
      if(targetUser.isEnabled() != user.isEnabled()){
        targetUser.setEnabled(user.isEnabled());
      }
      if(user.getBiography() != null){
        targetUser.setBiography(user.getBiography());
      }
      if(user.getUserSkills() != null ){
        targetUser.setUserSkills(skillRepository.findAllById(userUpdateDTO.getUserSkillIds()));
      }
      if(user.getEducations() != null ){
        educationService.updateEducation(user.getEducations());
      }
      if(userUpdateDTO.getPassword() != null){
        if(PasswordUtil.getInstance().checkPassword(userUpdateDTO.getPassword(),targetUser.getPasswordHash()) ){
          if(userUpdateDTO.getNewPassword() == null || userUpdateDTO.getNewPassword().equals("")){
            throw new InputNotValidException("New password is empty");
          }
          targetUser.setPasswordHash(PasswordUtil.getInstance().hashPassword(userUpdateDTO.getNewPassword()));
        }else{
          throw new InputNotValidException("Old password is not equal");
        }
      }
      User updatedUser =  userRepository.save(targetUser);
      Map<String, Object> responseData = new HashMap<>();
      UserDTO updatedUserDTO = UserMapper.toDTO(updatedUser);
      responseData.put("updatedUser", updatedUserDTO);
      ResponseObjectDTO responseObjectDTO = new ResponseObjectDTO(
        "update user successfully"
        ,responseData);
      return ResponseEntity.ok(responseObjectDTO);
    }
    else {
      throw new MyUsernameNotFoundException("username is not found", user.getUsername());
    }
  }
  @Transactional
  public ResponseEntity<ResponseObjectDTO> deleteUsers(List<Long> ids) {
    List<Long> notExistIds = new ArrayList<>();
    List<Long> existedIds = userRepository.findExistedIds(ids);
    ids.forEach(id->{
      if(!existedIds.contains(id))
        notExistIds.add(id);
    });
    if(notExistIds.size() == 0){
      ids.forEach(this::deleteUserById);
      Map<String, Object> responseData = new HashMap<>();
      responseData.put("deletedIds", ids);
      ResponseObjectDTO responseObjectDTO = new ResponseObjectDTO(
        "delete users successfully "
        ,responseData);
      return ResponseEntity.ok(responseObjectDTO);
    }
    else{
      InputNotValidException inputNotValidException = new InputNotValidException("some ids is not found");
      inputNotValidException.getCauses().put("invalidIds", notExistIds);
      throw inputNotValidException;
    }
  }
  @Transactional
  public ResponseEntity<ResponseObjectDTO> deleteUser(Long id) {
    Map<String, Object> responseData = new HashMap<>();
    User user;
    if((user = deleteUserById(id)) != null ){
      UserDTO deletedUserDTO = UserMapper.toDTO(user);
      responseData.put("deletedUser", deletedUserDTO);
      ResponseObjectDTO responseObjectDTO = new ResponseObjectDTO(
        "delete user successfully "
        ,responseData);
      return ResponseEntity.ok(responseObjectDTO);
    }
    else{
      InputNotValidException inputNotValidException = new InputNotValidException("UserID is not found");
      inputNotValidException.getCauses().put("invalidId", id);
      throw inputNotValidException;
    }
  }
  public User deleteUserById(Long id) {
    Optional<User> userOptional = userRepository.findById(id);
    if (userOptional.isPresent()) {
      User user = userOptional.get();
      user.removeAllRelationShip();
      userRepository.delete(user);
      return user;
    }
    return null;
  }

  public boolean isCurrentUserFollowed(Long userId) {
    return isUserFollowed(myUserDetailsService.getCurrentUserId(), userId);
  }

  public boolean isUserFollowed(Long userId, Long targetUserId){
    User targetUser = getUser(targetUserId);
    List<User> followingUsers = targetUser.getFollowing_users();
    return followingUsers.stream().anyMatch(user -> user.getUserId().equals(userId));
  }
  public List<User> getFollowedUsers(Long userId){
    User user = getUser(userId);
    return user.getFollowed_users();
  }
  public long getAmountOfFollowedUsers(Long userId){
    return getFollowedUsers(userId).size();
  }

  public long getAmountOfAllUsers() {
    return userRepository.count();
  }
}