package com.vehiclevault.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.vehiclevault.entity.VehicleEntity;
import com.vehiclevault.repository.CityRepository;
import com.vehiclevault.repository.VehicleRepository;

@Controller
public class HomeController {
	
	
	@Autowired
	CityRepository cityRepository;
	@Autowired
	VehicleRepository repositoryVehicle;
	
	@GetMapping(value = {"home", "/", "/vehiclevault"})
	public String home(Model model) {
	    List<VehicleEntity> vehicleList = repositoryVehicle.findByVehicleStatus("APPROVED");

	    List<Map<String, Object>> vehiclesWithCity = new ArrayList<>();

	    for (VehicleEntity vehicle : vehicleList) {
	        Map<String, Object> vehicleMap = new HashMap<>();
	        vehicleMap.put("vehicle", vehicle);

	        cityRepository.findById(vehicle.getCityId())
	            .ifPresentOrElse(
	                city -> vehicleMap.put("cityName", city.getCityName()),
	                () -> vehicleMap.put("cityName", "Unknown")
	            );

	        vehiclesWithCity.add(vehicleMap);
	    }

	    model.addAttribute("vehiclesWithCity", vehiclesWithCity);
	    return "HomePage/Home";  // Corresponds to Home.jsp
	}

}
