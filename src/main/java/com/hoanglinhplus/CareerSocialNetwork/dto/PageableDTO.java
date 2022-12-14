package com.hoanglinhplus.CareerSocialNetwork.dto;

import com.hoanglinhplus.CareerSocialNetwork.constants.PageConstant;
import lombok.*;

import javax.validation.constraints.Min;
import javax.validation.constraints.Pattern;
import java.util.ArrayList;
import java.util.List;

@ToString
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PageableDTO{
  @Builder.Default
  @Min(value = 1, message = "page must be greater or equal than 0")
  private Integer page = PageConstant.DEFAULT_CURRENT_PAGE;
  @Min(value = 1,message = "size of page must be greater than 0")
  @Builder.Default
  private Integer size = PageConstant.DEFAULT_MAX_ELEMENT;
  private List<
    @Pattern(regexp = "(?=.{3,255})(\\w+(-_\\.)?\\w+)"
      ,message = "the pattern of sort must be username_asc or username_desc and have length 5-255 characters") String> sort = new ArrayList<>();
}