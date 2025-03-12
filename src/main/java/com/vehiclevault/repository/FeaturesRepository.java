package com.vehiclevault.repository;

import com.vehiclevault.entity.FeaturesEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FeaturesRepository extends JpaRepository<FeaturesEntity, Integer> {
  
}
