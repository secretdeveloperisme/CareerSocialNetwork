package com.hoanglinhplus.CareerSocialNetwork.controllers;

import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.services.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

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
  public ResponseEntity<ResponseObjectDTO> uploads(@RequestParam List<MultipartFile> files) {
    return fileService.uploadFiles(files);
  }

  @GetMapping("/images/**")
  public void getImage(HttpServletRequest request, HttpServletResponse response) {
    fileService.getImage(request, response);
  }

}
