package com.vehiclevault.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.vehiclevault.entity.CityEntity;
import com.vehiclevault.entity.StateEntity;
import com.vehiclevault.repository.CityRepository;
import com.vehiclevault.repository.StateRepository;

@Controller
public class CityController {

	@Autowired
	CityRepository repositoryCity;
	
	@Autowired
	StateRepository repositoryState;
	
	@GetMapping("newcity")
	public String newCity(Model model) {
		List<StateEntity> allState = repositoryState.findAll();
		model.addAttribute("allState",allState);
		return "NewCity";
	}
	
	@PostMapping("savecity")
	public String saveCity(CityEntity entityCity) {
		repositoryCity.save(entityCity);
		return "redirect:/newcity";
	}
	
	@GetMapping("listcity")
	public String listCity(Model model) {
		List<CityEntity> allCity = repositoryCity.findAll();
		model.addAttribute("allCity",allCity);
		return "ListCity";
	}
}
