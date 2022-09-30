package com.hoanglinhplus.CareerSocialNetwork.repositories.specifications;

import com.hoanglinhplus.CareerSocialNetwork.models.*;
import org.springframework.data.jpa.domain.Specification;

import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;

public class ConversationSpecification extends EntitySpecification<Conversation> {
  public static Specification<Conversation> joinParticipants(User user){
    return (root, query, builder) ->{
      Join<Conversation, User> join = root.join(Conversation_.participants, JoinType.LEFT);
      query.distinct(true);
      return builder.equal(join.get(User_.userId),user.getUserId());
    };
  }
}
