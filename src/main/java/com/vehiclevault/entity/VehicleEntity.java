package com.vehiclevault.entity;

import java.math.BigDecimal;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.*;

@Entity
@Table(name = "vehicles")
public class VehicleEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer vehicleId;

    private String make;
    private String vehicleType;
    private String model;
    private Integer year;
    private String variant;
    private Double mileage;
    private	String fuelType;
    private	String transmissionType;
    private	BigDecimal price;
    private	String color;
    private	String description;
    private	String status;
    private LocalDate listingDate;
    private String registrationNum;
    private	Integer userId;
    @Column(name = "city_id")
    private	Integer cityId;
    @Column(name = "area_id")
    private	Integer areaId;
    @Column(name = "state_id")
    private	Integer stateId;
    private	Date registrationYear;
    
//    @Column(name = "insurance_id")
//    private Integer insuranceId;  // Foreign key column storing insuranceId
  
    private List<Integer> featureIds;
    private	String seats;
    private	String kmsDriven;
    private	String rTO;
    private	String ownerShip;
    private	String engineDisplacement;
    private	String numberofBags;
    private String carPicPath;
    private String vehicleStatus = "PENDING"; // default when seller adds
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "state_id", insertable = false, updatable = false)
    private StateEntity state;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "city_id", insertable = false, updatable = false)
    private CityEntity city;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "area_id", insertable = false, updatable = false)
    private AreaEntity area;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "insurance_id", referencedColumnName = "insuranceId")
    private InsuranceEntity insurance;  // Full InsuranceEntity object

 // Correct the ManyToMany relationship here (list of features)
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "vehicle_features", 
        joinColumns = @JoinColumn(name = "vehicle_id"), 
        inverseJoinColumns = @JoinColumn(name = "feature_id")
    )
    private List<FeaturesEntity> featuresEntities = new ArrayList<>(); // Use List to store multiple features

    // Getters and setters

    public List<FeaturesEntity> getFeaturesEntities() {
        return featuresEntities;
    }

    public void setFeaturesEntities(List<FeaturesEntity> featuresEntities) {
        this.featuresEntities = featuresEntities;
    }
    
    
	public InsuranceEntity getInsurance() {
		return insurance;
	}
	public void setInsurance(InsuranceEntity insurance) {
	    this.insurance = insurance;
	}

	public Integer getVehicleId() {
		return vehicleId;
	}
	public void setVehicleId(Integer vehicleId) {
		this.vehicleId = vehicleId;
	}
	public String getMake() {
		return make;
	}
	public void setMake(String make) {
		this.make = make;
	}
	public String getModel() {
		return model;
	}
	
	public String getVehicleType() {
		return vehicleType;
	}

	public void setVehicleType(String vehicleType) {
		this.vehicleType = vehicleType;
	}

	public void setModel(String model) {
		this.model = model;
	}
	public Integer getYear() {
		return year;
	}
	public void setYear(Integer year) {
		this.year = year;
	}
	public String getVariant() {
		return variant;
	}
	public void setVariant(String variant) {
		this.variant = variant;
	}
	public Double getMileage() {
		return mileage;
	}
	public void setMileage(Double mileage) {
		this.mileage = mileage;
	}
	public String getFuelType() {
		return fuelType;
	}
	public void setFuelType(String fuelType) {
		this.fuelType = fuelType;
	}
	public String getTransmissionType() {
		return transmissionType;
	}
	public void setTransmissionType(String transmissionType) {
		this.transmissionType = transmissionType;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public LocalDate getListingDate() {
		return listingDate;
	}
	public void setListingDate(LocalDate localDate) {
		this.listingDate = localDate;
	}
	public String getRegistrationNum() {
		return registrationNum;
	}
	public void setRegistrationNum(String registrationNum) {
		this.registrationNum = registrationNum;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getCityId() {
		return cityId;
	}
	public void setCityId(Integer cityId) {
		this.cityId = cityId;
	}
	public Integer getAreaId() {
		return areaId;
	}
	public void setAreaId(Integer areaId) {
		this.areaId = areaId;
	}
	public Integer getStateId() {
		return stateId;
	}
	public void setStateId(Integer stateId) {
		this.stateId = stateId;
	}
	public Date getRegistrationYear() {
		return registrationYear;
	}
	public void setRegistrationYear(Date registrationYear) {
		this.registrationYear = registrationYear;
	}
//	public Integer getInsurance() {
//		return insuranceId;
//	}
//	public void setInsurance(Integer insuranceId) {
//		this.insuranceId = insuranceId;
//	}
	public String getSeats() {
		return seats;
	}
	public void setSeats(String seats) {
		this.seats = seats;
	}
	public String getKmsDriven() {
		return kmsDriven;
	}
	public void setKmsDriven(String kmsDriven) {
		this.kmsDriven = kmsDriven;
	}
	public String getrTO() {
		return rTO;
	}
	public void setrTO(String rTO) {
		this.rTO = rTO;
	}
	public String getOwnerShip() {
		return ownerShip;
	}
	public void setOwnerShip(String ownerShip) {
		this.ownerShip = ownerShip;
	}
	public String getEngineDisplacement() {
		return engineDisplacement;
	}
	public void setEngineDisplacement(String engineDisplacement) {
		this.engineDisplacement = engineDisplacement;
	}
	public String getNumberofBags() {
		return numberofBags;
	}
	public void setNumberofBags(String numberofBags) {
		this.numberofBags = numberofBags;
	}
//	
	
	public String getCarPicPath() {
		return carPicPath;
	}
//	public Integer getInsuranceId() {
//		return insuranceId;
//	}
//
//	public void setInsuranceId(Integer insuranceId) {
//		this.insuranceId = insuranceId;
//	}

	public List<Integer> getFeatureIds() {
		return featureIds;
	}

	public void setFeatureIds(List<Integer> featureIds) {
		this.featureIds = featureIds;
	}



	public void setCarPicPath(String carPicPath) {
		this.carPicPath = carPicPath;
	}
	public String getVehicleStatus() {
		return vehicleStatus;
	}
	public void setVehicleStatus(String vehicleStatus) {
		this.vehicleStatus = vehicleStatus;
	}

	public StateEntity getState() {
		return state;
	}

	public void setState(StateEntity state) {
		this.state = state;
	}

	public CityEntity getCity() {
		return city;
	}

	public void setCity(CityEntity city) {
		this.city = city;
	}

	public AreaEntity getArea() {
		return area;
	}

	public void setArea(AreaEntity area) {
		this.area = area;
	}
	
	
	

    
	
    
    
	
    		
    
    
    		

   }
