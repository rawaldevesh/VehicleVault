package com.vehiclevault.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "insurance")
public class InsuranceEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer insuranceId;

    private String insuranceType;



	public Integer getInsuranceId() {
		return insuranceId;
	}



	public void setInsuranceId(Integer insuranceId) {
		this.insuranceId = insuranceId;
	}



	public String getInsuranceType() {
		return insuranceType;
	}



	public void setInsuranceType(String insuranceType) {
		this.insuranceType = insuranceType;
	}
  
    
    

}
