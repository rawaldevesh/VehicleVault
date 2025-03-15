package com.vehiclevault.repository;

import com.vehiclevault.entity.InsuranceEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface InsuranceRepository extends JpaRepository<InsuranceEntity, Integer>{
	
	
}
