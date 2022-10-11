package com.hoanglinhplus.CareerSocialNetwork.controllers.api;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.services.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

@RestController
@RequestMapping("/api/file")
@Validated
public class FileController {
  private final FileService fileService;
  @Autowired
  public FileController(FileService fileService) {
    this.fileService = fileService;
  }

//  @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
  @PostMapping("/upload/many")
  public ResponseEntity<ResponseObjectDTO> uploads(@RequestParam("files") List<MultipartFile> files) {
    return fileService.uploadFiles(files);
  }
  @PostMapping("/upload")
  public ResponseEntity<ResponseObjectDTO> uploads(@RequestParam("file") MultipartFile file) {
    return fileService.uploadFiles(Collections.singletonList(file));
  }


  @GetMapping("/images/**")
  public void getImage(HttpServletRequest request, HttpServletResponse response) {
    fileService.getImage(request, response);
  }

}
