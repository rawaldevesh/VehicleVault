package com.vehiclevault.repository;

import com.vehiclevault.entity.InsuranceEntity;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface InsuranceRepository extends JpaRepository<InsuranceEntity, Integer>{
	
	List<InsuranceEntity> findByInsuranceId(Integer InsuranceId);

	
}	
