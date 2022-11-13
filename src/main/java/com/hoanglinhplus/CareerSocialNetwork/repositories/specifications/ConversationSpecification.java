package com.hoanglinhplus.CareerSocialNetwork.repositories.specifications;

import com.hoanglinhplus.CareerSocialNetwork.models.*;
import org.springframework.data.jpa.domain.Specification;

import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
import java.util.List;

public class ConversationSpecification extends EntitySpecification<Conversation> {
  public static Specification<Conversation> joinParticipant(User user){
    return (root, query, builder) ->{
      Join<Conversation, User> join = root.join(Conversation_.participants, JoinType.LEFT);
      query.distinct(true);
      return builder.equal(join.get(User_.userId),user.getUserId());
    };
  }
  public static Specification<Conversation> joinParticipants(List<Long> userIds){
    return (root, query, builder) ->{
      Join<Conversation, User> join = root.join(Conversation_.participants, JoinType.INNER);
      query.distinct(true);
      return join.get(User_.userId).in(userIds);
    };
  }
}
