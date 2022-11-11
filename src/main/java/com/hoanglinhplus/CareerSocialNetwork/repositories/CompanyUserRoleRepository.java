package com.hoanglinhplus.CareerSocialNetwork.repositories;

import com.hoanglinhplus.CareerSocialNetwork.models.CompanyUserRole;
import com.hoanglinhplus.CareerSocialNetwork.models.CompanyUserRoleId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

@Repository
public interface CompanyUserRoleRepository extends JpaRepository<CompanyUserRole, CompanyUserRoleId>, JpaSpecificationExecutor<CompanyUserRole> {
}
