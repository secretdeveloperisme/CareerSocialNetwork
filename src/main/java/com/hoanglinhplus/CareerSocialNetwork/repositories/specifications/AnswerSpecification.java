package com.hoanglinhplus.CareerSocialNetwork.repositories.specifications;

import com.hoanglinhplus.CareerSocialNetwork.models.*;
import org.springframework.data.jpa.domain.Specification;

import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;

public class AnswerSpecification extends EntitySpecification<Answer> {
  public static Specification<Answer> joinJobQuestion(Long jobId){
    return (root, query, builder)->{
      Join<Answer, JobQuestion> answerJobQuestion = root.join(Answer_.jobQuestion, JoinType.LEFT);
      query.distinct(true);
      return builder.equal(answerJobQuestion.get(JobQuestion_.job), Job.builder().jobId(jobId).build());
    };
  }
}
