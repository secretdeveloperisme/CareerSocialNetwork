package com.hoanglinhplus.CareerSocialNetwork.exceptions;

import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseErrorDTO;
import javax.validation.ConstraintViolationException;
import org.springframework.data.mapping.PropertyReferenceException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindException;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

@ControllerAdvice
public class ExceptionController {
  @ExceptionHandler({MyUsernameNotFoundException.class})
  public ResponseEntity<ResponseErrorDTO> handleUsernameNotFound(MyUsernameNotFoundException e){
    Map<String, Object> causes = new HashMap<>();
    causes.put("username", e.getUsername());
    return ResponseEntity.status(HttpStatus.NOT_FOUND)
      .body(new ResponseErrorDTO(e.getMessage(), causes));
  }
  @ExceptionHandler({UserNameExistedException.class})
  public ResponseEntity<ResponseErrorDTO> handleUsernameExisted(UserNameExistedException e){
    Map<String, Object> causes = new HashMap<>();
    causes.put("existedUsername", e.getExistedUsername());
    return ResponseEntity.status(HttpStatus.CONFLICT)
      .body(new ResponseErrorDTO(e.getMessage(), causes));
  }
  @ExceptionHandler({MethodArgumentNotValidException.class})
  public ResponseEntity<ResponseErrorDTO> handleValidation(MethodArgumentNotValidException e){
    Map<String, Object> causes = e.getAllErrors().stream().collect(Collectors.toMap(objectError ->
      ((FieldError)(objectError)).getField(),ObjectError::getDefaultMessage));
    ResponseErrorDTO responseErrorDTO = new ResponseErrorDTO(
      "user's input is not valid"
      ,causes);
    return ResponseEntity.status(HttpStatus.UNPROCESSABLE_ENTITY)
      .body(responseErrorDTO);
  }
  @ExceptionHandler({InputNotValidException.class})
  public ResponseEntity<ResponseErrorDTO> handleInvalidInput(InputNotValidException e){
    return ResponseEntity.status(HttpStatus.UNPROCESSABLE_ENTITY)
      .body(new ResponseErrorDTO(e.getMessage(), e.getCauses()));
  }
  @ExceptionHandler({ConstraintViolationException.class})
  public ResponseEntity<ResponseErrorDTO> handleConstraintViolation(ConstraintViolationException e){
    Map<String, Object> causes = new HashMap<>();
    e.getConstraintViolations().forEach(constraintViolation -> {
      causes.put(constraintViolation.getPropertyPath().toString().split("\\.")[1],constraintViolation.getMessage());
    });
    return ResponseEntity.status(HttpStatus.UNPROCESSABLE_ENTITY).body(
      new ResponseErrorDTO("parameter is not valid", causes)
    );
  }
  @ExceptionHandler({IllegalArgumentException.class})
  public ResponseEntity<ResponseErrorDTO> handleInvalidInput(IllegalArgumentException e){
    Map<String, Object> causes = new HashMap<>();
    causes.put("cause", e.getMessage());
    return ResponseEntity.status(HttpStatus.UNPROCESSABLE_ENTITY)
      .body(new ResponseErrorDTO("user's input is not valid", causes));
  }
  @ExceptionHandler({PropertyReferenceException.class})
  public ResponseEntity<ResponseErrorDTO> handlePropertyReference(PropertyReferenceException e){
    Map<String, Object> causes = new HashMap<>();
    causes.put("inValidColumnName", e.getPropertyName());
    return ResponseEntity.ok(new ResponseErrorDTO("column name is not valid in sort by", causes));
  }
  @ExceptionHandler({BindException.class})
  public ResponseEntity<ResponseErrorDTO> handleValidation(BindException e){
    Map<String, Object> causes = e.getAllErrors().stream().collect(Collectors.toMap(objectError ->
      ((FieldError)objectError).getField(), ObjectError::getDefaultMessage));
    ResponseErrorDTO responseErrorDTO = new ResponseErrorDTO(
      "user's input is not valid"
      ,causes);
    return ResponseEntity.status(HttpStatus.UNPROCESSABLE_ENTITY)
      .body(responseErrorDTO);
  }

}