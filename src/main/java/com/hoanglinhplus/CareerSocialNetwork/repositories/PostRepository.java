package com.hoanglinhplus.CareerSocialNetwork.repositories;

import com.hoanglinhplus.CareerSocialNetwork.models.Post;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public interface PostRepository extends JpaRepository<Post, Long>, JpaSpecificationExecutor<Post> {
  @Transactional
  @Modifying
  @Query("DELETE FROM Post p WHERE p.postId in :ids")
  void deletePostsByIds(@Param(value = "ids") List<Long> ids);

  @Query("SELECT p FROM Post p WHERE p.postId in :ids")
  List<Post> findPostsIds(@Param(value = "ids") List<Long> ids);

  @Query("SELECT p.postId FROM Post p WHERE p.postId in :ids")
  List<Long> findExistedIds(List<Long> ids);

  @Query(value = """
    select jobs.job_id, amount, created_at, deleted_at, end_date, experience,
    image, job_description, location, salary_max, salary_min, start_date,
    title, updated_at, company_id, employment_type_id, position_id, work_place_id from jobs
    inner join popular_jobs pj on jobs.job_id = pj.job_id
    limit 5
    """, nativeQuery = true)
  List<Post> getPopularPosts();
  @Query(value = """
    select * from
      (
      select distinct p.post_id
                    , p.content
                    , p.created_at
                    , p.deleted_at
                    , p.description
                    , p.image
                    , p.slug
                    , p.title
                    , p.updated_at
                    , p.user_id
                    , p.post_status
      from users
               inner join follow_tags on users.user_id = follow_tags.user_id
               inner join tags on follow_tags.tag_id = tags.tag_id
               inner join post_tags pt on tags.tag_id = pt.tag_id
               inner join posts p on pt.post_id = p.post_id
      where users.user_id = :userId
        and p.post_status = 'PUBLIC'
        and p.deleted_at is null
      union
      select distinct p2.post_id
                    , p2.content
                    , p2.created_at
                    , p2.deleted_at
                    , p2.description
                    , p2.image
                    , p2.slug
                    , p2.title
                    , p2.updated_at
                    , p2.user_id
                    , p2.post_status
      from users
          inner join follow_users fu
      on users.user_id = fu.following_id
          inner join posts p2 on fu.followed_id = p2.user_id
      where
          users.user_id = :userId and p2.deleted_at is null
          and p2.post_status = 'PUBLIC'
          ) uf
  order by uf.created_at desc
  limit :start ,:numberOfPostsPerPage
  """, nativeQuery = true)
  List<Post> getFollowedPosts(Long userId, int start, int numberOfPostsPerPage);
}