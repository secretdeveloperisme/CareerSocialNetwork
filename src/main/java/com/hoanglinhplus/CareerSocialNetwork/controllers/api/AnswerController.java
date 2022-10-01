package com.hoanglinhplus.CareerSocialNetwork.controllers.api;

import com.hoanglinhplus.CareerSocialNetwork.dto.job_question.AnswerDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.job_question.AnswerFilterDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.services.AnswerService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/answer")
public class AnswerController {
  private final AnswerService answerService;

  public AnswerController(AnswerService answerService) {
    this.answerService = answerService;
  }
  @PostMapping
  public ResponseEntity<ResponseObjectDTO> answer(@RequestBody AnswerDTO answerDTO){
    return answerService.create(answerDTO);
  }
  @PutMapping
  public ResponseEntity<ResponseObjectDTO> update(@RequestBody AnswerDTO answerDTO){
    return answerService.update(answerDTO);
  }
  @GetMapping("/get-answers")
  public ResponseEntity<ResponseObjectDTO> getAnswers(AnswerFilterDTO answerFilterDTO){
    return answerService.getAnswers(answerFilterDTO);
  }
  @DeleteMapping
  public ResponseEntity<ResponseObjectDTO> delete(@RequestBody AnswerDTO answerDTO){
    return answerService.delete(answerDTO);
  }
}
