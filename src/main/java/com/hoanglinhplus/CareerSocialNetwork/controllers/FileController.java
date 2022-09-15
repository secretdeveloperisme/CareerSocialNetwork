package com.hoanglinhplus.CareerSocialNetwork.controllers;

import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.services.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RestController
@RequestMapping("/file")
@Validated
public class FileController {
  private final FileService fileService;
  @Autowired
  public FileController(FileService fileService) {
    this.fileService = fileService;
  }

  @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
  @PostMapping("/upload")
  public ResponseEntity<ResponseObjectDTO> upload(MultipartFile file) {
    return fileService.uploadFile(file);
  }

  @GetMapping("/images/**")
  public void getImage(HttpServletRequest request, HttpServletResponse response) {
    fileService.getImage(request, response);
  }

}
