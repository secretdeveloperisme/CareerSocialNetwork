package com.hoanglinhplus.CareerSocialNetwork.services;

import com.hoanglinhplus.CareerSocialNetwork.constants.PageConstant;
import com.hoanglinhplus.CareerSocialNetwork.dto.PageableDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.UserCreationDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.UserDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.InputNotValidException;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.MyUsernameNotFoundException;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.UserNameExistedException;
import com.hoanglinhplus.CareerSocialNetwork.mappers.ResponseUserMapper;
import com.hoanglinhplus.CareerSocialNetwork.mappers.UserMapper;
import com.hoanglinhplus.CareerSocialNetwork.models.User;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.SearchCriteria;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.SearchOperator;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.UserSpecification;
import com.hoanglinhplus.CareerSocialNetwork.repositories.RoleRepository;
import com.hoanglinhplus.CareerSocialNetwork.repositories.UserRepository;
import com.hoanglinhplus.CareerSocialNetwork.utils.PasswordUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;


@Service
public class UserService {
  private final UserRepository userRepository;
  private final RoleRepository roleRepository;

  @Autowired
  public UserService(UserRepository userRepository, RoleRepository roleRepository){
    this.userRepository = userRepository;
    this.roleRepository = roleRepository;
  }
  public ResponseEntity<ResponseObjectDTO> getUser(String username){
    Optional<User> userOptional = userRepository.findByUsername(username);
    if(userOptional.isPresent()){
      UserDTO userDTO = UserMapper.toUserDTO(userOptional.get());
      Map<String, Object> responseData = new HashMap<>();
      responseData.put("user", userDTO);
      return ResponseEntity.ok(new ResponseObjectDTO("get user successfully ",responseData));
    }
    throw new MyUsernameNotFoundException("username is not found", username);
  }
  public ResponseEntity<ResponseObjectDTO> getAllUsers(String gender, String address, PageableDTO pageableDTO){
    UserSpecification userSpecification = new UserSpecification();
    if(gender != null && !gender.isEmpty()){
      userSpecification.getConditions().add(new SearchCriteria("gender", gender, SearchOperator.LIKE));
    }
    if(address != null && !address.isEmpty()){
      userSpecification.getConditions().add(new SearchCriteria("address", address, SearchOperator.LIKE));
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
    Pageable pageable = PageRequest.of(pageableDTO.getPage(),pageableDTO.getSize(),Sort.by(orders));
    if(!userSpecification.getConditions().isEmpty()){
      userPage = userRepository.findAll(userSpecification, pageable);
    }
    else{
      userPage = userRepository.findAll(pageable);
    }
    return ResponseEntity.ok(ResponseUserMapper.toDTO(userPage));
  }
  public ResponseEntity<ResponseObjectDTO> createUser(UserCreationDTO userCreationDTO){
    User user = UserMapper.toUser(userCreationDTO);
    Optional<User> userOptional = userRepository.findByUsername(user.getUsername());
    if(userOptional.isEmpty()){
      User savedUser = userRepository.save(user);
      Map<String, Object> responseData = new HashMap<>();
      UserDTO userDTO = UserMapper.toUserDTO(savedUser);
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
  public ResponseEntity<ResponseObjectDTO> updateUser(UserCreationDTO userUpdateDTO){
    User user = UserMapper.toUser(userUpdateDTO);
    Optional<User> userOptional = userRepository.findByUsername(user.getUsername());
    if(userOptional.isPresent()){
      User targetUser = userOptional.get();
      if(user.getPasswordHash() != null){
        targetUser.setPasswordHash(PasswordUtil.getInstance().hashPassword(user.getPasswordHash()));
      }
      if(user.getDob() != null){
        targetUser.setDob(user.getDob());
      }
      if(user.getGender() != null){
        targetUser.setGender(user.getGender());
      }
      if(user.getAddress() != null){
        targetUser.setAddress(user.getAddress());
      }
      if(user.getRoles() != null && user.getRoles().size() > 0){
        targetUser.setRoles(user.getRoles().stream().map(role ->
          roleRepository.findByName(role.getName()).get()).collect(Collectors.toList()));
      }
      User updatedUser =  userRepository.save(targetUser);
      Map<String, Object> responseData = new HashMap<>();
      responseData.put("updatedUser", updatedUser);
      ResponseObjectDTO responseObjectDTO = new ResponseObjectDTO(
        "update user successfully"
        ,responseData);
      return ResponseEntity.ok(responseObjectDTO);
    }
    else {
      throw new MyUsernameNotFoundException("username is not found", user.getUsername());
    }
  }
  public ResponseEntity<ResponseObjectDTO> deleteUsers(List<Long> ids) {
    List<Long> notExistIds = new ArrayList<>();
    List<Long> existedIds = userRepository.findExistedIds(ids);
    ids.forEach(id->{
      if(!existedIds.contains(id))
        notExistIds.add(id);
    });
    if(notExistIds.size() == 0){
      userRepository.deleteUsersByIds(ids);
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

}