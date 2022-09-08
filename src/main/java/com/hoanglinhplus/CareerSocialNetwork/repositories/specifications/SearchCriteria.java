package com.hoanglinhplus.CareerSocialNetwork.repositories.specifications;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.metamodel.SingularAttribute;

@AllArgsConstructor
@Getter @Setter

public class SearchCriteria<E, T> {
  private SingularAttribute<E,T> column;
  private Object value;
  private SearchOperator operator;
}
