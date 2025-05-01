package com.vehiclevault.repository;

import com.vehiclevault.entity.ReviewEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ReviewRepository extends JpaRepository<ReviewEntity, Integer> {
    List<ReviewEntity> findByVehicle_VehicleId(Integer vehicleId);
    List<ReviewEntity> findByUser_UserId(Integer userId);
    
    
    
}
