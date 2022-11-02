package com.hoanglinhplus.CareerSocialNetwork.repositories.specifications;

import com.hoanglinhplus.CareerSocialNetwork.models.Post;
import com.hoanglinhplus.CareerSocialNetwork.models.Post_;
import com.hoanglinhplus.CareerSocialNetwork.models.Tag;
import com.hoanglinhplus.CareerSocialNetwork.models.Tag_;
import org.springframework.data.jpa.domain.Specification;

import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.ListJoin;
import java.util.List;

public class PostSpecification extends EntitySpecification<Post>{
  public static Specification<Post> joinTags(List<Long> tagIds) {
    return (root, query, criteriaBuilder) -> {
      ListJoin<Post, Tag> join = root.join(Post_.tags, JoinType.LEFT);
      query.distinct(true);
      return join.get(Tag_.tagId).in(tagIds);
    };
  }

}
