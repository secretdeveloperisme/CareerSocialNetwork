package com.hoanglinhplus.CareerSocialNetwork.repositories.specifications;

import com.hoanglinhplus.CareerSocialNetwork.models.*;
import com.hoanglinhplus.CareerSocialNetwork.models.Job_;
import com.hoanglinhplus.CareerSocialNetwork.models.Skill_;
import com.hoanglinhplus.CareerSocialNetwork.models.Tag_;
import org.springframework.data.jpa.domain.Specification;

import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.ListJoin;
import java.util.List;

public class JobSpecification extends EntitySpecification<Job>{
  public static Specification<Job> joinTags(List<Long> tagIds) {
    return (root, query, criteriaBuilder) -> {
      ListJoin<Job, Tag> join = root.join(Job_.tags, JoinType.LEFT);
      query.distinct(true);
      return join.get(Tag_.tagId).in(tagIds);
    };
  }
  public static Specification<Job> joinSkills(List<Long> skillIds) {
    return (root, query, criteriaBuilder) -> {
      ListJoin<Job, Skill> join = root.join(Job_.jobSkills, JoinType.LEFT);
      query.distinct(true);
      return join.get(Skill_.skillId).in(skillIds);
    };
  }
}
