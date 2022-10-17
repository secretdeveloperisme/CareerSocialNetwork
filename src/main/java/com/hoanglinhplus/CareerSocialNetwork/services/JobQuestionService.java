package com.hoanglinhplus.CareerSocialNetwork.services;

import com.hoanglinhplus.CareerSocialNetwork.dto.job_question.JobQuestionDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.job_question.QuestionDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.NotFoundException;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.PermissionDeniedException;
import com.hoanglinhplus.CareerSocialNetwork.mappers.JobQuestionMapper;
import com.hoanglinhplus.CareerSocialNetwork.mappers.QuestionMapper;
import com.hoanglinhplus.CareerSocialNetwork.models.JobQuestion;
import com.hoanglinhplus.CareerSocialNetwork.models.Question;
import com.hoanglinhplus.CareerSocialNetwork.repositories.JobQuestionRepository;
import com.hoanglinhplus.CareerSocialNetwork.repositories.QuestionRepository;
import com.hoanglinhplus.CareerSocialNetwork.securities.MyUserDetailsService;
import com.hoanglinhplus.CareerSocialNetwork.securities.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public class JobQuestionService {
  private final QuestionRepository questionRepository;
  private final JobQuestionRepository jobQuestionRepository;
  private final PermissionService permissionService;
  private final MyUserDetailsService myUserDetailsService;

  @Autowired
  public JobQuestionService(QuestionRepository questionRepository, JobQuestionRepository jobQuestionRepository, PermissionService permissionService, MyUserDetailsService myUserDetailsService) {
    this.questionRepository = questionRepository;
    this.jobQuestionRepository = jobQuestionRepository;
    this.permissionService = permissionService;

    this.myUserDetailsService = myUserDetailsService;
  }

  public ResponseEntity<ResponseObjectDTO> createQuestion(JobQuestionDTO jobQuestionDTO){
    if(!(permissionService.isAdmin()
      || (permissionService.isUser() && permissionService.isOwnerJob(myUserDetailsService.getCurrentUserId()
      , jobQuestionDTO.getJobId() ))))
      throw new PermissionDeniedException("you dont have permission to create job question.");
    JobQuestion jobQuestion = JobQuestionMapper.toEntity(jobQuestionDTO);
    JobQuestion savedQuestion = jobQuestionRepository.save(jobQuestion);
    Map<String, Object> responseData = new HashMap<>();
    JobQuestionDTO savedJobQuestionDTO = JobQuestionMapper.toDTO(savedQuestion);
    responseData.put("question", savedJobQuestionDTO);
    ResponseObjectDTO responseObjectDTO = new ResponseObjectDTO("Create Job Question Successfully",responseData);
    return ResponseEntity.ok(responseObjectDTO);
  }
  public ResponseEntity<ResponseObjectDTO> responseGetQuestion(Long questionId) {
    Optional<Question> questionOptional = questionRepository.findById(questionId);
    if (questionOptional.isPresent()) {
      Question question = questionOptional.get();
      QuestionDTO  questionDTO = QuestionMapper.toDTO(question);
      Map<String, Object> responseData = new HashMap<>();
      responseData.put("question", questionDTO);
      ResponseObjectDTO responseObjectDTO = new ResponseObjectDTO("Get Question Successfully", responseData);
      return ResponseEntity.ok(responseObjectDTO);
    }
    else {
      throw new NotFoundException("Question not found", questionId.toString(), "ID");
    }
  }
  public ResponseEntity<ResponseObjectDTO> updateQuestion(QuestionDTO questionDTO) {
    Optional<Question> questionOptional = questionRepository.findById(questionDTO.getQuestionId());
    if (questionOptional.isPresent()) {
      Question question = questionOptional.get();
      if(questionDTO.getContent() != null) {
        question.setContent(questionDTO.getContent());
      }
      Question updatedQuestion = questionRepository.save(question);
      QuestionDTO updatedQuestionDTO = QuestionMapper.toDTO(updatedQuestion);
      Map<String, Object> responseData = new HashMap<>();
      responseData.put("question", updatedQuestionDTO);
      ResponseObjectDTO responseObjectDTO = new ResponseObjectDTO("Updated Question Successfully", responseData);
      return ResponseEntity.ok(responseObjectDTO);
    }
    else {
      throw new NotFoundException("Question not found", questionDTO.getQuestionId().toString(), "ID");
    }
  }
  public Question getQuestion(Long questionId) {
    Optional<Question> questionOptional = questionRepository.findById(questionId);
    if (questionOptional.isPresent()) {
      return questionOptional.get();
    }
    throw new NotFoundException("Question not found", questionId.toString(), "ID");
  }
  public ResponseEntity<ResponseObjectDTO> getQuestionByJobId(Long jobId) {
    List<JobQuestion> jobQuestions = jobQuestionRepository.findAllByJobJobId(jobId);
    List<Question> questions = jobQuestions.stream().map(JobQuestion::getQuestion).toList();
    List<QuestionDTO> questionDTOS = questions.stream().map(QuestionMapper::toDTO).toList();
    Map<String, Object> responseData = new HashMap<>();
    responseData.put("questions", questionDTOS);
    ResponseObjectDTO responseObjectDTO = new ResponseObjectDTO("Get Questions Successfully", responseData);
    return ResponseEntity.ok(responseObjectDTO);
  }
  public ResponseEntity<ResponseObjectDTO> deleteQuestion(Long questionId) {
    Question question = getQuestion(questionId);
    if(question.getJobQuestion() != null && question.getJobQuestion().size() > 0) {
      JobQuestion jobQuestion = question.getJobQuestion().get(0);
      if(!(permissionService.isAdmin()
        || (permissionService.isUser() && permissionService.isOwnerJob(myUserDetailsService.getCurrentUserId()
        , jobQuestion.getJob().getJobId()))))
        throw new PermissionDeniedException("You do not have permission to delete this question.");
      jobQuestionRepository.delete(jobQuestion);
      Map<String, Object> responseData = new HashMap<>();
      responseData.put("deleted questions", questionId);
      ResponseObjectDTO responseObjectDTO = new ResponseObjectDTO("delete Questions Successfully", responseData);
      return ResponseEntity.ok(responseObjectDTO);
    }
    throw new PermissionDeniedException("you dont have permission to delete job question.");
  }
}
