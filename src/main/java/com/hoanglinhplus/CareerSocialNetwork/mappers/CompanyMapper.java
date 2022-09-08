package com.hoanglinhplus.CareerSocialNetwork.mappers;

import com.hoanglinhplus.CareerSocialNetwork.dto.company.CompanyCreationDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.IndustryDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.OrganizationSizeDTO;
import com.hoanglinhplus.CareerSocialNetwork.models.Company;
import com.hoanglinhplus.CareerSocialNetwork.models.Industry;
import com.hoanglinhplus.CareerSocialNetwork.models.OrganizationSize;
import com.hoanglinhplus.CareerSocialNetwork.models.User;
import org.modelmapper.Conditions;
import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.stereotype.Component;

@Component
public class CompanyMapper {
  static public Company toEntity(CompanyCreationDTO companyCreationDTO) {
    ModelMapper modelMapper = new ModelMapper();
    modelMapper.getConfiguration()
      .setMatchingStrategy(MatchingStrategies.STRICT)
      .setDeepCopyEnabled(true)
      .setPropertyCondition(Conditions.isNotNull());
    Company company = modelMapper.map(companyCreationDTO, Company.class);
    IndustryDTO industryDTO = companyCreationDTO.getIndustry();
    if(industryDTO != null){
      company.setIndustry(Industry.builder()
        .industryId(industryDTO.getIndustryId()).name(industryDTO.getName()).build());
    }
    OrganizationSizeDTO organizationSizeDTO = companyCreationDTO.getOrganizationSize();
    if(organizationSizeDTO != null){
      company.setOrganizationSizes(OrganizationSize.builder()
        .organizationId(organizationSizeDTO.getOrganizationId()).name(organizationSizeDTO.getName()).build());
    }
    if(companyCreationDTO.getUserId() != null){
      company.setCreatedUser(User.builder().userId(companyCreationDTO.getUserId()).build());
    }
    return company;
  }
  static public CompanyCreationDTO toDTO(Company company) {
    ModelMapper modelMapper = new ModelMapper();
    modelMapper.getConfiguration()
      .setMatchingStrategy(MatchingStrategies.STRICT)
      .setDeepCopyEnabled(true)
      .setPropertyCondition(Conditions.isNotNull());
    CompanyCreationDTO companyCreationDTO = modelMapper.map(company, CompanyCreationDTO.class);
    OrganizationSize organizationSize = company.getOrganizationSize();
    companyCreationDTO.setOrganizationSize(
      new OrganizationSizeDTO(organizationSize.getOrganizationId(), organizationSize.getName())
    );
    Industry industry = company.getIndustry();
    companyCreationDTO.setIndustry(new IndustryDTO(industry.getIndustryId(), industry.getName()));
    companyCreationDTO.setUserId(company.getCreatedUser().getUserId());
    return companyCreationDTO;
  }
}
