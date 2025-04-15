package com.vehiclevault.repository;

import com.vehiclevault.entity.CityEntity;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CityRepository extends JpaRepository<CityEntity, Integer> {
	
	    List<CityEntity> findByStateId(Integer stateId);
	    
	    
	
	
}
