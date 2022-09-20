package com.hoanglinhplus.CareerSocialNetwork.repositories;

import com.hoanglinhplus.CareerSocialNetwork.models.CommentLike;
import com.hoanglinhplus.CareerSocialNetwork.models.CommentLikeId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

@Repository
public interface CommentLikeRepository
  extends JpaRepository<CommentLike, CommentLikeId>, JpaSpecificationExecutor<CommentLike> {
}
