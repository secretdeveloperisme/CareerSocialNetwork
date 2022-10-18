package com.hoanglinhplus.CareerSocialNetwork.repositories.specifications;


import lombok.Getter;
import org.springframework.data.jpa.domain.Specification;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.persistence.metamodel.SingularAttribute;
import java.util.ArrayList;
import java.util.List;


@Getter
public class EntitySpecification<T> implements Specification<T> {
  private final List<SearchCriteria> conditions;
  public EntitySpecification(){
    this.conditions = new ArrayList<>();
  }
  @Override
  public Predicate toPredicate( Root<T> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
    List<Predicate> predicates = new ArrayList<>();
    conditions.forEach(condition->{
      if(condition.getOperator().equals(SearchOperator.EQUAL)){
        predicates.add(criteriaBuilder.equal(
          root.get((SingularAttribute)condition.getColumn()),condition.getValue()
        ));
      } else if (condition.getOperator().equals(SearchOperator.LIKE)) {
        predicates.add(criteriaBuilder.like(criteriaBuilder.lower(root.get((SingularAttribute)condition.getColumn()))
          , "%"+condition.getValue().toString().toLowerCase()+"%"));
      } else if (condition.getOperator().equals(SearchOperator.IN)) {
        predicates.add(root.get((SingularAttribute)condition.getColumn()).in(condition.getValue()));
      } else if (condition.getOperator().equals(SearchOperator.LESS_EQUAL)) {
        predicates.add(criteriaBuilder.lessThanOrEqualTo((root.get((SingularAttribute)condition.getColumn())),(Comparable)condition.getValue()));
      } else if(condition.getOperator().equals(SearchOperator.GREATER_EQUAL)){
        predicates.add(criteriaBuilder.greaterThanOrEqualTo(root.get((SingularAttribute)condition.getColumn()),(Comparable)condition.getValue()));
      } else if (condition.getOperator().equals(SearchOperator.LESS_THEN)){
        predicates.add(criteriaBuilder.lessThan(root.get((SingularAttribute)condition.getColumn()),(Comparable)condition.getValue()));
      } else if (condition.getOperator().equals(SearchOperator.GREATER)){
        predicates.add(criteriaBuilder.greaterThan(root.get((SingularAttribute)condition.getColumn()),(Comparable)condition.getValue()));
      }else if (condition.getOperator().equals(SearchOperator.NOT_NULL)){
        predicates.add(criteriaBuilder.isNotNull(root.get((SingularAttribute)condition.getColumn())));
      }else if (condition.getOperator().equals(SearchOperator.NULL)){
        predicates.add(criteriaBuilder.isNull(root.get((SingularAttribute)condition.getColumn())));
      }

    });

    return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
  }
}