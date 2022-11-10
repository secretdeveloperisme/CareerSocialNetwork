package com.hoanglinhplus.CareerSocialNetwork.repositories;

import com.hoanglinhplus.CareerSocialNetwork.models.User;
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
public interface UserRepository extends JpaRepository<User, Long>, JpaSpecificationExecutor<User> {
  Optional<User> findByUsername(String username);

  @Transactional
  @Modifying
  Long deleteByUsername(String username);
  @Transactional
  @Modifying
  @Query("DELETE FROM User u WHERE u.userId in :ids")
  void deleteUsersByIds(@Param(value = "ids") List<Long> ids);
  @Query("SELECT u FROM User u WHERE u.userId in :ids")
  List<User> findUsersByIds(@Param(value = "ids") List<Long> ids);

  @Query("SELECT u.userId FROM User u WHERE u.userId in :ids")
  List<Long> findExistedIds(List<Long> ids);
  @Query("SELECT u.userId FROM User u WHERE u.username = :username")
  Long findIdByUsername(String username);

  @Query(value = """
    select count(following_id) from follow_users
    where followed_id = :followedId
  """, nativeQuery = true)
  long getAmountOfFollowers(Long followedId);
}