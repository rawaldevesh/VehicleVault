package com.vehiclevault.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.vehiclevault.entity.AreaEntity;
import com.vehiclevault.entity.CityEntity;
import com.vehiclevault.entity.StateEntity;
import com.vehiclevault.entity.UserEntity;
import com.vehiclevault.entity.VehicleEntity;
import com.vehiclevault.repository.AreaRepository;
import com.vehiclevault.repository.CityRepository;
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
	@GetMapping("newvehicle")
	public String newvehicle(Model model, HttpSession session) {
		
		List<StateEntity> allState = repositoryState.findAll();
		model.addAttribute("allState",allState);
		
		List<CityEntity> allCity = repositoryCity.findAll();
		model.addAttribute("allCity",allCity);
		
		List<AreaEntity> allArea = repositoryArea.findAll();
		model.addAttribute("allArea",allArea);
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
	
	
}
