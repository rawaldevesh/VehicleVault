package com.vehiclevault.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.vehiclevault.entity.UserEntity;
import com.vehiclevault.entity.VehicleEntity;
import com.vehiclevault.repository.UserRepository;
import com.vehiclevault.repository.VehicleRepository;


@Controller
public class UserController {

	@Autowired
	UserRepository repositoryUser;
	
	@Autowired
	VehicleRepository repositoryVehicle;
	
	
	@GetMapping("listuser")
	public String listUser(Model model) {
		List<UserEntity> listUser = repositoryUser.findAll(); // select *
		model.addAttribute("listUser", listUser);
		return "UserList";
	}
	
	@GetMapping("searchvehicle")
	public String searchVehicle(Model model) {
		List<VehicleEntity> listVehicle = repositoryVehicle.findAll(); // select *
		model.addAttribute("listVehicle", listVehicle);
		return "SearchVehicle";
	}
	
	
}
