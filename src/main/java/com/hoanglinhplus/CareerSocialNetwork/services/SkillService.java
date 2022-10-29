package com.hoanglinhplus.CareerSocialNetwork.services;

import com.hoanglinhplus.CareerSocialNetwork.exceptions.NotFoundException;
import com.hoanglinhplus.CareerSocialNetwork.models.Skill;
import com.hoanglinhplus.CareerSocialNetwork.repositories.SkillRepository;
import com.hoanglinhplus.CareerSocialNetwork.securities.MyUserDetailsService;
import com.hoanglinhplus.CareerSocialNetwork.securities.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class SkillService {
  private final SkillRepository skillRepository;
  private final MyUserDetailsService myUserDetailsService;
  private final PermissionService permissionService;
  @Autowired
  public SkillService(SkillRepository skillRepository, MyUserDetailsService myUserDetailsService, PermissionService permissionService) {
    this.skillRepository = skillRepository;
    this.myUserDetailsService = myUserDetailsService;
    this.permissionService = permissionService;
  }
  public List<Skill> getAllSkills() {
    return skillRepository.findAll();
  }
  Skill getSkill(Long skillId){
    Optional<Skill> skillOptional = skillRepository.findById(skillId);
    if(skillOptional.isEmpty())
      throw new NotFoundException("Skill Not Found", skillId.toString(), "ID");
    return skillOptional.get();
  }

}
