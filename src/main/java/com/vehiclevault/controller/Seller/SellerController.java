package com.vehiclevault.controller.Seller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
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
import com.vehiclevault.entity.AreaEntity;
import com.vehiclevault.entity.CityEntity;
import com.vehiclevault.entity.FeaturesEntity;
import com.vehiclevault.entity.InquiryEntity;
import com.vehiclevault.entity.InsuranceEntity;
import com.vehiclevault.entity.ReviewEntity;
import com.vehiclevault.entity.StateEntity;
import com.vehiclevault.entity.UserEntity;
import com.vehiclevault.entity.VehicleEntity;
import com.vehiclevault.repository.AreaRepository;
import com.vehiclevault.repository.CityRepository;
import com.vehiclevault.repository.FeaturesRepository;
import com.vehiclevault.repository.InquiryRepository;
import com.vehiclevault.repository.InsuranceRepository;
import com.vehiclevault.repository.ReviewRepository;
import com.vehiclevault.repository.StateRepository;
import com.vehiclevault.repository.UserRepository;
import com.vehiclevault.repository.VehicleRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class SellerController {
	
	@Autowired
	VehicleRepository repositoryVehicle;
	
	@Autowired 
	UserRepository repositoryUser;
	
	@Autowired
	CityRepository repositoryCity;
	
	@Autowired
    AreaRepository repositoryArea;
	
	@Autowired
	StateRepository repositoryState;
	
	@Autowired
	InsuranceRepository repositoryInsurance;
	
	@Autowired
	FeaturesRepository repositoryFeatures;
	

	@Autowired
	InquiryRepository repositoryInquiry;
	
	@Autowired
	Cloudinary cloudinary;
	
	 @Autowired
	 ReviewRepository reviewRepository;
	
	
	
	 @GetMapping("sellerdashboard")
	    public String sellerDashboard(Model model,HttpSession session) {
		 UserEntity seller = (UserEntity) session.getAttribute("user"); 
		 if (seller != null) {
		        int sellerId = seller.getUserId();
		        Long totalVehicles = repositoryVehicle.countByUserId(sellerId); // Custom method you create
		        
		        model.addAttribute("totalVehicles", totalVehicles);
		        // Add more attributes here if needed (recent vehicles, inquiries, etc.)
		    }
		 
		 	Integer sellerId = seller.getUserId();
		    Integer currentMonth = LocalDate.now().getMonthValue();

		    Integer vehiclesThisMonth = repositoryVehicle.countThisMonthVehicleBySeller(currentMonth, sellerId);
		    model.addAttribute("vehiclesThisMonth", vehiclesThisMonth);
		    
		    Integer totalInquiries = repositoryInquiry.countTotalInquiriesBySeller(sellerId);
		    model.addAttribute("totalInquiries", totalInquiries);
		    
		    Integer inquiriesThisMonth = repositoryInquiry.countThisMonthInquiriesBySeller(currentMonth, sellerId);
		    model.addAttribute("inquiriesThisMonth", inquiriesThisMonth);
		
		 
		
		 
	        return "seller/seller_dashboard"; // Renders seller-dashboard.jsp
	       }
	 
	 
	 @GetMapping("sellernewvehicle")
		public String newvehicle(Model model, HttpSession session) {
			
			List<StateEntity> allState = repositoryState.findAll();
			model.addAttribute("allState",allState);
			
			List<CityEntity> allCity = repositoryCity.findAll();
			model.addAttribute("allCity",allCity);
			
			List<AreaEntity> allArea = repositoryArea.findAll();
			model.addAttribute("allArea",allArea);
			
			List<InsuranceEntity> allInsurance = repositoryInsurance.findAll();
			model.addAttribute("allInsurance",allInsurance);
			
			List<FeaturesEntity> allFeatures = repositoryFeatures.findAll();
			model.addAttribute("allFeatures",allFeatures);
			
			
			
			return "seller/seller_add_vehciles";
			
		}
	 
	 @GetMapping("sellerviewprofile")
	    public String viewUser(@RequestParam("id") Integer userId, Model model) {
	        UserEntity user = repositoryUser.findById(userId).orElse(null);
	        model.addAttribute("user", user);  // This line was missing
	        return "seller/seller_view_profile";   // Your JSP page
	    }
	 
	 @GetMapping("sellereditprofile")
		public String editUser(@RequestParam("id") Integer userId, Model model) {
		    UserEntity user = repositoryUser.findById(userId).orElse(null);
		    
		    if (user == null) {
		        return "redirect:/sellerdashboard"; // If vehicle not found, redirect to list
		    }
		    
		    model.addAttribute("user", user);
		    
		    return "seller/seller_edit_profile"; // JSP page for editing
		}
	 @PostMapping("sellerupdateprofile")
	 public String updateUser(@ModelAttribute UserEntity userEntity,
	                          @RequestParam("profilePic") MultipartFile profilePic,
	                          Model model) {

	     // Fetch existing user
	     UserEntity existingUser = repositoryUser.findById(userEntity.getUserId()).orElse(null);

	     if (existingUser == null) {
	         model.addAttribute("error", "User not found.");
	         return "redirect:/sellerdashboard";
	     }

	     // Handle profile image
	     if (profilePic != null && !profilePic.isEmpty()) {

	         if (profilePic.getSize() > 1048576) {
	             model.addAttribute("error", "File size should be less than 1MB.");
	             return "seller/seller_edit_profile";
	         }

	         try {
	             Map result = cloudinary.uploader().upload(profilePic.getBytes(), ObjectUtils.emptyMap());
	             existingUser.setProfilePicPath(result.get("url").toString());
	         } catch (IOException e) {
	             e.printStackTrace();
	             model.addAttribute("error", "Image upload failed. Please try again.");
	             return "seller/seller_edit_profile";
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
	     return "redirect:/sellerdashboard";
	 }


	 
	 @PostMapping("sellersavevehicle")
	 public String saveVehicle(VehicleEntity entityVehicle, HttpSession session, Model model, MultipartFile carPic) {
	     
	     UserEntity user = (UserEntity) session.getAttribute("user");

	     if (user == null) {
	         return "redirect:/login"; // Session expired
	     }

	     // Check if file is empty
	     if (carPic == null || carPic.isEmpty()) {
	         model.addAttribute("error", "Please upload a car image.");
	         return "seller/seller_add_vehciles";
	     }

	     // Check file type
	     String fileName = carPic.getOriginalFilename().toLowerCase();
	     if (!(fileName.endsWith(".jpg") || fileName.endsWith(".jpeg") || fileName.endsWith(".png") || fileName.endsWith(".gif"))) {
	         model.addAttribute("error", "Only image files (JPG, JPEG, PNG, GIF) are allowed.");
	         return "seller/seller_add_vehciles";
	     }

	     // Check file size (limit: 1MB = 1048576 bytes)
	     if (carPic.getSize() > 1048576) {
	         model.addAttribute("error", "File size should be less than 1MB.");
	         return "seller/seller_add_vehciles";
	     }

	     try {
	         // Upload to Cloudinary
	         Map result = cloudinary.uploader().upload(carPic.getBytes(), ObjectUtils.emptyMap());
	         entityVehicle.setCarPicPath(result.get("url").toString());
	     } catch (IOException e) {
	         e.printStackTrace();
	         model.addAttribute("error", "Image upload failed. Please try again.");
	         return "seller/seller_add_vehciles";
	     }
	     
	    





	     entityVehicle.setUserId(user.getUserId());
	     entityVehicle.setVehicleStatus("PENDING");
	     entityVehicle.setListingDate(java.time.LocalDate.now());

	     repositoryVehicle.save(entityVehicle);

	     return "redirect:/sellervehiclelist";
	 }
	 
	 
//	 
	 @GetMapping("sellervehiclelist")
	 public String listVehicle(HttpSession session, Model model) {
	     UserEntity user = (UserEntity) session.getAttribute("user"); // or however you're storing it
	     Integer userId = user.getUserId();

	     List<VehicleEntity> vehicles = repositoryVehicle.findByUserId(userId);
	     model.addAttribute("listVehicle", vehicles);

	     return "seller/seller_vehicle_list";
	 }
	 

	 
	 
	 @GetMapping("sellereditvehicle")
		public String editVehicle(@RequestParam("id") Integer vehicleId, Model model,HttpSession session) {
		 
		 UserEntity user = (UserEntity) session.getAttribute("user");
		 Integer userId = user.getUserId();
		 
		    VehicleEntity vehicle = repositoryVehicle.findById(vehicleId).orElse(null);
		    List<StateEntity> allState = repositoryState.findAll();
			model.addAttribute("allState",allState);
			
			List<CityEntity> allCity = repositoryCity.findAll();
			model.addAttribute("allCity",allCity);
			
			List<AreaEntity> allArea = repositoryArea.findAll();
			model.addAttribute("allArea",allArea);
			
		    List<InsuranceEntity> allInsurance = repositoryInsurance.findAll();
			model.addAttribute("allInsurance",allInsurance);
			
			List<FeaturesEntity> allFeatures = repositoryFeatures.findAll();
			model.addAttribute("allFeatures",allFeatures);
		    
		    if (vehicle == null) {
		        return "redirect:/sellervehiclelist"; // If vehicle not found, redirect to list
		    }
		    
		    model.addAttribute("vehicle", vehicle);
		    
		    return "seller/seller_edit_vehicle"; 
		    }
		    
		    
	 @PostMapping("sellerupdatevehicle")
	 public String updateVehicle(VehicleEntity entityVehicle, MultipartFile carPic, Model model) {
	     
	     // Load reference data for re-display in case of error
	     model.addAttribute("allState", repositoryState.findAll());
	     model.addAttribute("allCity", repositoryCity.findAll());
	     model.addAttribute("allArea", repositoryArea.findAll());
	     model.addAttribute("allInsurance", repositoryInsurance.findAll());
	     model.addAttribute("allFeatures", repositoryFeatures.findAll());
	     model.addAttribute("vehicle", entityVehicle); // In case of re-render

	     // Fetch the existing vehicle entity from the database
	     VehicleEntity existingVehicle = repositoryVehicle.findById(entityVehicle.getVehicleId()).orElse(null);
	     if (existingVehicle == null) {
	         model.addAttribute("error", "Vehicle not found.");
	         return "seller/seller_add_vehciles";
	     }

	     // Handle feature selection
	     List<Integer> featureIds = entityVehicle.getFeatureIds();
	     if (featureIds != null && !featureIds.isEmpty()) {
	         List<FeaturesEntity> selectedFeatures = repositoryFeatures.findAllById(featureIds);
	         existingVehicle.setFeaturesEntities(selectedFeatures);
	     } else {
	         existingVehicle.setFeaturesEntities(new ArrayList<>());
	     }

	     // Handle image upload
	     if (carPic == null || carPic.isEmpty()) {
	         model.addAttribute("error", "Please upload a car image.");
	         return "seller/seller_add_vehciles";
	     }

	     String fileName = carPic.getOriginalFilename().toLowerCase();
	     if (!(fileName.endsWith(".jpg") || fileName.endsWith(".jpeg") || fileName.endsWith(".png") || fileName.endsWith(".gif"))) {
	         model.addAttribute("error", "Only image files (JPG, JPEG, PNG, GIF) are allowed.");
	         return "seller/seller_add_vehciles";
	     }

	     if (carPic.getSize() > 1048576) { // 1MB
	         model.addAttribute("error", "File size should be less than 1MB.");
	         return "seller/seller_add_vehciles";
	     }

	     try {
	         Map result = cloudinary.uploader().upload(carPic.getBytes(), ObjectUtils.emptyMap());
	         String uploadedImageUrl = result.get("url").toString();
	         existingVehicle.setCarPicPath(uploadedImageUrl); // ✅ Fix: set to existingVehicle
	     } catch (IOException e) {
	         e.printStackTrace();
	         model.addAttribute("error", "Image upload failed. Please try again.");
	         return "seller/seller_add_vehciles";
	     }

	     // Copy updated fields to existingVehicle
	     existingVehicle.setMake(entityVehicle.getMake());
	     existingVehicle.setModel(entityVehicle.getModel());
	     existingVehicle.setYear(entityVehicle.getYear());
	     existingVehicle.setVehicleType(entityVehicle.getVehicleType());
	     existingVehicle.setVariant(entityVehicle.getVariant());
	     existingVehicle.setMileage(entityVehicle.getMileage());
	     existingVehicle.setFuelType(entityVehicle.getFuelType());
	     existingVehicle.setTransmissionType(entityVehicle.getTransmissionType());
	     existingVehicle.setPrice(entityVehicle.getPrice());
	     existingVehicle.setColor(entityVehicle.getColor());
	     existingVehicle.setSeats(entityVehicle.getSeats());
	     existingVehicle.setKmsDriven(entityVehicle.getKmsDriven());
	     existingVehicle.setDescription(entityVehicle.getDescription());
	     existingVehicle.setStatus(entityVehicle.getStatus());
	     existingVehicle.setListingDate(entityVehicle.getListingDate());
	     existingVehicle.setRegistrationNum(entityVehicle.getRegistrationNum());
	     existingVehicle.setRegistrationYear(entityVehicle.getRegistrationYear());
	     existingVehicle.setOwnerShip(entityVehicle.getOwnerShip());
	     existingVehicle.setrTO(entityVehicle.getrTO());
	     existingVehicle.setEngineDisplacement(entityVehicle.getEngineDisplacement());
	     existingVehicle.setNumberofBags(entityVehicle.getNumberofBags());
	     existingVehicle.setStateId(entityVehicle.getStateId());
	     existingVehicle.setCityId(entityVehicle.getCityId());
	     existingVehicle.setAreaId(entityVehicle.getAreaId());

	     if (entityVehicle.getInsurance() != null) {
	         existingVehicle.setInsurance(entityVehicle.getInsurance());
	     }

	     // Mark vehicle for re-approval
	     existingVehicle.setVehicleStatus("PENDING");

	     // Save the updated vehicle
	     repositoryVehicle.save(existingVehicle);

	     return "redirect:/sellervehiclelist";
	 }


	 
		
		@GetMapping("sellerviewvehicle")
		public String viewVehicleById(@RequestParam("id") Integer vehicleId, Model model) {
			VehicleEntity vehicle= repositoryVehicle.findById(vehicleId).orElse(null); // Replace with your service method
		    model.addAttribute("vehicle", vehicle);
		    List<ReviewEntity> reviews = reviewRepository.findByVehicle_VehicleId(vehicleId);

		    
		    model.addAttribute("reviews", reviews);
			return "seller/seller_view_vehicle";
		}
		
		@GetMapping("sellerdeletevehicle")
		public String deleteVehicle(@RequestParam("id") Integer vehicleId) {
		    repositoryVehicle.deleteById(vehicleId);
		    return "redirect:/sellervehiclelist"; // Redirect to vehicle list
		}
		
		@GetMapping("sellerlistinquiry")
		public String listInquiry(Model model) {
			List<Object[]> listInquiry = repositoryInquiry.getAll(); // select *
			model.addAttribute("listInquiry",listInquiry);
			return "seller/seller_list_inquiry";
		}
		
		@PostMapping("sellertoggleInquiryStatus")
		public String toggleInquiryStatus(@RequestParam("id") Integer inquiryId) {
		    InquiryEntity inquiry = repositoryInquiry.findById(inquiryId).orElse(null);
		    
		    if (inquiry != null) {
		        String newStatus = inquiry.getInquiryStatus().equals("ON") ? "OFF" : "ON";
		        inquiry.setInquiryStatus(newStatus);
		        repositoryInquiry.save(inquiry);
		    }
		    
		    return "redirect:/sellerlistinquiry"; // Redirect to the list
		}
		
		@GetMapping("sellerdeleteinquiry")
		public String deleteInquiry(@RequestParam("id") Integer inquiryId) {
		    repositoryInquiry.deleteById(inquiryId);
		    return "redirect:/sellerlistinquiry"; // Redirect to vehicle list
		}
		
		
	
	 
	

}
