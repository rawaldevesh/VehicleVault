package com.vehiclevault.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.vehiclevault.entity.FeaturesEntity;
import com.vehiclevault.repository.FeaturesRepository;

@Controller
public class FeaturesController {
	
	@Autowired
	FeaturesRepository repositoryFeatures;
	
	@GetMapping("newfeatures")
	public String newFeatures() {
		return "NewFeatures";
	}
	
	
	@PostMapping("savefeatures")
	public String saveFeature(FeaturesEntity featuresEntity) {
		System.out.println(featuresEntity.getFeatureName());
		repositoryFeatures.save(featuresEntity);
		return "redirect:/seller-dashboard";
	}
	

}
