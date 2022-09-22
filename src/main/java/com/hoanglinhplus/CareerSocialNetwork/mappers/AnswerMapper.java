package com.hoanglinhplus.CareerSocialNetwork.mappers;

import com.hoanglinhplus.CareerSocialNetwork.dto.job_question.AnswerDTO;
import com.hoanglinhplus.CareerSocialNetwork.models.Answer;

public class AnswerMapper extends ModelMapperConfig{
  public static Answer toEntity(AnswerDTO answerDTO) {
    Answer answer = modelMapper.map(answerDTO, Answer.class);
    return answer;
  }
  public static AnswerDTO toDTO(Answer answer) {
    AnswerDTO answerDTO = modelMapper.map(answer, AnswerDTO.class);
    return answerDTO;
  }
}
