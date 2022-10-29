package com.hoanglinhplus.CareerSocialNetwork.mappers;

import com.hoanglinhplus.CareerSocialNetwork.dto.SkillDTO;
import com.hoanglinhplus.CareerSocialNetwork.models.Skill;

public class SkillMapper extends ModelMapperConfig{
  public static Skill toEntity(SkillDTO skillDTO) {
    return modelMapper.map(skillDTO, Skill.class);
  }
  public static SkillDTO toDTO(Skill skill) {
    return modelMapper.map(skill, SkillDTO.class);
  }
}
