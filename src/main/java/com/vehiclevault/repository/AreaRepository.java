package com.vehiclevault.repository;

import com.vehiclevault.entity.AreaEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AreaRepository extends JpaRepository<AreaEntity, Integer> {
    
}
