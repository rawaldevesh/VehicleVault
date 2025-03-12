package com.vehiclevault.repository;

import com.vehiclevault.entity.InquiryEntity;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface InquiryRepository extends JpaRepository<InquiryEntity, Integer> {
	
	
	@Query(value = "select i.message,i.inquiry_date,i.inquiry_id ,u.user_id, u.first_name,u.last_name,u.contact_num,u.email, v.model from users u , vehicles v, inquiries i where i.vehicle_id = v.vehicle_id and i.user_id = u.user_id;",nativeQuery = true)
	List<Object[]> getAll();
    
}
