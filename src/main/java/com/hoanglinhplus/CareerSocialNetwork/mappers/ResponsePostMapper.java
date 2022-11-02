package com.hoanglinhplus.CareerSocialNetwork.mappers;

import com.hoanglinhplus.CareerSocialNetwork.dto.post.PostCreationDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseDataDTO;
import com.hoanglinhplus.CareerSocialNetwork.models.Post;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.stream.Collectors;

public class ResponsePostMapper {
  public static ResponseDataDTO<PostCreationDTO> toDTO(Page<Post> jobPage){
    List<PostCreationDTO> jobCreationDTOS = jobPage.getContent().stream().map(PostMapper::toDTO).collect(Collectors.toList());
    ResponseDataDTO<PostCreationDTO> responseData =
      new ResponseDataDTO<>("get all post successfully", jobCreationDTOS,(long) jobPage.getTotalPages());
    return responseData;
  }
}
