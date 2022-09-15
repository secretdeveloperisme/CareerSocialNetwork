package com.hoanglinhplus.CareerSocialNetwork.services;

import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.NotFoundException;
import com.hoanglinhplus.CareerSocialNetwork.securities.MyUserDetailsService;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

@Service
public class FileService {
  private final MyUserDetailsService myUserDetailsService;
  private final String staticFolder = "src/main/resources/static";
  private final String uploadFolder = "images/upload";

  public FileService(MyUserDetailsService myUserDetailsService) {
    this.myUserDetailsService = myUserDetailsService;
  }
  public ResponseEntity<ResponseObjectDTO> uploadFile(MultipartFile file){
    Long userId = myUserDetailsService.getCurrentUserId();
    String currentDirectory = new File("").getAbsolutePath();
    try {
      Path createdDirPath = createDirectory(currentDirectory, userId.toString());
      String fileName = generateUniqueFileName(generateUniqueFileName(file.getOriginalFilename()));
      Path filePath = Paths.get(createdDirPath.toString(), fileName);
      String filepathString = "/file" + "/" + uploadFolder + "/" + userId + "/" + fileName;
      FileOutputStream fileOutputStream = new FileOutputStream(filePath.toFile());
      fileOutputStream.write(file.getBytes());
      fileOutputStream.flush();
      Map<String, Object> responseData = new HashMap<>();
      responseData.put("filePath", filepathString );
      return ResponseEntity.ok(new ResponseObjectDTO("upload file successfully ",responseData));
    }
    catch (FileNotFoundException e) {
      throw new NotFoundException("File not found", file.getOriginalFilename(), "name");
    }
    catch (IOException e) {
      e.printStackTrace();
    }
    return ResponseEntity.ok(new ResponseObjectDTO("upload file failed ",null));
  }
  public Path createDirectory(String parentDir, String name) throws IOException {
    Path path = Paths.get(parentDir,staticFolder, uploadFolder, name);
    if(!Files.exists(path)){
      Files.createDirectories(path);
    }
    return path;
  }
  public String generateUniqueFileName(String name) {
    return System.currentTimeMillis()+ "_" + name ;
  }

  public void getImage(HttpServletRequest request, HttpServletResponse response)  {
    try {
      String imagePath = request.getServletPath();
      imagePath = imagePath.substring(imagePath.indexOf("images"));
      OutputStream outputStream = response.getOutputStream();
      File file = new File(staticFolder+"/"+imagePath);
      Path filePath = file.toPath();
      String mimeType = Files.probeContentType(filePath);

      response.setContentType(mimeType);
      InputStream fileInputStream = new FileInputStream(file);
      BufferedInputStream bufferedInputStream = new BufferedInputStream(fileInputStream);
      BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(outputStream);
      while (bufferedInputStream.available() > 0) {
        bufferedOutputStream.write(bufferedInputStream.read());
      }
      bufferedInputStream.close();
      bufferedOutputStream.close();
      outputStream.close();
      fileInputStream.close();
    } catch (IOException e) {
      throw new RuntimeException("There was an error IO exception");
    }
  }
}
