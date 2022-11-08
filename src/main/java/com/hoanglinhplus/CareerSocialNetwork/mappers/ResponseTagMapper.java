package com.hoanglinhplus.CareerSocialNetwork.mappers;

import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseDataDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.tag.TagDTO;
import com.hoanglinhplus.CareerSocialNetwork.models.Tag;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class ResponseTagMapper {
  public static ResponseDataDTO<TagDTO> toDTO(Page<Tag> tagPage){
    List<TagDTO> tagDTOS = tagPage.getContent().stream().map(TagMapper::toDTO).collect(Collectors.toList());
    ResponseDataDTO<TagDTO> responseData = new ResponseDataDTO<>(
      "get all companies successfully"
    , tagDTOS
    ,(long)tagPage.getTotalPages(), tagPage.getTotalElements());
    return responseData;
  }
}