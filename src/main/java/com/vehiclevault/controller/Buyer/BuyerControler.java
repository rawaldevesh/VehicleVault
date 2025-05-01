package com.vehiclevault.controller.Buyer;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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

import jakarta.servlet.http.HttpSession;

@Controller
public class BuyerControler {

	
	
	@Autowired
	VehicleRepository repositoryVehicle;
	
	@Autowired
	InquiryRepository repositoryInquiry;
	
	@Autowired 
	UserRepository repositoryUser;
	
	@Autowired
	Cloudinary cloudinary;
	
	@GetMapping("buyerdashboard")
	public String buyerdashboard(Model model) {
		
		
		Long totalVehicles = repositoryVehicle.count();
    	model.addAttribute("totalVehicles", totalVehicles);
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
	    
	    
	    List<ReviewEntity> reviews = reviewRepository.findByVehicle_VehicleId(vehicleId);

	    
	    model.addAttribute("reviews", reviews);
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
	
	 @GetMapping("buyerviewprofile")
	    public String viewUser(@RequestParam("id") Integer userId, Model model) {
	        UserEntity user = repositoryUser.findById(userId).orElse(null);
	        model.addAttribute("user", user);  // This line was missing
	        return "buyer/buyer_view_profile";   // Your JSP page
	    }
	 
	 @GetMapping("buyereditprofile")
		public String editUser(@RequestParam("id") Integer userId, Model model) {
		    UserEntity user = repositoryUser.findById(userId).orElse(null);
		    
		    if (user == null) {
		        return "redirect:/sellerdashboard"; // If vehicle not found, redirect to list
		    }
		    
		    model.addAttribute("user", user);
		    
		    return "buyer/buyer_edit_profile"; // JSP page for editing
		}
	 @PostMapping("buyerupdateprofile")
	 public String updateUser(@ModelAttribute UserEntity userEntity,
	                          @RequestParam("profilePic") MultipartFile profilePic,
	                          Model model) {

	     // Fetch existing user
	     UserEntity existingUser = repositoryUser.findById(userEntity.getUserId()).orElse(null);

	     if (existingUser == null) {
	         model.addAttribute("error", "User not found.");
	         return "redirect:/buyerdashboard";
	     }

	     // Handle profile image
	     if (profilePic != null && !profilePic.isEmpty()) {

	         if (profilePic.getSize() > 1048576) {
	             model.addAttribute("error", "File size should be less than 1MB.");
	             return "buyer/buyer_edit_profile";
	         }

	         try {
	             Map result = cloudinary.uploader().upload(profilePic.getBytes(), ObjectUtils.emptyMap());
	             existingUser.setProfilePicPath(result.get("url").toString());
	         } catch (IOException e) {
	             e.printStackTrace();
	             model.addAttribute("error", "Image upload failed. Please try again.");
	             return "buyer/buyer_edit_profile";
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

	     repositoryUser.save(existingUser);
	     return "redirect:/buyerdashboard";
	 }
	 
	 
	 
	 @Autowired
	 ReviewRepository reviewRepository;

	 @PostMapping("buyersavereview")
	 public String saveReview(@RequestParam("vehicleId") Integer vehicleId,
	                          @RequestParam("rating") Integer rating,
	                          @RequestParam("comment") String comment,
	                          HttpSession session) {

	     UserEntity user = (UserEntity) session.getAttribute("user");
	     if (user == null) {
	         return "redirect:/login";
	     }

	     VehicleEntity vehicle = repositoryVehicle.findById(vehicleId).orElse(null);
	     if (vehicle == null) {
	         return "redirect:/buyersearchvehicle";
	     }

	     ReviewEntity review = new ReviewEntity();
	     review.setUser(user);
	     review.setVehicle(vehicle);
	     review.setRating(rating);
	     review.setComment(comment);

	     reviewRepository.save(review);
	     return "redirect:/buyerviewvehicle?id=" + vehicleId;
	 }

	
	
	

	
	
}
