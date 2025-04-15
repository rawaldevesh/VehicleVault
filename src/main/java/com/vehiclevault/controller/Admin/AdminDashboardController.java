package com.vehiclevault.controller.Admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.vehiclevault.entity.InquiryEntity;
import com.vehiclevault.entity.UserEntity;
import com.vehiclevault.entity.VehicleEntity;
import com.vehiclevault.repository.InquiryRepository;
import com.vehiclevault.repository.UserRepository;
import com.vehiclevault.repository.VehicleRepository;

@Controller
public class AdminDashboardController {

    @Autowired VehicleRepository repositoryVehicle;
    @Autowired UserRepository repositoryUser;
    @Autowired InquiryRepository repositoryInquiry;
    @Autowired
	Cloudinary cloudinary;

    @GetMapping("admindashboard")
    public String viewDashboard(Model model) {
        model.addAttribute("pendingVehicles", repositoryVehicle.findByVehicleStatus("PENDING"));
        model.addAttribute("totalVehicles", repositoryVehicle.count());
        model.addAttribute("totalInquiries", repositoryInquiry.count());
        model.addAttribute("totalUsers", repositoryUser.count());
        
        // Dynamic User Registration Data
        List<Object[]> userStats = repositoryUser.countUsersByMonth();
        List<String> months = new ArrayList<>();
        List<Integer> userCounts = new ArrayList<>();

        for (Object[] row : userStats) {
            if (row[0] != null && row[1] != null) {
                int monthNumber = ((Number) row[0]).intValue();
                String monthName = java.time.Month.of(monthNumber).name().substring(0, 3); // e.g. JAN
                months.add("\"" + monthName + "\"");
                userCounts.add(((Number) row[1]).intValue());
            }
        }
     // --- Vehicles by Type ---
        List<Object[]> vehicleTypeData = repositoryVehicle.countVehiclesByType();
        List<String> vehicleTypes = new ArrayList<>();
        List<String> vehicleTypeCounts = new ArrayList<>();
        for (Object[] row : vehicleTypeData) {
            if (row[0] != null && row[1] != null) {
                vehicleTypes.add("'" + row[0].toString() + "'");
                vehicleTypeCounts.add(row[1].toString());
            }
        }
        model.addAttribute("vehicleLabels", String.join(",", vehicleTypes));
        model.addAttribute("vehicleData", String.join(",", vehicleTypeCounts));

        // --- Inquiries by Status ---
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

        model.addAttribute("userChartMonths", String.join(",", months));
        model.addAttribute("userChartCounts", userCounts.toString().replaceAll("[\\[\\]]", ""));
        return "admin/admin_dashboard";
    }

    @GetMapping("adminlistuser")
    public String listUser(Model model) {
        model.addAttribute("listUser", repositoryUser.findAll());
        return "admin/admin_user_list";
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
        return "redirect:/admindashboard";
    }

    @GetMapping("/admin/reject-vehicle/{id}")
    public String rejectVehicle(@PathVariable int id) {
        VehicleEntity vehicle = repositoryVehicle.findById(id).orElse(null);
        if (vehicle != null) {
            vehicle.setVehicleStatus("REJECTED");
            repositoryVehicle.save(vehicle);
        }
        return "redirect:/admindashboard";
    }
    
    @GetMapping("adminlistinquiry")
	public String listInquiry(Model model) {
		List<Object[]> listInquiry = repositoryInquiry.getAll(); // select *
		model.addAttribute("listInquiry",listInquiry);
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
	public String updateUser(UserEntity userEntity,Model model,MultipartFile profilePic) {
		 if (profilePic == null || profilePic.isEmpty()) {
	         model.addAttribute("error", "Please upload a car image.");
	         return "admin/admin_edit_user";
	     }
		 
		 if (profilePic.getSize() > 1048576) {
	         model.addAttribute("error", "File size should be less than 1MB.");
	         return "admin/admin_edit_user";
	     }
		 
		 try {
	         // Upload to Cloudinary
	         Map result = cloudinary.uploader().upload(profilePic.getBytes(), ObjectUtils.emptyMap());
	         userEntity.setProfilePicPath(result.get("url").toString());
	     } catch (IOException e) {
	         e.printStackTrace();
	         model.addAttribute("error", "Image upload failed. Please try again.");
	         return "redirect:/adminlistuser";
	     }
	    repositoryUser.save(userEntity); // Save the updated vehicle
	    return "redirect:/adminlistuser"; // Redirect to vehicle list page
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
		return "admin/admin_view_vehicle";
	}
    
	
    
}

