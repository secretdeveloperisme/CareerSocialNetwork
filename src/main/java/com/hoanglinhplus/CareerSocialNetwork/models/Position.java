package com.hoanglinhplus.CareerSocialNetwork.models;


import lombok.*;

import javax.persistence.*;
import java.util.List;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "positions")
public class Position {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "position_id")
  private Long positionId;
  private String name;
  @OneToMany(mappedBy = "position", cascade = {CascadeType.PERSIST, CascadeType.MERGE})
  private List<Job> job;

}