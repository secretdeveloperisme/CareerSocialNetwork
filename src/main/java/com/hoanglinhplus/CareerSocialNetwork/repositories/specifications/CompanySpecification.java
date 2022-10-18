package com.hoanglinhplus.CareerSocialNetwork.repositories.specifications;

import com.hoanglinhplus.CareerSocialNetwork.models.Company;
import com.hoanglinhplus.CareerSocialNetwork.models.Company_;
import com.hoanglinhplus.CareerSocialNetwork.models.User;
import com.hoanglinhplus.CareerSocialNetwork.models.User_;
import org.springframework.data.jpa.domain.Specification;

import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.ListJoin;


public class CompanySpecification  extends EntitySpecification<Company> {
  public static Specification<Company> joinFollowedUsers(Long userId){
    return (root, query, criteriaBuilder) -> {
      ListJoin<Company, User> join = root.join(Company_.follow_companies, JoinType.LEFT);
      query.distinct(true);
      return criteriaBuilder.equal(join.get(User_.USER_ID), userId);
    };
  }

}