package com.vehiclevault.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.vehiclevault.entity.InquiryEntity;
import com.vehiclevault.repository.InquiryRepository;
import com.vehiclevault.repository.VehicleRepository;

import jakarta.servlet.http.HttpSession;


@Controller
public class InquiryController {
	
	
	@Autowired
	VehicleRepository repositoryVehicle;
	
	@Autowired
	InquiryRepository repositoryInquiry;
	
	@GetMapping("newinquery")
	public String newInquiry(@RequestParam("id") Integer vehicleId,Integer userId, HttpSession session) {
	    if (vehicleId == null) {
	        System.out.println("Error: vehicleId is NULL in newInquiry()");
	        return "redirect:/searchvehicle"; // Redirect to avoid errors
	    }
	    session.setAttribute("userId", userId);
	    session.setAttribute("vehicleId", vehicleId); // Store vehicleId in session
	    System.out.println("Stored vehicleId in session: " + vehicleId); // Debug Log
	    return "NewInquiry";
	}

	
	
	@PostMapping("saveinquiry")
	public String saveInquiry(InquiryEntity entityInquiry, HttpSession session) {
		
		Integer userId = (Integer) session.getAttribute("userId");
	    Integer vehicleId = (Integer) session.getAttribute("vehicleId");
	    System.out.println("Retrieved vehicleId from session: " + vehicleId); // Debug Log
	    if (vehicleId == null) {
	        return "redirect:/buyer-dashboard"; // If session expired, redirect
	    }
	    entityInquiry.setUserId(userId);
	    entityInquiry.setVehicleId(vehicleId);
	    entityInquiry.setInquiryDate(LocalDate.now()); // Set current date
	    repositoryInquiry.save(entityInquiry);
	    System.out.println("Inquiry Saved Successfully for vehicleId: " + vehicleId);
	    return "redirect:/searchvehicle";
	}
	
	@GetMapping("listinquiry")
	public String listInquiry(Model model) {
		List<Object[]> listInquiry = repositoryInquiry.getAll(); // select *
		model.addAttribute("listInquiry",listInquiry);
		return "ListInquiry";
	}

}


