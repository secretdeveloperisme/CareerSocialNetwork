package com.hoanglinhplus.CareerSocialNetwork.repositories;

import com.hoanglinhplus.CareerSocialNetwork.models.AttachmentType;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface AttachmentTypeRepository extends JpaRepository<AttachmentType, Long> {
  Optional<AttachmentType> findAttachmentTypeByType(String type);
}
