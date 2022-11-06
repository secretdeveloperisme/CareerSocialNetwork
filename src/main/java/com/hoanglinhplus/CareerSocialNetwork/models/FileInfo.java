package com.hoanglinhplus.CareerSocialNetwork.models;

import lombok.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class FileInfo {
  private String fileName;
  private String filePath;
  private String mimeType;
}
