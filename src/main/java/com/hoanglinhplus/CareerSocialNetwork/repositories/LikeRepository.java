package com.hoanglinhplus.CareerSocialNetwork.repositories;

import com.hoanglinhplus.CareerSocialNetwork.models.Like;
import com.hoanglinhplus.CareerSocialNetwork.models.LikeId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeRepository extends JpaRepository<Like, LikeId>, JpaSpecificationExecutor<Like> {
}
