package com.hoanglinhplus.CareerSocialNetwork.controllers;

import com.hoanglinhplus.CareerSocialNetwork.dto.job_question.JobQuestionDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.job_question.QuestionDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.services.JobQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/job-question")
public class JobQuestionController {
  private final JobQuestionService jobQuestionService;
  @Autowired
  public JobQuestionController(JobQuestionService jobQuestionService) {
    this.jobQuestionService = jobQuestionService;
  }

  @GetMapping("/get-job-questions")
  @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
  public ResponseEntity<ResponseObjectDTO> getJobQuestions(@RequestParam Long jobId){
    return jobQuestionService.getQuestionByJobId(jobId);
  }

  @PostMapping
  @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
  public ResponseEntity<ResponseObjectDTO> createJobQuestion(@RequestBody JobQuestionDTO jobQuestionDTO){
    return jobQuestionService.createQuestion(jobQuestionDTO);
  }

  @PutMapping
  @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
  public ResponseEntity<ResponseObjectDTO> updateJobQuestion(@RequestBody QuestionDTO jobQuestionDTO){
    return jobQuestionService.updateQuestion(jobQuestionDTO);
  }

  @DeleteMapping
  @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
  public ResponseEntity<ResponseObjectDTO> deleteJobQuestion(@RequestParam Long questionId){
    return jobQuestionService.deleteQuestion(questionId);
  }

}
