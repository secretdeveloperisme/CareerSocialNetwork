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
    select jobs.job_id, amount, created_at, deleted_at, end_date, experience,
    image, job_description, location, salary_max, salary_min, start_date,
    title, updated_at, company_id, employment_type_id, position_id, work_place_id from jobs
    inner join popular_jobs pj on jobs.job_id = pj.job_id
    limit 5
    """, nativeQuery = true)
  List<Job> getPopularJobs();
  @Query(value = """
    select * from
      (select distinct j.job_id, j.amount, j.created_at, j.deleted_at,
          j.end_date, j.experience, j.image, j.job_description,
          j.location, j.salary_max, j.salary_min, j.start_date,
          j.title, j.updated_at, j.company_id, j.employment_type_id,
          j.position_id, j.work_place_id from users
          inner join follow_tags on users.user_id = follow_tags.user_id
          inner join tags on follow_tags.tag_id = tags.tag_id
          inner join job_tags jt on tags.tag_id = jt.tag_id
          inner join jobs j on jt.job_id = j.job_id
          where users.user_id = :userId  and j.deleted_at is null
      union
      select distinct j2.job_id, j2.amount, j2.created_at, j2.deleted_at,
          j2.end_date, j2.experience, j2.image, j2.job_description,
          j2.location, j2.salary_max, j2.salary_min, j2.start_date,
          j2.title, j2.updated_at, j2.company_id, j2.employment_type_id,
          j2.position_id, j2.work_place_id from users
          inner join follow_companies fc on users.user_id = fc.user_id
          inner join jobs j2 on fc.company_id = j2.company_id
          where users.user_id = :userId  and j2.deleted_at is null
          ) uf
  order by uf.created_at desc
  limit :start ,:numberOfJobsPerPage
  """, nativeQuery = true)
  List<Job> getFollowedJobs(Long userId, int start, int numberOfJobsPerPage);
}