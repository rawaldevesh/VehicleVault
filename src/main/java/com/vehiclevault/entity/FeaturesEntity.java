package com.vehiclevault.entity;

import java.util.List;

import jakarta.persistence.*;

@Entity
@Table(name = "features")
public class FeaturesEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer featureId;
    
   
    private String featureName;
    
    @ManyToMany(mappedBy = "featuresEntities")
    private List<VehicleEntity> vehicles;

    
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
