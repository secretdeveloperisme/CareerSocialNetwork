package com.hoanglinhplus.CareerSocialNetwork;

import com.hoanglinhplus.CareerSocialNetwork.dto.EducationDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.UserCreationDTO;
import com.hoanglinhplus.CareerSocialNetwork.mappers.UserMapper;
import com.hoanglinhplus.CareerSocialNetwork.models.User;
import com.hoanglinhplus.CareerSocialNetwork.utils.DateUtil;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Arrays;
import java.util.List;

@SpringBootTest
class CareerSocialNetworkApplicationTests {
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
      .username("hoanglinh").passwordHash("abcxyz")
      .roleIds(roleIds)
      .userSkills(skillIds)
      .educations(educationDTOS)
      .build();
    User user = UserMapper.toEntity(userCreationDTO);
    System.out.println();
  }

}
