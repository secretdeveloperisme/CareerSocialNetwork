package com.hoanglinhplus.CareerSocialNetwork.controllers.api;

import com.hoanglinhplus.CareerSocialNetwork.dto.PageableDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.company.CompanyCreationDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.company.CompanyFilterDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseDataDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.services.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import java.util.List;
import java.util.Map;


@RestController
@RequestMapping("/api/company")
@Validated
public class CompanyController {
  private final CompanyService companyService;

  @Autowired
  CompanyController(CompanyService companyService){
    this.companyService = companyService;
  }
  @PreAuthorize("hasAuthority('USER') or hasAuthority('ADMIN')")
  @GetMapping("/get-all-companies")
  public  ResponseEntity<ResponseDataDTO<CompanyCreationDTO>> getAllCompanies(
    @Valid CompanyFilterDTO companyFilterDTO, @Valid PageableDTO pageableDTO
  ){
    return companyService.responseGetAllCompanies(companyFilterDTO, pageableDTO);
  }
  @PreAuthorize("hasAuthority('USER') or hasAuthority('ADMIN')")
  @GetMapping("/get-own-companies")
  public ResponseEntity<ResponseDataDTO<CompanyCreationDTO>> getOwnCompanies(
    @Valid CompanyFilterDTO companyFilterDTO, @Valid PageableDTO pageableDTO
  ){
    return companyService.responseGetOwnCompanies(companyFilterDTO, pageableDTO);
  }

  @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
  @GetMapping("/get-company")
  public ResponseEntity<ResponseObjectDTO> getCompany(
    @RequestParam @NotNull Long id){
    return companyService.responseGetCompany(id);
  }
  @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
  @PostMapping(produces = MediaType.APPLICATION_JSON_VALUE)
  public ResponseEntity<ResponseObjectDTO> createCompany(@RequestBody @Valid CompanyCreationDTO companyCreationDTO){
    return companyService.createCompany(companyCreationDTO);
  }
  @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
  @PutMapping(produces = MediaType.APPLICATION_JSON_VALUE)
  public ResponseEntity<ResponseObjectDTO> updateCompany(@RequestBody @Valid CompanyCreationDTO companyCreationDTO){
    return companyService.updateCompany(companyCreationDTO);
  }
  @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
  @DeleteMapping(produces = MediaType.APPLICATION_JSON_VALUE)
  public ResponseEntity<ResponseObjectDTO> deleteCompany(@RequestBody Map<String, Long> params){
    return companyService.deleteCompany(params.get("companyId"));
  }
  @PreAuthorize("hasAuthority('ADMIN')")
  @DeleteMapping(path = "/many",produces = MediaType.APPLICATION_JSON_VALUE)
  public ResponseEntity<ResponseObjectDTO> deleteCompanies(@RequestBody List<Long> ids) {
    return companyService.deleteCompanies(ids,true,true);
  }
  @PreAuthorize("hasAuthority('ADMIN') or hasAnyAuthority('USER')")
  @DeleteMapping(path = "/user-many",produces = MediaType.APPLICATION_JSON_VALUE)
  public ResponseEntity<ResponseObjectDTO> deleteOwnCompanies(@RequestBody List<Long> ids) {
    return companyService.deleteCompanies(ids,false, false);
  }

}