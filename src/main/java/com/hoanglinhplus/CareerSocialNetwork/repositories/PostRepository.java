package com.hoanglinhplus.CareerSocialNetwork.repositories;

import com.hoanglinhplus.CareerSocialNetwork.models.Post;
import com.hoanglinhplus.CareerSocialNetwork.models.projection.PopularPostInfo;
import com.hoanglinhplus.CareerSocialNetwork.models.projection.statistics.AmountsPerMonth;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Repository
public interface PostRepository extends JpaRepository<Post, Long>, JpaSpecificationExecutor<Post> {


  Optional<Post> findPostBySlugIgnoreCase(String slug);
  @Transactional
  @Modifying
  @Query("DELETE FROM Post p WHERE p.postId in :ids")
  void deletePostsByIds(@Param(value = "ids") List<Long> ids);

  @Query("SELECT p FROM Post p WHERE p.postId in :ids")
  List<Post> findPostsIds(@Param(value = "ids") List<Long> ids);

  @Query("SELECT p.postId FROM Post p WHERE p.postId in :ids")
  List<Long> findExistedIds(List<Long> ids);

  @Query(value = """
    select  posts.post_id, content, created_at, deleted_at, description
    ,image, slug, title, updated_at, user_id, post_status, number_of_like from posts
    inner join popular_posts pp on posts.post_id = pp.post_id
    limit 5
    """, nativeQuery = true)
  List<Post> getPopularPosts();
  @Query(value = """
    select  posts.post_id as postId, content, created_at as createdAt, deleted_at as deletedAt, description
    ,image, slug, title, updated_at as updatedAt, user_id as userId, post_status as postStatus
    ,number_of_like as numberOfLikes from posts
    inner join popular_posts pp on posts.post_id = pp.post_id
    limit 5
    """, nativeQuery = true)
  List<PopularPostInfo> getPopularPostsInfo();
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
  @Query(value = """
    select count(*) from
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
  """, nativeQuery = true)
  long countFollowedPosts(Long userId);
  @Query(value = "SELECT month, amount_of_posts as amount" +
    " from amount_posts_per_month_in_current_year", nativeQuery = true)
  List<AmountsPerMonth> getAmountsPerMonth();
}