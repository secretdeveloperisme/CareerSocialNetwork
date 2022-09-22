package com.hoanglinhplus.CareerSocialNetwork.services;

import com.hoanglinhplus.CareerSocialNetwork.dto.job_question.AnswerDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.job_question.AnswerFilterDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.NotFoundException;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.PermissionDeniedException;
import com.hoanglinhplus.CareerSocialNetwork.mappers.AnswerMapper;
import com.hoanglinhplus.CareerSocialNetwork.models.Answer;
import com.hoanglinhplus.CareerSocialNetwork.models.Answer_;
import com.hoanglinhplus.CareerSocialNetwork.repositories.AnswerRepository;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.AnswerSpecification;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.SearchCriteria;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.SearchOperator;
import com.hoanglinhplus.CareerSocialNetwork.securities.MyUserDetailsService;
import com.hoanglinhplus.CareerSocialNetwork.securities.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public class AnswerService {
  private final AnswerRepository answerRepository;
  private final MyUserDetailsService myUserDetailsService;
  private final PermissionService permissionService;
  @Autowired
  public AnswerService(AnswerRepository answerRepository, MyUserDetailsService myUserDetailsService, PermissionService permissionService) {
    this.answerRepository = answerRepository;
    this.myUserDetailsService = myUserDetailsService;
    this.permissionService = permissionService;
  }
  public ResponseEntity<ResponseObjectDTO> getAnswers(AnswerFilterDTO answerFilterDTO) {
    Specification<Answer> answerSpecification = null;
    if(answerFilterDTO.getJobId() != null) {
      answerSpecification = AnswerSpecification.joinJobQuestion(answerFilterDTO.getJobId());
    }
    if(answerFilterDTO.getUserId() != null) {
      AnswerSpecification answerUserSpecification = new AnswerSpecification();
      SearchCriteria<Answer, Long> searchCriteria = new SearchCriteria<>(Answer_.userId, answerFilterDTO.getUserId(), SearchOperator.EQUAL);
      answerUserSpecification.getConditions().add(searchCriteria);
      assert answerSpecification != null;
      answerSpecification = answerSpecification.and(answerUserSpecification);
    }
    List<Answer> answers = answerRepository.findAll(answerSpecification);
    List<AnswerDTO> answerDTOS = answers.stream().map(AnswerMapper::toDTO).toList();
    Map<String,Object> responseData = new HashMap<>();
    responseData.put("answers", answerDTOS);
    return ResponseEntity.ok(new ResponseObjectDTO("Get answers by JobId successfully", responseData));
  }
  public Answer getAnswer(AnswerDTO answerDTO) {
    AnswerSpecification answerSpecification = new AnswerSpecification();
    if(answerDTO.getUserId() != null){
      SearchCriteria<Answer, Long> userCriteria = new SearchCriteria<>(Answer_.userId, answerDTO.getUserId(), SearchOperator.EQUAL);
      answerSpecification.getConditions().add(userCriteria);
    }
    SearchCriteria<Answer, Long> questionCriteria = new SearchCriteria<>(Answer_.jobQueId, answerDTO.getJobQueId(), SearchOperator.EQUAL);
    answerSpecification.getConditions().add(questionCriteria);
    Optional<Answer> answerOptional = answerRepository.findOne(answerSpecification);
    if (answerOptional.isPresent())
      return answerOptional.get();
    throw new NotFoundException("Answer not found","[%s][%s]".formatted(answerDTO.getUserId()
      ,answerDTO.getJobQueId()), "[userId][JobQuestionId]");
  }
  public ResponseEntity<ResponseObjectDTO> create(AnswerDTO answerDTO){
    Long currentUserId = myUserDetailsService.getCurrentUserId();
    answerDTO.setUserId(currentUserId);
    Answer answer = AnswerMapper.toEntity(answerDTO);
    Answer newAnswer = answerRepository.save(answer);
    Map<String, Object> responseData = new HashMap<>();
    AnswerDTO newAnswerDTO = AnswerMapper.toDTO(newAnswer);
    responseData.put("answer", newAnswerDTO);
    return ResponseEntity.ok(new ResponseObjectDTO("Create Answer Successfully", responseData));
  }
  public ResponseEntity<ResponseObjectDTO> update(AnswerDTO answerDTO) {
    Long currentUserId = myUserDetailsService.getCurrentUserId();
    answerDTO.setUserId(currentUserId);
    Answer answer = getAnswer(answerDTO);
    if (answerDTO.getAnswer() != null && answerDTO.getAnswer().length() > 0) {
      answer.setAnswer(answerDTO.getAnswer());
      Answer savedAnswer = answerRepository.save(answer);
      AnswerDTO savedAnswerDTO = AnswerMapper.toDTO(savedAnswer);
      Map<String, Object> responseData = new HashMap<>();
      responseData.put("answer", savedAnswerDTO);
      return ResponseEntity.ok(new ResponseObjectDTO("Update Answer Successfully", responseData));
    }
    return ResponseEntity.badRequest().body(ResponseObjectDTO.builder().message("Nothing To Change").build());
  }
  public ResponseEntity<ResponseObjectDTO> delete(AnswerDTO answerDTO) {
    Long currentUserId = myUserDetailsService.getCurrentUserId();
    answerDTO.setUserId(currentUserId);
    Answer answer = getAnswer(answerDTO);
    if(permissionService.isAdmin() || (permissionService.isUser() && permissionService.isOwnerAnswer(answer))) {
      answerRepository.delete(answer);
      return ResponseEntity.ok(ResponseObjectDTO.builder().message("Delete Answer Successfully").build());
    }
    throw new PermissionDeniedException("You do not have permission to delete this answer.");
  }
}
