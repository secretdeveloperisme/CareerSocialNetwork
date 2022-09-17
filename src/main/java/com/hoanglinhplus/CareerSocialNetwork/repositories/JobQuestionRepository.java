package com.hoanglinhplus.CareerSocialNetwork.repositories;

import com.hoanglinhplus.CareerSocialNetwork.models.JobQuestion;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface JobQuestionRepository extends JpaRepository<JobQuestion, Long> {
  List<JobQuestion> findAllByJobJobId(Long jobId);

  List<JobQuestion> findAllByQuestionQuestionId(Long questionId);
}
