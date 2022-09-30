package com.hoanglinhplus.CareerSocialNetwork.repositories;

import com.hoanglinhplus.CareerSocialNetwork.models.Message;
import com.hoanglinhplus.CareerSocialNetwork.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

public interface MessageRepository extends JpaRepository<Message, Long>, JpaSpecificationExecutor<Message> {
  Optional<Message> findByMessage(String message);
  @Transactional
  @Modifying
  @Query("DELETE FROM Message m WHERE m.messageId in :ids")
  void deleteMessagesByIds(@Param(value = "ids") List<Long> ids);

  @Query("SELECT m FROM Message m WHERE m.messageId in :ids")
  List<User> findMessagesByIds(@Param(value = "ids") List<Long> ids);

  @Query("SELECT m.messageId FROM Message m WHERE m.messageId in :ids")
  List<Long> findExistedIds(List<Long> ids);
}
