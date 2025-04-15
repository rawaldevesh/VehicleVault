package com.vehiclevault.controller.Seller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.vehiclevault.entity.AreaEntity;
import com.vehiclevault.entity.CityEntity;
import com.vehiclevault.repository.AreaRepository;
import com.vehiclevault.repository.CityRepository;
import com.vehiclevault.repository.StateRepository;

@RestController
public class LocationController {
	
	@Autowired
	CityRepository repositoryCity;
	
	@Autowired
    AreaRepository repositoryArea;
	
	@Autowired
	StateRepository repositoryState;

    @GetMapping("/get-citiesbystateid/{stateId}")
    public List<CityEntity> getAllCityByStateId(@PathVariable Integer stateId) {
    	
    	System.out.println(stateId);
    	
        List<CityEntity> allCity = 	repositoryCity.findByStateId(stateId);
        
        return allCity;
    }
    
    

    @GetMapping("/get-areasbycityid/{cityId}")
    public List<AreaEntity> getAllAreaByCityId(@PathVariable Integer cityId) {
    	
    	System.out.println(cityId);
    	
        List<AreaEntity> allArea = 	repositoryArea.findByCityId(cityId);
        
        return allArea;
    }

}
