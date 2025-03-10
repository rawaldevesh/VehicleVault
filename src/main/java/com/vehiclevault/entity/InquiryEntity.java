package com.vehiclevault.entity;

import java.time.LocalDate;

import jakarta.persistence.*;

@Entity
@Table(name = "inquiries")
public class InquiryEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer inquiryId;
    private Integer vehicleId;
    private LocalDate inquiryDate;
    private  String inquiryStatus;
    private String message;
    
    
    
    @PrePersist
    protected void onCreate() {
        this.inquiryDate = LocalDate.now(); // Set the date when saving
    }
    
	public Integer getInquiryId() {
		return inquiryId;
	}
	public void setInquiryId(Integer inquiryId) {
		this.inquiryId = inquiryId;
	}
	public Integer getVehicleId() {
		return vehicleId;
	}
	public void setVehicleId(Integer vehicleId) {
		this.vehicleId = vehicleId;
	}
	public LocalDate getInquiryDate() {
		return inquiryDate;
	}
	public void setInquiryDate(LocalDate localDate) {
		this.inquiryDate = localDate;
	}
	public String getInqueryStatus() {
		return inquiryStatus;
	}
	public void setInqueryStatus(String inquiryStatus) {
		this.inquiryStatus = inquiryStatus;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
    
    
    
    

}
