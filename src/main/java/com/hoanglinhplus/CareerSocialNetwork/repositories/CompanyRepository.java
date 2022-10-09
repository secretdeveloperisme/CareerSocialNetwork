package com.hoanglinhplus.CareerSocialNetwork.repositories;

import com.hoanglinhplus.CareerSocialNetwork.models.Company;
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
    select c.company_id as company_id, c.created_at,c.user_id
    ,c.industry_id, c.name, deleted_at, logo,organization_size_id
    ,c.tag_line, updated_at, website, count(c.company_id) as number_of_follows
    from companies c join follow_companies fc on c.company_id = fc.company_id
    group by c.company_id
    order by number_of_follows desc
    limit 10
    """, nativeQuery = true)
  List<Company> getPopularCompanies();
}