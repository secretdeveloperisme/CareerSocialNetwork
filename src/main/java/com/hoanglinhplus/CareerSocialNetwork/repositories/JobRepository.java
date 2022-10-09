package com.hoanglinhplus.CareerSocialNetwork.repositories;

import com.hoanglinhplus.CareerSocialNetwork.models.Company;
import com.hoanglinhplus.CareerSocialNetwork.models.Job;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public interface JobRepository extends JpaRepository<Job, Long>, JpaSpecificationExecutor<Job> {
  @Transactional
  @Modifying
  @Query("DELETE FROM Job j WHERE j.jobId in :ids")
  void deleteJobsByIds(@Param(value = "ids") List<Long> ids);

  @Query("SELECT j FROM Job j WHERE j.jobId in :ids")
  List<Company> findJobsIds(@Param(value = "ids") List<Long> ids);

  @Query("SELECT j.jobId FROM Job j WHERE j.jobId in :ids")
  List<Long> findExistedIds(List<Long> ids);

  @Query(value = """
    select l.job_id, count(l.job_id) as numberOfLikes from jobs
    inner join likes l on jobs.job_id = l.job_id
    group by l.job_id
    order by numberOfLikes desc
    limit 5
    """, nativeQuery = true)
  List<Job> getPopularJobs();
}