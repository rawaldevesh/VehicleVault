package com.vehiclevault.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "features")
public class FeaturesEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer featureId;
    
   
    private String featureName;
    
    
	public Integer getFeatureId() {
		return featureId;
	}
	public void setFeatureId(Integer featureId) {
		this.featureId = featureId;
	}
	public String getFeatureName() {
		return featureName;
	}
	public void setFeatureName(String featureName) {
		this.featureName = featureName;
	}
	
	

    

    
}
