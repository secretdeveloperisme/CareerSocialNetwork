package com.hoanglinhplus.CareerSocialNetwork.controllers.api;

import com.hoanglinhplus.CareerSocialNetwork.dto.PageableDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseDataDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.tag.TagDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.tag.TagFilterDTO;
import com.hoanglinhplus.CareerSocialNetwork.services.TagService;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/tag")
public class TagController {
  private final TagService tagService;

  public TagController(TagService tagService) {
    this.tagService = tagService;
  }
  @GetMapping("/get-all-tags")
  ResponseEntity<ResponseDataDTO<TagDTO>> getAllTags(TagFilterDTO tagFilterDTO, PageableDTO pageableDTO){
    return tagService.responseGetTags(tagFilterDTO, pageableDTO);
  }
  @PreAuthorize("hasAnyAuthority('ADMIN')")
  @PutMapping
  ResponseEntity<ResponseObjectDTO> updateTag(@RequestBody TagDTO tagDTO){
    return tagService.update(tagDTO);
  }
  @PreAuthorize("hasAnyAuthority('ADMIN')")
  @DeleteMapping("/many")
  ResponseEntity<ResponseObjectDTO> destroyTags(@RequestBody List<Long> ids){
    return tagService.destroyTags(ids);
  }
}
