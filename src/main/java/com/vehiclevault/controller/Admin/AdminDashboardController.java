package com.vehiclevault.controller.Admin;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.vehiclevault.entity.InquiryEntity;
import com.vehiclevault.entity.ReviewEntity;
import com.vehiclevault.entity.UserEntity;
import com.vehiclevault.entity.VehicleEntity;
import com.vehiclevault.repository.InquiryRepository;
import com.vehiclevault.repository.ReviewRepository;
import com.vehiclevault.repository.UserRepository;
import com.vehiclevault.repository.VehicleRepository;

@Controller
public class AdminDashboardController {

    @Autowired VehicleRepository repositoryVehicle;
    @Autowired UserRepository repositoryUser;
    @Autowired InquiryRepository repositoryInquiry;
    @Autowired
	Cloudinary cloudinary;
    @Autowired
	 ReviewRepository reviewRepository;

    @GetMapping("admindashboard")
    public String viewDashboard(Model model) {
    	
    	
    	//total users
//    	Long totalUsers = repositoryUser.count();
    	
    	//total user
    	Integer totalBuyers = repositoryUser.findByRole("BUYER").size();
    	model.addAttribute("totalBuyers", totalBuyers);
    	
    	Long totalInquiry = repositoryInquiry.count();
    	model.addAttribute("totalInquiry", totalInquiry);
    	
    	Long totalVehicles = repositoryVehicle.count();
    	model.addAttribute("totalVehicles", totalVehicles);
    	
    	Integer totalApprovedVehicles = repositoryVehicle.findByVehicleStatus("APPROVED").size();
    	model.addAttribute("totalApprovedVehicles", totalApprovedVehicles);
    	
    	LocalDate today = LocalDate.now();
    	int month = today.getMonthValue();
    	
    	Integer thisMonthBuyerCount = repositoryUser.countThisMonthBuyer(month);
    	model.addAttribute("thisMonthBuyerCount",thisMonthBuyerCount);
    	
    	Integer thisMonthVehicleCount= repositoryVehicle.countThisMonthVehicle(month);
    	model.addAttribute("thisMonthVehicleCount",thisMonthVehicleCount);
    	
    	Integer thisMonthInquiryCount= repositoryInquiry.countThisMonthInquiry(month);
    	model.addAttribute("thisMonthInquiryCount",thisMonthInquiryCount);
    	
    	
    	
    	
        model.addAttribute("pendingVehicles", repositoryVehicle.findByVehicleStatus("PENDING"));

        return "admin/admin_dashboard";
    }

    @GetMapping("adminlistuser")
    public String listUser(Model model) {
    	
    	List<UserEntity> listUser = repositoryUser.findAll();
    	model.addAttribute("listUser", listUser);
        return "admin/admin_user_list";
    }
    
    @GetMapping("adminviewuser")
    public String viewUser(@RequestParam("id") Integer userId, Model model) {
        UserEntity user = repositoryUser.findById(userId).orElse(null);
        model.addAttribute("user", user);  // This line was missing
        return "admin/admin_view_user";   // Your JSP page
    }
    
    @GetMapping("adminedituser")
	public String editUser(@RequestParam("id") Integer userId, Model model) {
	    UserEntity user = repositoryUser.findById(userId).orElse(null);
	    
	    if (user == null) {
	        return "redirect:/adminlistuser"; // If vehicle not found, redirect to list
	    }
	    
	    model.addAttribute("user", user);
	    
	    return "admin/admin_edit_user"; // JSP page for editing
	}
	
	@PostMapping("adminupdateuser")
	public String updateUser(@ModelAttribute UserEntity userEntity,
	                         @RequestParam("profilePic") MultipartFile profilePic,
	                         Model model) {

	    // Fetch existing user
	    UserEntity existingUser = repositoryUser.findById(userEntity.getUserId()).orElse(null);

	    if (existingUser == null) {
	        model.addAttribute("error", "User not found.");
	        return "redirect:/adminlistuser";
	    }

	    // Handle profile image
	    if (profilePic != null && !profilePic.isEmpty()) {

	        if (profilePic.getSize() > 1048576) {
	            model.addAttribute("error", "File size should be less than 1MB.");
	            return "admin/admin_edit_user";
	        }

	        try {
	            Map result = cloudinary.uploader().upload(profilePic.getBytes(), ObjectUtils.emptyMap());
	            userEntity.setProfilePicPath(result.get("url").toString());
	        } catch (IOException e) {
	            e.printStackTrace();
	            model.addAttribute("error", "Image upload failed. Please try again.");
	            return "admin/admin_edit_user";
	        }

	    } 
	 // Update other fields
	     existingUser.setFirstName(userEntity.getFirstName());
	     existingUser.setLastName(userEntity.getLastName());
	     existingUser.setEmail(userEntity.getEmail());
	     existingUser.setBornYear(userEntity.getBornYear());
	     existingUser.setContactNum(userEntity.getContactNum());
	     existingUser.setGender(userEntity.getGender());
	     existingUser.setRole(userEntity.getRole());
	  

	     // Update password only if a new password is provided
	     if (userEntity.getPassword() != null && !userEntity.getPassword().isEmpty()) {
	         existingUser.setPassword(userEntity.getPassword()); // Consider encoding the password here
	     }

	    repositoryUser.save(userEntity);
	    return "redirect:/adminlistuser";
	}

    @GetMapping("admindeleteUser")
    public String deleteUser(@RequestParam("id") Integer userId) {
        repositoryUser.deleteById(userId);
        return "redirect:/adminlistuser";
    }

    @GetMapping("/admin/approve-vehicle/{id}")
    public String approveVehicle(@PathVariable int id) {
        VehicleEntity vehicle = repositoryVehicle.findById(id).orElse(null);
        
        if (vehicle != null) {
            vehicle.setVehicleStatus("APPROVED");
            repositoryVehicle.save(vehicle);
        }
        return "redirect:/adminlistvehicle";
    }

    @GetMapping("/admin/reject-vehicle/{id}")
    public String rejectVehicle(@PathVariable int id) {
        VehicleEntity vehicle = repositoryVehicle.findById(id).orElse(null);
        if (vehicle != null) {
            vehicle.setVehicleStatus("PENDING");
            repositoryVehicle.save(vehicle);
        }
        return "redirect:/adminlistvehicle";
    }
    
    @GetMapping("adminlistinquiry")
	public String listInquiry(Model model) {
		List<Object[]> listInquiry = repositoryInquiry.getAll(); // select *
		model.addAttribute("listInquiry",listInquiry);
		model.addAttribute(listInquiry);
		return "admin/admin_list_inquiry";
	}
	
	@PostMapping("admintoggleInquiryStatus")
	public String toggleInquiryStatus(@RequestParam("id") Integer inquiryId) {
	    InquiryEntity inquiry = repositoryInquiry.findById(inquiryId).orElse(null);
	    
	    if (inquiry != null) {
	        String newStatus = inquiry.getInquiryStatus().equals("ON") ? "OFF" : "ON";
	        inquiry.setInquiryStatus(newStatus);
	        repositoryInquiry.save(inquiry);
	    }
	    
	    return "redirect:/adminlistinquiry"; // Redirect to the list
	}
	
	@GetMapping("admindeleteinquiry")
	public String deleteInquiry(@RequestParam("id") Integer inquiryId) {
	    repositoryInquiry.deleteById(inquiryId);
	    return "redirect:/adminlistinquiry"; // Redirect to vehicle list
	}
	
	
	

	
	
	@GetMapping("adminlistvehicle")
	public String listVehicle(Model model) {
		List<VehicleEntity> listVehicle = repositoryVehicle.findAll(); // select *
		model.addAttribute("listVehicle", listVehicle);
		return "admin/admin_vehicle_list";
	}
	
	@GetMapping("adminviewvehicle")
	public String viewVehicleById(@RequestParam("id") Integer vehicleId, Model model) {
		VehicleEntity vehicle= repositoryVehicle.findById(vehicleId).orElse(null); // Replace with your service method
	    model.addAttribute("vehicle", vehicle);
	    
	    List<ReviewEntity> reviews = reviewRepository.findByVehicle_VehicleId(vehicleId);

	    
	    model.addAttribute("reviews", reviews);
		return "admin/admin_view_vehicle";
	}
    
	
    
}

