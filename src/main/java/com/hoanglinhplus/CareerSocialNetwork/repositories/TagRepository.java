package com.hoanglinhplus.CareerSocialNetwork.repositories;

import com.hoanglinhplus.CareerSocialNetwork.models.Tag;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface TagRepository extends JpaRepository<Tag, Long>, JpaSpecificationExecutor<Tag> {
  boolean existsTagByNameContainingIgnoreCase(String name);
  Optional<Tag> getTagByName(String name);
  @Query("SELECT t.tagId FROM Tag t WHERE t.tagId in :ids")
  List<Long> findExistedIds(List<Long> ids);
  @Query(value = "select tags.tag_id, tags.name, count(jt.job_id) as number_of_jobs " +
    "from tags join job_tags jt on tags.tag_id = jt.tag_id " +
    "group by tags.tag_id, tags.name " +
    "order by number_of_jobs desc " +
    "limit 10", nativeQuery = true)
  List<Tag> getPopularTags();
}
