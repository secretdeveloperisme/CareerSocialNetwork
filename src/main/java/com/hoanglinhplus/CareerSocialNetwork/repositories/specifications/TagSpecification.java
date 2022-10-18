package com.hoanglinhplus.CareerSocialNetwork.repositories.specifications;

import com.hoanglinhplus.CareerSocialNetwork.models.Tag;
import com.hoanglinhplus.CareerSocialNetwork.models.Tag_;
import com.hoanglinhplus.CareerSocialNetwork.models.User;
import com.hoanglinhplus.CareerSocialNetwork.models.User_;
import org.springframework.data.jpa.domain.Specification;

import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.ListJoin;

public class TagSpecification extends EntitySpecification<Tag>{
  public static Specification<Tag> joinUsers(Long userId) {
    return (root, query, criteriaBuilder) -> {
      ListJoin<Tag, User> join = root.join(Tag_.followTagUsers, JoinType.LEFT);
      query.distinct(true);
      return criteriaBuilder.equal(join.get(User_.userId), userId);
    };
  }

}
