package com.hoanglinhplus.CareerSocialNetwork.services;

import com.hoanglinhplus.CareerSocialNetwork.models.Tag;
import com.hoanglinhplus.CareerSocialNetwork.models.Tag_;
import com.hoanglinhplus.CareerSocialNetwork.repositories.TagRepository;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.SearchCriteria;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.SearchOperator;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.TagSpecification;
import org.jetbrains.annotations.NotNull;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@Service
public class TagService {
  private final TagRepository tagRepository;

  public TagService(TagRepository tagRepository) {
    this.tagRepository = tagRepository;
  }

  public void createTag(String name){
    if(tagRepository.existsTagByNameContainingIgnoreCase(name)){
      tagRepository.save( Tag.builder().name(name).build());
    }
  }
  @Transactional
  public List<Tag> createTags(@NotNull List<String> tagNames){
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
  public List<Tag> getTags(List<String> names){
    TagSpecification tagSpecification = new TagSpecification();
    SearchCriteria<Tag, String> searchCriteria = new SearchCriteria<>(Tag_.name, names, SearchOperator.IN);
    tagSpecification.getConditions().add(searchCriteria);
    return tagRepository.findAll(tagSpecification);
  }
}
