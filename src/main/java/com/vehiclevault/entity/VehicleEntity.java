package com.vehiclevault.entity;

import java.math.BigDecimal;
import java.sql.Date;

import jakarta.persistence.*;

@Entity
@Table(name = "vehicles")
public class VehicleEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer vehicleId;

    private String make;
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
    private Date listingDate;
    private String registrationNum;
    private	Integer userId;
    private	Integer cityId;
    private	Integer areaId;
    private	Integer stateId;
    private	Date registrationYear;
    private	String insurance;
    private String features;
    private	String seats;
    private	String kmsDriven;
    private	String rTO;
    private	String ownerShip;
    private	String engineDisplacement;
    private	String numberofBags;
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
	public Date getListingDate() {
		return listingDate;
	}
	public void setListingDate(Date listingDate) {
		this.listingDate = listingDate;
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
	public String getInsurance() {
		return insurance;
	}
	public void setInsurance(String insurance) {
		this.insurance = insurance;
	}
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
	public String getFeatures() {
		return features;
	}
	public void setFeatures(String features) {
		this.features = features;
	}
    
	
    
    
	
    		
    
    
    		

   }
