package com.vehiclevault.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "features")
public class FeaturesEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer featureId;
    
    private Integer vehicleId;
    private String frtureName;
    
    
	public Integer getFeatureId() {
		return featureId;
	}
	public void setFeatureId(Integer featureId) {
		this.featureId = featureId;
	}
	public Integer getVehicleId() {
		return vehicleId;
	}
	public void setVehicleId(Integer vehicleId) {
		this.vehicleId = vehicleId;
	}
	public String getFrtureName() {
		return frtureName;
	}
	public void setFrtureName(String frtureName) {
		this.frtureName = frtureName;
	}

    

    
}
