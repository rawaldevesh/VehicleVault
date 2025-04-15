package com.vehiclevault.controller.Seller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.vehiclevault.entity.AreaEntity;
import com.vehiclevault.entity.CityEntity;
import com.vehiclevault.entity.StateEntity;
import com.vehiclevault.repository.AreaRepository;
import com.vehiclevault.repository.CityRepository;
import com.vehiclevault.repository.StateRepository;


@Controller
public class AreaController {

	
	@Autowired
	CityRepository repositoryCity;
	
	@Autowired
    AreaRepository repositoryArea;
	
	@Autowired
	StateRepository repositoryState;
	
	@GetMapping("newarea")
	public String newArea(Model model) {
        List<StateEntity> allState = repositoryState.findAll();
		
		model.addAttribute("allState",allState);
		List<CityEntity> allCity = repositoryCity.findAll();
		
		model.addAttribute("allCity",allCity);
		return "NewArea";
	}
	
	@PostMapping("savearea")
	public String saveArea(AreaEntity entityArea) {
		CityEntity city = repositoryCity.findById(entityArea.getCityId()).orElse(null);
		if (city != null) {
	        entityArea.setCityName(city.getCityName()); // set state name manually
	    }
		repositoryArea.save(entityArea);
		return "redirect:/newarea";
	}
	
	
	
}
