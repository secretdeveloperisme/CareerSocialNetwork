package com.hoanglinhplus.CareerSocialNetwork.services;

import com.hoanglinhplus.CareerSocialNetwork.dto.PageableDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseDataDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.tag.TagDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.stastistic.TagStatistics;
import com.hoanglinhplus.CareerSocialNetwork.dto.tag.TagFilterDTO;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.NotFoundException;
import com.hoanglinhplus.CareerSocialNetwork.mappers.ResponseTagMapper;
import com.hoanglinhplus.CareerSocialNetwork.mappers.TagMapper;
import com.hoanglinhplus.CareerSocialNetwork.models.Tag;
import com.hoanglinhplus.CareerSocialNetwork.models.Tag_;
import com.hoanglinhplus.CareerSocialNetwork.models.User;
import com.hoanglinhplus.CareerSocialNetwork.repositories.TagRepository;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.SearchCriteria;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.SearchOperator;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.TagSpecification;
import com.hoanglinhplus.CareerSocialNetwork.securities.MyUserDetailsService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class TagService {
  private final TagRepository tagRepository;
  private final MyUserDetailsService myUserDetailsService;

  public TagService(TagRepository tagRepository, MyUserDetailsService myUserDetailsService) {
    this.tagRepository = tagRepository;
    this.myUserDetailsService = myUserDetailsService;
  }

  public void createTag(String name){
    if(tagRepository.existsTagByNameContainingIgnoreCase(name)){
      tagRepository.save( Tag.builder().name(name).build());
    }
  }
  @Transactional
  public List<Tag> createTags(List<String> tagNames){
    List<Tag> tags = getTags(tagNames);
    List<Tag> newTags = new ArrayList<Tag>();
    for (String tagName : tagNames) {
      if(tags.stream().noneMatch(tag-> tag.getName().equalsIgnoreCase(tagName))) {
        newTags.add(Tag.builder().name(tagName).build());
      }
    }
    List<Tag> savedTags = tagRepository.saveAll(newTags);
    tags.addAll(savedTags);
    return tags;
  }
  public Tag getTag(Long tagId){
    Optional<Tag> tagOptional = tagRepository.findById(tagId);
    if(tagOptional.isEmpty())
      throw new NotFoundException("Tag not found", tagId.toString(), "ID");
    return tagOptional.get();
  }
  public Tag getTag(String name){
    Optional<Tag> tagOptional = tagRepository.getTagByName(name);
    if(tagOptional.isEmpty())
      throw new NotFoundException("Tag not found", name.toString(), "NAME");
    return tagOptional.get();
  }
  public List<Tag> getTags(List<String> names){
    TagSpecification tagSpecification = new TagSpecification();
    SearchCriteria<Tag, String> searchCriteria = new SearchCriteria<>(Tag_.name, names, SearchOperator.IN);
    tagSpecification.getConditions().add(searchCriteria);
    return tagRepository.findAll(tagSpecification);
  }
  public Page<Tag> getTagPage(TagFilterDTO tagFilterDTO, PageableDTO pageableDTO){
    TagSpecification tagSpecification = new TagSpecification();
    if(tagFilterDTO.getTagId() != null){
      SearchCriteria<Tag, Long> searchCriteria = new SearchCriteria<>(Tag_.tagId, tagFilterDTO.getTagId(), SearchOperator.EQUAL);
      tagSpecification.getConditions().add(searchCriteria);
    }
    if(tagFilterDTO.getName() != null){
      SearchCriteria<Tag, String> searchCriteria = new SearchCriteria<>(Tag_.name, tagFilterDTO.getName(), SearchOperator.LIKE);
      tagSpecification.getConditions().add(searchCriteria);
    }
    Pageable pageable = PageRequest.of(pageableDTO.getPage(),pageableDTO.getSize(), Sort.by(Tag_.NAME).ascending());
    return tagRepository.findAll(tagSpecification, pageable);

  }
  public ResponseEntity<ResponseDataDTO<TagDTO>> responseGetTags(TagFilterDTO tagFilterDTO, PageableDTO pageableDTO){
    return ResponseEntity.ok(ResponseTagMapper.toDTO(getTagPage(tagFilterDTO, pageableDTO)));
  }
  public List<TagDTO> getPopularTags(){
    List<Tag> tags = tagRepository.getPopularTags();
    List<TagDTO> tagDTOs = tags.stream().map(TagMapper::toDTO).toList();
    return tagDTOs;
  }
  public List<Tag> getFollowedTags(Long userId){
    Specification<Tag> followedUserJoin = TagSpecification.joinUsers(userId);
    return tagRepository.findAll(followedUserJoin);
  }

  public TagStatistics getTagStatistics(Long tagId){
    Tag tag = getTag(tagId);
    TagStatistics tagStatistics = new TagStatistics();
    tagStatistics.setAmountOfFollowers((long) tag.getFollowTagUsers().size());
    tagStatistics.setAmountOfPublishedJobs((long) tag.getJobTags().size());
    return tagStatistics;
  }
  public boolean isUserFollowed(Long userId, Long tagId){
    Tag tag = getTag(tagId);
    List<User> followedUsers = tag.getFollowTagUsers();
    return followedUsers.stream().anyMatch(user -> user.getUserId().equals(userId));
  }
  public boolean isCurrentUserFollowed(Long tagId){
    return isUserFollowed(myUserDetailsService.getCurrentUserId(), tagId);
  }
  public long getAmountOfTagFollow(Long userId){
    return getFollowedTags(userId).size();
  }
}
