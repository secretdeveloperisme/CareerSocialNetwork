package com.hoanglinhplus.CareerSocialNetwork.mappers;

import com.hoanglinhplus.CareerSocialNetwork.dto.post.PostCreationDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.tag.TagDTO;
import com.hoanglinhplus.CareerSocialNetwork.models.Post;
import com.hoanglinhplus.CareerSocialNetwork.models.PostLike;
import com.hoanglinhplus.CareerSocialNetwork.models.Tag;
import com.hoanglinhplus.CareerSocialNetwork.utils.SlugUtil;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class PostMapper extends  ModelMapperConfig{
  static public Post toEntity(PostCreationDTO postCreationDTO) {
    Post post = modelMapper.map(postCreationDTO, Post.class);
    if(post.getTitle() != null){
      post.setSlug(SlugUtil.toSlug(postCreationDTO.getTitle()));
    }
    List<TagDTO> tagDTOs = postCreationDTO.getTags();
    if(tagDTOs != null){
      post.setTags(tagDTOs.stream().map(tagDTO -> Tag.builder().tagId(tagDTO.getTagId()).build()).toList());
    }
    return post;
  }
  static public PostCreationDTO toDTO(Post post) {
    PostCreationDTO postCreationDTO = modelMapper.map(post, PostCreationDTO.class);
    List<Tag> tags = post.getTags();
    if(tags != null){
      postCreationDTO.setTags(tags.stream().map(tag ->
        TagDTO.builder().tagId(tag.getTagId()).name(tag.getName()).build()).toList());
    }
    return postCreationDTO;
  }
}
