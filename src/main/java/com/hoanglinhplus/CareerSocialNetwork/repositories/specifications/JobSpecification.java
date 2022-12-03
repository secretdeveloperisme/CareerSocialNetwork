package com.hoanglinhplus.CareerSocialNetwork.repositories.specifications;

import com.hoanglinhplus.CareerSocialNetwork.constants.ApplicationStatus;
import com.hoanglinhplus.CareerSocialNetwork.models.*;
import com.hoanglinhplus.CareerSocialNetwork.models.Job_;
import com.hoanglinhplus.CareerSocialNetwork.models.Skill_;
import com.hoanglinhplus.CareerSocialNetwork.models.Tag_;
import org.springframework.data.jpa.domain.Specification;

import javax.persistence.criteria.Join;
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
  public static Specification<Job> joinEmploymentType(List<Long> employmentTypeIds) {
    return (root, query, criteriaBuilder) -> {
      Join<Job, EmploymentType> join = root.join(Job_.employmentType, JoinType.LEFT);
      query.distinct(true);
      return join.get(EmploymentType_.employmentTypeId).in(employmentTypeIds);
    };
  }
  public static  Specification<Job> joinApplications(Long userId, ApplicationStatus applicationStatus){
    return (root, query, criteriaBuilder) -> {
      ListJoin<Job, Application> join = root.join(Job_.applications, JoinType.INNER);
      if(userId != null){
        return criteriaBuilder.equal(join.get(Application_.userId), userId);
      }else if(applicationStatus != null)
        return criteriaBuilder.equal(join.get(Application_.status), applicationStatus);
      return null;
    };
  }
}
