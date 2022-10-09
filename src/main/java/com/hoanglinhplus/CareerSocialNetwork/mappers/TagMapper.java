package com.hoanglinhplus.CareerSocialNetwork.mappers;

import com.hoanglinhplus.CareerSocialNetwork.dto.TagDTO;
import com.hoanglinhplus.CareerSocialNetwork.models.Tag;

public class TagMapper extends ModelMapperConfig{
  static public Tag toEntity(TagDTO tagDTO) {
    return modelMapper.map(tagDTO, Tag.class);
  }
  static public TagDTO toDTO(Tag tag) {
    return modelMapper.map(tag, TagDTO.class);
  }
}
