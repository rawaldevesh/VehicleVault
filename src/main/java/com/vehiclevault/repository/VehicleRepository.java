package com.vehiclevault.repository;

import com.vehiclevault.entity.VehicleEntity;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


public interface VehicleRepository extends JpaRepository<VehicleEntity, Integer> {
	
	@Query("SELECT COUNT(v) FROM VehicleEntity v")
	long countAllVehicles();
	
    Optional<VehicleEntity> findByVehicleId(Integer vehicleId);

	List<VehicleEntity> findByVehicleStatus(String vehicleStatus);
	
	List<VehicleEntity> findByUserId(int userId);
	
	@Query("SELECT v.vehicleType, COUNT(v) FROM VehicleEntity v WHERE v.vehicleType IS NOT NULL GROUP BY v.vehicleType")
	List<Object[]> countVehiclesByType();
	
	
	long countByUserId(Integer userId);

	List<VehicleEntity> findByUserId(Integer userId);
	
	@Query(nativeQuery = true, value = "SELECT COUNT(*) FROM vehicles WHERE MONTH(listing_date) = :month AND user_id = :userId")
	Integer countThisMonthVehicleBySeller(@Param("month") Integer month, @Param("userId") Integer userId);
	
	@Query(nativeQuery = true, value = "SELECT COUNT(*) FROM vehicles WHERE MONTH(listing_date) = :month")
	Integer countThisMonthVehicle(@Param("month") Integer month);
	
	
	



	
	

    
}
