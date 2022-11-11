package com.hoanglinhplus.CareerSocialNetwork.constants;

public enum CompanyRoleId {
  CREATOR(1L), HR(2L);
  private Long value;
  CompanyRoleId(Long value) {
    this.value = value;
  }
  public Long getValue(){
    return value;
  }
}
