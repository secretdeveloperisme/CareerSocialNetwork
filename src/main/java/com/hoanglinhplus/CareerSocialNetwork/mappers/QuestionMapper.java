package com.hoanglinhplus.CareerSocialNetwork.mappers;

import com.hoanglinhplus.CareerSocialNetwork.dto.job_question.QuestionDTO;
import com.hoanglinhplus.CareerSocialNetwork.models.Question;
import org.modelmapper.Conditions;
import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;

public class QuestionMapper {
  static public Question toEntity(QuestionDTO questionDTO) {
    ModelMapper modelMapper = new ModelMapper();
    modelMapper.getConfiguration()
      .setMatchingStrategy(MatchingStrategies.STRICT)
      .setDeepCopyEnabled(true)
      .setPropertyCondition(Conditions.isNotNull());
    Question question = modelMapper.map(questionDTO, Question.class);
    return question;
  }
  static public QuestionDTO toDTO(Question question) {
    ModelMapper modelMapper = new ModelMapper();
    modelMapper.getConfiguration()
      .setMatchingStrategy(MatchingStrategies.STRICT)
      .setDeepCopyEnabled(true)
      .setPropertyCondition(Conditions.isNotNull());
    QuestionDTO questionDTO = modelMapper.map(question, QuestionDTO.class);
    return questionDTO;
  }
}
