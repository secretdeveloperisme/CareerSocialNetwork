package com.hoanglinhplus.CareerSocialNetwork.models;

import lombok.*;

import javax.persistence.*;
import java.util.List;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "work_places")
public class WorkPlace {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "work_place_id", nullable = false)
  private Long workPlaceId;
  @Column(name = "place", nullable = false)
  private String place;
  @OneToMany(mappedBy = "workPlace")
  List<Job> jobs;
}