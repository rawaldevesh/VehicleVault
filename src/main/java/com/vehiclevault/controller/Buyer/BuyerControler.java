package com.vehiclevault.controller.Buyer;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.vehiclevault.entity.InquiryEntity;
import com.vehiclevault.entity.UserEntity;
import com.vehiclevault.entity.VehicleEntity;
import com.vehiclevault.repository.InquiryRepository;
import com.vehiclevault.repository.VehicleRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class BuyerControler {

	
	
	@Autowired
	VehicleRepository repositoryVehicle;
	
	@Autowired
	InquiryRepository repositoryInquiry;
	
	@GetMapping("buyerdashboard")
	public String buyerdashboard() {
		return "buyer/buyer_dashboard";
		
	}
	
	@GetMapping("buyersearchvehicle")
	public String viewVehicles(Model model) {
	    List<VehicleEntity> approvedVehicles = repositoryVehicle.findByVehicleStatus("APPROVED");
	    model.addAttribute("vehicles", approvedVehicles);
	    return "buyer/buyer_search_Vehicle"; // Your JSP
	}
	
	@GetMapping("buyershowinquiries")
	public String MyInquiries(Model model) {
		List<Object[]> listInquiry = repositoryInquiry.getAll(); // select *
		model.addAttribute("listInquiry",listInquiry);
		return "buyer/buyer_show_inquiries";
	}
	
	@GetMapping("buyernewinquery")
	public String newInquiry(@RequestParam("id") Integer vehicleId, HttpSession session) {
		session.setAttribute("vehicleId", vehicleId); // Store vehicleId in session
	    System.out.println("Stored vehicleId in session: " + vehicleId); // Debug Log
		
	    return "buyer/buyer_new_inquiry";
	}
	
	
	@GetMapping("buyerviewvehicle")
	public String viewVehicleById(@RequestParam("id") Integer vehicleId, Model model) {
		VehicleEntity vehicle= repositoryVehicle.findById(vehicleId).orElse(null); // Replace with your service method
	    model.addAttribute("vehicle", vehicle);
		return "buyer/buyer_view_vehicle";
	}
	
	
	
	
	@PostMapping("buyersaveinquiry")
	public String saveInquiry(InquiryEntity entityInquiry, HttpSession session) {
		
		UserEntity user = (UserEntity) session.getAttribute("user");
		Integer vehicleId = (Integer) session.getAttribute("vehicleId");
	    System.out.println("Retrieved vehicleId from session: " + vehicleId); // Debug Log
	
		if (user == null) {
	        return "redirect:/login"; // If session expired, redirect to login
	    }
	
	   entityInquiry.setUserId(user.getUserId());
	   entityInquiry.setVehicleId(vehicleId);

	    //entityInquiry.setVehicleId(vehicle.getVehicleId());
	    entityInquiry.setInquiryDate(LocalDate.now()); // Set current date
	    repositoryInquiry.save(entityInquiry);

	    System.out.println("User saved for user Id "+ user);
	    System.out.println("Inquiry Saved Successfully for vehicleId: " + vehicleId);
	    
	    
//	    System.out.println("User saved for user Id "+ vehicle);
//	    
	    return "redirect:/buyersearchvehicle";
	}
	

	
	
}
