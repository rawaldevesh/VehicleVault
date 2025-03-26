package com.vehiclevault.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.vehiclevault.entity.AreaEntity;
import com.vehiclevault.entity.CityEntity;
import com.vehiclevault.entity.FeaturesEntity;
import com.vehiclevault.entity.InsuranceEntity;
import com.vehiclevault.entity.StateEntity;
import com.vehiclevault.entity.UserEntity;
import com.vehiclevault.entity.VehicleEntity;
import com.vehiclevault.repository.AreaRepository;
import com.vehiclevault.repository.CityRepository;
import com.vehiclevault.repository.FeaturesRepository;
import com.vehiclevault.repository.InsuranceRepository;
import com.vehiclevault.repository.StateRepository;
import com.vehiclevault.repository.VehicleRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class VehicleController {
	
	@Autowired
	VehicleRepository repositoryVehicle;
	
	@Autowired
	CityRepository repositoryCity;
	
	@Autowired
    AreaRepository repositoryArea;
	
	@Autowired
	StateRepository repositoryState;
	
	@Autowired
	InsuranceRepository repositoryInsurance;
	
	@Autowired
	FeaturesRepository repositoryFeatures;
	
	@GetMapping("newvehicle")
	public String newvehicle(Model model, HttpSession session) {
		
		List<StateEntity> allState = repositoryState.findAll();
		model.addAttribute("allState",allState);
		
		List<CityEntity> allCity = repositoryCity.findAll();
		model.addAttribute("allCity",allCity);
		
		List<AreaEntity> allArea = repositoryArea.findAll();
		model.addAttribute("allArea",allArea);
		
		List<InsuranceEntity> allInsurance = repositoryInsurance.findAll();
		model.addAttribute("allInsurance",allInsurance);
		
		List<FeaturesEntity> allFeatures = repositoryFeatures.findAll();
		model.addAttribute("allFeatures",allFeatures);
		
		
		
		return "NewVehicle";
	}
	
	@PostMapping("savevehicle")
	public String saveVehicle(VehicleEntity entityVehicle, HttpSession session) {

	    UserEntity user = (UserEntity) session.getAttribute("user");

	    if (user == null) {
	        return "redirect:/login"; // If session expired, redirect to login
	    }
	    
	    entityVehicle.setUserId(user.getUserId());
	    repositoryVehicle.save(entityVehicle);
	    
	    return "redirect:/listvehicle";
	}

	
//	listvehicle 
	@GetMapping("listvehicle")
	public String listVehicle(Model model) {
		List<VehicleEntity> listVehicle = repositoryVehicle.findAll(); // select *
		model.addAttribute("listVehicle", listVehicle);
		return "ListVehicle";
	}
	
	
	//editevehicle
	
	@GetMapping("editVehicle")
	public String editVehicle(@RequestParam("id") Integer vehicleId, Model model) {
	    VehicleEntity vehicle = repositoryVehicle.findById(vehicleId).orElse(null);
	    
	    if (vehicle == null) {
	        return "redirect:/listvehicle"; // If vehicle not found, redirect to list
	    }
	    
	    model.addAttribute("vehicle", vehicle);
	    
	    return "EditVehicle"; // JSP page for editing
	}
	
	//updating vehicle
	@PostMapping("updateVehicle")
	public String updateVehicle(VehicleEntity updatedVehicle) {
	    repositoryVehicle.save(updatedVehicle); // Save the updated vehicle
	    return "redirect:/listvehicle"; // Redirect to vehicle list page
	}
	
	@GetMapping("deleteVehicle")
	public String deleteVehicle(@RequestParam("id") Integer vehicleId) {
	    repositoryVehicle.deleteById(vehicleId);
	    return "redirect:/listvehicle"; // Redirect to vehicle list
	}



	
	
}
