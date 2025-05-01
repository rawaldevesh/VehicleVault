package com.vehiclevault.repository;

import com.vehiclevault.entity.InquiryEntity;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface InquiryRepository extends JpaRepository<InquiryEntity, Integer> {
	
	
	@Query(value = "select i.message,i.inquiry_date,i.inquiry_id ,u.user_id, u.first_name,u.last_name,u.contact_num,u.email, v.model, i.inquiry_status,v.user_id from users u , vehicles v, inquiries i where i.vehicle_id = v.vehicle_id and i.user_id = u.user_id;",nativeQuery = true)
	List<Object[]> getAll();
	
	@Query("SELECT COUNT(i) FROM InquiryEntity i")
	long countAllInquiries();
	
	@Query("SELECT i.inquiryStatus, COUNT(i) FROM InquiryEntity i WHERE i.inquiryStatus IS NOT NULL GROUP BY i.inquiryStatus")
	List<Object[]> countInquiriesByStatus();
	
	long countByUserId(Integer userId);
	
	@Query(nativeQuery = true, value = """
		    SELECT COUNT(*) 
		    FROM inquiries i 
		    JOIN vehicles v ON i.vehicle_id = v.vehicle_id 
		    WHERE MONTH(i.inquiry_date) = :month 
		      AND v.user_id = :sellerId
		""")
		Integer countThisMonthInquiriesBySeller(@Param("month") Integer month, @Param("sellerId") Integer sellerId);

	@Query(nativeQuery = true, value = """
		    SELECT COUNT(*) 
		    FROM inquiries i 
		    JOIN vehicles v ON i.vehicle_id = v.vehicle_id 
		    WHERE v.user_id = :sellerId
		""")
		Integer countTotalInquiriesBySeller(@Param("sellerId") Integer sellerId);

	@Query(nativeQuery = true, value = "SELECT COUNT(*) FROM inquiries WHERE MONTH(Inquiry_date) = :month")
	Integer countThisMonthInquiry(@Param("month") Integer month);



    
}
