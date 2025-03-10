package com.vehiclevault.repository;

import com.vehiclevault.entity.InsuranceEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface InsuranceRepository extends JpaRepository<InsuranceEntity, Integer> {
    Optional<InsuranceEntity> findByVehicle_VehicleId(Integer vehicleId);
}
