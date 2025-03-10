package com.vehiclevault.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "cities")
public class CityEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer cityId;
    private String cityName;
    
   
    private Integer stateId;
    private String stateName;
    
    
	public Integer getCityId() {
		return cityId;
	}
	public void setCityId(Integer cityId) {
		this.cityId = cityId;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	
		public Integer getStateId() {
			return stateId;
		}
		public void setStateId(Integer stateId) {
			this.stateId = stateId;
		}
		public String getStateName() {
			return stateName;
		}
		public void setStateName(String stateName) {
			this.stateName = stateName;
		}

	
	
    

}
