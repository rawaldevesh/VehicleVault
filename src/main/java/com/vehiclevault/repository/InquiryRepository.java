package com.vehiclevault.repository;

import com.vehiclevault.entity.InquiryEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface InquiryRepository extends JpaRepository<InquiryEntity, Integer> {
    
}
