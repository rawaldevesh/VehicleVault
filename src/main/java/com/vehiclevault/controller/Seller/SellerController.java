package com.vehiclevault.controller.Seller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
import com.vehiclevault.entity.StateEntity;
import com.vehiclevault.entity.UserEntity;
import com.vehiclevault.entity.VehicleEntity;
import com.vehiclevault.repository.AreaRepository;
import com.vehiclevault.repository.CityRepository;
import com.vehiclevault.repository.FeaturesRepository;
import com.vehiclevault.repository.InquiryRepository;
import com.vehiclevault.repository.InsuranceRepository;
import com.vehiclevault.repository.StateRepository;
import com.vehiclevault.repository.VehicleRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class SellerController {
	
	@Autowired
	VehicleRepository repositoryVehicle;
	
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
	
	
	
	 @GetMapping("sellerdashboard")
	    public String sellerDashboard(Model model) {
		 
		 
		 
		 model.addAttribute("totalVehicles", repositoryVehicle.count());
		 model.addAttribute("totalInquiries", repositoryInquiry.count());
		 List<Object[]> inquiryStatusData = repositoryInquiry.countInquiriesByStatus();
	        List<String> inquiryLabels = new ArrayList<>();
	        List<String> inquiryCounts = new ArrayList<>();
	        for (Object[] row : inquiryStatusData) {
	            if (row[0] != null && row[1] != null) {
	                inquiryLabels.add("'" + row[0].toString() + "'");
	                inquiryCounts.add(row[1].toString());
	            }
	        }
	        model.addAttribute("inquiryLabels", String.join(",", inquiryLabels));
	        model.addAttribute("inquiryData", String.join(",", inquiryCounts));
	        
		 List<VehicleEntity> listVehicle = repositoryVehicle.findAll(); // select *
		model.addAttribute("listVehicle", listVehicle);
		 
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
	 
	 @PostMapping("sellersavevehicle")
	 public String saveVehicle(VehicleEntity entityVehicle,@RequestParam("featureIds") List<Integer> featureIds, HttpSession session, Model model, MultipartFile carPic) {
	     
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
	     
	     List<FeaturesEntity> selectedFeatures = repositoryFeatures.findAllById(featureIds);
	     entityVehicle.setFeaturesEntities(selectedFeatures);





	     entityVehicle.setUserId(user.getUserId());
	     entityVehicle.setVehicleStatus("PENDING");
	     entityVehicle.setListingDate(java.time.LocalDate.now());

	     repositoryVehicle.save(entityVehicle);

	     return "redirect:/sellervehiclelist";
	 }
	 
	 
//	 
	 @GetMapping("sellervehiclelist")
		public String listVehicle(Model model) {
			List<VehicleEntity> listVehicle = repositoryVehicle.findAll(); // select *
			model.addAttribute("listVehicle", listVehicle);
			return "seller/seller_vehicle_list";
		}
	 
	 
	 @GetMapping("sellereditvehicle")
		public String editVehicle(@RequestParam("id") Integer vehicleId, Model model) {
		    VehicleEntity vehicle = repositoryVehicle.findById(vehicleId).orElse(null);
		    
		   
		    
		    if (vehicle == null) {
		        return "redirect:/sellervehiclelist"; // If vehicle not found, redirect to list
		    }
		    
		    model.addAttribute("vehicle", vehicle);
		    
		    return "seller/seller_edit_vehicle"; // JSP page for editing
		}
		
		//updating vehicle
		@PostMapping("sellerupdatevehicle")
		public String updateVehicle(VehicleEntity entityVehicle, MultipartFile carPic,Model model) {
			 
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
			
			
		    repositoryVehicle.save(entityVehicle); // Save the updated vehicle
		    return "redirect:/sellervehiclelist"; // Redirect to vehicle list page
		}
		
		@GetMapping("sellerviewvehicle")
		public String viewVehicleById(@RequestParam("id") Integer vehicleId, Model model) {
			VehicleEntity vehicle= repositoryVehicle.findById(vehicleId).orElse(null); // Replace with your service method
		    model.addAttribute("vehicle", vehicle);
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
		
		@PostMapping("toggleInquiryStatus")
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
