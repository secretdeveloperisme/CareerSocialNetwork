package com.hoanglinhplus.CareerSocialNetwork.repositories.specifications;


import lombok.Getter;
import org.jetbrains.annotations.NotNull;
import org.springframework.data.jpa.domain.Specification;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;


@Getter
public class EntitySpecification<T> implements Specification<T> {
  private final List<SearchCriteria> conditions;
  public EntitySpecification(){
    this.conditions = new ArrayList<>();
  }
  @Override
  public Predicate toPredicate(@NotNull Root<T> root, @NotNull CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
    List<Predicate> predicates = new ArrayList<>();
    conditions.forEach(condition->{
      if(condition.getOperator().equals(SearchOperator.EQUAL)){
        predicates.add(criteriaBuilder.equal(
          root.get(condition.getColumn()),condition.getValue()
        ));
      } else if (condition.getOperator().equals(SearchOperator.LIKE)) {
        predicates.add(criteriaBuilder.like(criteriaBuilder.lower(root.get(condition.getColumn()))
          , "%"+condition.getValue().toString().toLowerCase()+"%"));
      }
    });
    return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
  }
}