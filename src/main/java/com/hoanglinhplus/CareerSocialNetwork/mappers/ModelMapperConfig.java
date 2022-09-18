package com.hoanglinhplus.CareerSocialNetwork.mappers;

import org.modelmapper.Conditions;
import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;

public class ModelMapperConfig {
  public static ModelMapper modelMapper;
  static {
     modelMapper = new ModelMapper();
     modelMapper.getConfiguration()
      .setMatchingStrategy(MatchingStrategies.STRICT)
      .setDeepCopyEnabled(true)
      .setPropertyCondition(Conditions.isNotNull());
  }
}
