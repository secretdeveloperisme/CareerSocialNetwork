package com.hoanglinhplus.CareerSocialNetwork.repositories;

import com.hoanglinhplus.CareerSocialNetwork.models.Answer;
import com.hoanglinhplus.CareerSocialNetwork.models.AnswerId;
import com.hoanglinhplus.CareerSocialNetwork.models.projection.AnswerQuestionInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AnswerRepository extends JpaRepository<Answer, AnswerId>, JpaSpecificationExecutor<Answer> {
  @Query(value = """
  select jq.job_id as jobId, a.user_id as userId, a.answer, q.question_id as questionId, jq.job_que_id as jobQueId, q.content from
  (questions q inner join job_question jq on q.question_id = jq.question_id
  left join
  (select a.user_id, a.answer, a.job_que_id from answers a where a.user_id = :userId ) a on a.job_que_id = jq.job_que_id)
  where jq.job_id = :jobId
  
  """, nativeQuery = true)
  List<AnswerQuestionInfo> getAnswerQuestions(@Param("userId") Long userId, @Param("jobId") Long jobId);
}
