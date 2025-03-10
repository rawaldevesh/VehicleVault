package com.vehiclevault.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {

	
	@GetMapping("buyer-dashboard")
	public String buyerDashboard() {
        return "buyer-dashboard"; // Renders buyer-dashboard.jsp
    }

    @GetMapping("seller-dashboard")
    public String sellerDashboard() {
        return "seller-dashboard"; // Renders seller-dashboard.jsp
       }
    
    @GetMapping("admindashboard")
    public String adminDashboard() {
    	return "AdminDashboard";
    }
}
