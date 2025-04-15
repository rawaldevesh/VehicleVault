package com.vehiclevault.repository;

import com.vehiclevault.entity.AreaEntity;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface AreaRepository extends JpaRepository<AreaEntity, Integer> {
	
	
	List<AreaEntity> findByCityId(Integer cityId);
	
	List<AreaEntity> findByAreaId(Integer areaId);
}
