package com.hoanglinhplus.CareerSocialNetwork;

import com.hoanglinhplus.CareerSocialNetwork.dto.EducationDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.user.UserCreationDTO;
import com.hoanglinhplus.CareerSocialNetwork.mappers.UserMapper;
import com.hoanglinhplus.CareerSocialNetwork.models.User;
import com.hoanglinhplus.CareerSocialNetwork.services.TagService;
import com.hoanglinhplus.CareerSocialNetwork.utils.DateUtil;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Arrays;
import java.util.List;

@SpringBootTest
class CareerSocialNetworkApplicationTests {
  @Autowired
  private TagService tagService;
  @Test
  void contextLoads() {

  }
  @Test
  void createUserTest(){
    List<Long> roleIds = Arrays.asList(1L, 2L, 3L);
    List<Long> skillIds = Arrays.asList(1L, 2L, 3L);
    List<EducationDTO> educationDTOS = Arrays.asList(
      EducationDTO.builder().educationId(1l).schoolName("CTU").startDate(DateUtil.toDateFromString("2000/11/11"))
        .endDate(DateUtil.toDateFromString("2022/11/12")).build()
    );
    UserCreationDTO userCreationDTO = UserCreationDTO.builder().userId(1L)
      .username("hoanglinh").password("abcxyz")
      .roleIds(roleIds)
      .userSkillIds(skillIds)
      .educations(educationDTOS)
      .build();
    User user = UserMapper.toEntity(userCreationDTO);
    System.out.println();
  }
  @Test
  public void testTag(){
    List<String> tags = Arrays.asList("tag1", "tag2", "tag3", "tag4");
    tagService.createTags(tags);
  }

}
