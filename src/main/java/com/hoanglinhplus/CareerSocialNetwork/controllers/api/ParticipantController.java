package com.hoanglinhplus.CareerSocialNetwork.controllers.api;

import com.hoanglinhplus.CareerSocialNetwork.dto.chat.ParticipantDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.services.ParticipantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/chat/participant")
public class ParticipantController {
  private final ParticipantService participantService;

  @Autowired
  public ParticipantController(ParticipantService participantService) {
    this.participantService = participantService;
  }
  @PostMapping
  public ResponseEntity<ResponseObjectDTO> addParticipant(@RequestBody ParticipantDTO participant) {
    return participantService.addParticipant(participant);
  }
  @DeleteMapping
  public ResponseEntity<ResponseObjectDTO> removeParticipant(@RequestBody ParticipantDTO participant) {
    return participantService.removeParticipant(participant);
  }
}
