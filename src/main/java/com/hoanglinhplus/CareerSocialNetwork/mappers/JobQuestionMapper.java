package com.hoanglinhplus.CareerSocialNetwork.mappers;

import com.hoanglinhplus.CareerSocialNetwork.dto.job_question.JobQuestionDTO;
import com.hoanglinhplus.CareerSocialNetwork.models.Job;
import com.hoanglinhplus.CareerSocialNetwork.models.JobQuestion;
import org.modelmapper.Conditions;
import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;

public class JobQuestionMapper {
  static public JobQuestion toEntity(JobQuestionDTO jobQuestionDTO) {
    ModelMapper modelMapper = new ModelMapper();
    modelMapper.getConfiguration()
      .setMatchingStrategy(MatchingStrategies.STRICT)
      .setDeepCopyEnabled(true)
      .setPropertyCondition(Conditions.isNotNull());
    JobQuestion jobQuestion = modelMapper.map(jobQuestionDTO, JobQuestion.class);
    jobQuestion.setJob(Job.builder().jobId(jobQuestionDTO.getJobId()).build());
    return jobQuestion;
  }
  static public JobQuestionDTO toDTO(JobQuestion jobQuestion) {
    ModelMapper modelMapper = new ModelMapper();
    modelMapper.getConfiguration()
      .setMatchingStrategy(MatchingStrategies.STRICT)
      .setDeepCopyEnabled(true)
      .setPropertyCondition(Conditions.isNotNull());
    JobQuestionDTO jobQuestionDTO =  modelMapper.map(jobQuestion, JobQuestionDTO.class);
    jobQuestionDTO.setJobId(jobQuestion.getJob().getJobId());
    return jobQuestionDTO;
  }

}
