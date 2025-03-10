package com.vehiclevault.repository;

import com.vehiclevault.entity.FeaturesEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface FeaturesRepository extends JpaRepository<FeaturesEntity, Integer> {
    List<FeaturesEntity> findByVehicle_VehicleId(Integer vehicleId);
}
