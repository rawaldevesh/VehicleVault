package com.vehiclevault.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.vehiclevault.entity.InsuranceEntity;
import com.vehiclevault.repository.InsuranceRepository;

@Controller
public class InsuranceController {
	
	
	@Autowired
	InsuranceRepository repositoryInsurance;
	
	@GetMapping("newinsurance")
	public String newInsurance() {
		return "NewInsurance";
	}
	
	
	@PostMapping("saveinsurance")
	public String saveInsurance(InsuranceEntity insuranceEntity) {
		System.out.println(insuranceEntity.getInsuranceType());
		repositoryInsurance.save(insuranceEntity);
		return "redirect:/buyer-dashboard";
	}
	
	
}
