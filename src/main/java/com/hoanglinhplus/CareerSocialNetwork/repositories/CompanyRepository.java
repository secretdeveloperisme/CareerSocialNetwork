package com.hoanglinhplus.CareerSocialNetwork.repositories;

import com.hoanglinhplus.CareerSocialNetwork.models.Company;
import com.hoanglinhplus.CareerSocialNetwork.models.projection.PopularCompanyInfo;
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
public interface CompanyRepository extends JpaRepository<Company, Long>, JpaSpecificationExecutor<Company> {
  Optional<Company> findCompanyByName(String name);
  @Transactional
  @Modifying
  @Query("DELETE FROM Company c WHERE c.companyId in :ids")
  void deleteCompaniesByIds(@Param(value = "ids") List<Long> ids);
  @Query("SELECT c FROM Company c WHERE c.companyId in :ids")
  List<Company> findCompanyIds(@Param(value = "ids") List<Long> ids);

  @Query("SELECT c.companyId FROM Company c WHERE c.companyId in :ids")
  List<Long> findExistedIds(List<Long> ids);
  @Query("SELECT c.companyId FROM Company c WHERE c.name = :name")
  Long findIdByCompanyName(String name);
  @Query(value = """
    select c.company_id as companyId , c.created_at as createdAt ,c.user_id as userId
    ,c.industry_id as industryId, c.name as name, deleted_at as deletedAt, logo,organization_size_id as organizationSizeId
    ,c.tag_line as tagLine, updated_at as updatedAt, website, number_of_follows as numberOfFollows
    from companies c join popular_companies pc on c.company_id = pc.company_id;
    """, nativeQuery = true)
  List<PopularCompanyInfo> getPopularCompanies();


}