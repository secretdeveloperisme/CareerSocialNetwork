package com.hoanglinhplus.CareerSocialNetwork.constants;

public enum CompanyRoleName {
  CREATOR(1L), HR(4L);
  private Long value;
  CompanyRoleName(Long value) {
    this.value = value;
  }
  public Long getValue(){
    return value;
  }
}
