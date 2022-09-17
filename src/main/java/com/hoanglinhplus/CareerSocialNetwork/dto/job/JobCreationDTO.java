package com.hoanglinhplus.CareerSocialNetwork.dto.job;

import com.hoanglinhplus.CareerSocialNetwork.constants.NumberConstant;
import com.hoanglinhplus.CareerSocialNetwork.dto.SkillDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.TagDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.company.CompanyCreationDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.job_question.JobQuestionDTO;
import com.hoanglinhplus.CareerSocialNetwork.models.*;
import lombok.*;

import java.util.Date;
import java.util.List;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class JobCreationDTO {
  private Long jobId;
  private String title;
  private String jobDescription;
  private String image;
  private String location;
  private int amount = NumberConstant.NO_SET;
  private Date startDate;
  private Date endDate;
  private int salaryMin = NumberConstant.MIN_VALUE;
  private int salaryMax = NumberConstant.MAX_VALUE;
  private Date createdAt;
  private Date updatedAt;
  private Date deletedAt;
  private int experience = NumberConstant.NO_SET;
  private List<TagDTO> tags;
  private List<JobQuestionDTO> jobQuestion;
  private List<SkillDTO> jobSkills;
  private EmploymentTypeDTO employmentType;
  private CompanyCreationDTO company;
  private PositionDTO position;
  private WorkPlaceDTO workPlace;
}
