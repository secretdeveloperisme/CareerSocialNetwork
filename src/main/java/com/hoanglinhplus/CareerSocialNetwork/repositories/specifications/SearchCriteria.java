package com.hoanglinhplus.CareerSocialNetwork.repositories.specifications;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@AllArgsConstructor
@Getter @Setter
public class SearchCriteria {
  private String column;
  private Object value;
  private SearchOperator operator;
}
