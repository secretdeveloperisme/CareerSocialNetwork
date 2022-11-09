package com.hoanglinhplus.CareerSocialNetwork.mappers;

import com.hoanglinhplus.CareerSocialNetwork.dto.tag.TagDTO;
import com.hoanglinhplus.CareerSocialNetwork.models.Tag;

public class TagMapper extends ModelMapperConfig{
  static public Tag toEntity(TagDTO tagDTO) {
    return modelMapper.map(tagDTO, Tag.class);
  }
  static public TagDTO toDTO(Tag tag) {
    TagDTO tagDTO = modelMapper.map(tag, TagDTO.class);
    tagDTO.setAmountOfJobs(tag.getJobTags().size());
    tagDTO.setAmountOfPosts(tag.getPostTags().size());
    tagDTO.setAmountOfFollowers(tag.getFollowTagUsers().size());
    return tagDTO;
  }
}
