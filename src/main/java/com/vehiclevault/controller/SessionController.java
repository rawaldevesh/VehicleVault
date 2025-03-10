package com.vehiclevault.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.vehiclevault.entity.UserEntity;
import com.vehiclevault.repository.UserRepository;
import com.vehiclevault.service.MailService;

import jakarta.servlet.http.HttpSession;

@Controller
public class SessionController {
	
	@Autowired
	MailService serviceMail;

	// signup.jsp
	@Autowired
	UserRepository repositoryUser;

	@Autowired
	PasswordEncoder encoder;

	@GetMapping(value = {"/","signup"}) //url 
	public String signup() {
		return "Signup";
	}
	
	@GetMapping("login")
	public String login() {
		return "Login";
	}
	
	@PostMapping("saveuser")
	public String saveuser(UserEntity userEntity, String confpassword, Model model) {
		if (!userEntity.getPassword().equals(confpassword)) {
	        model.addAttribute("error", "Passwords do not match");
	        return "Signup";
	    }
		String encPassword = encoder.encode(userEntity.getPassword());
		userEntity.setPassword(encPassword);
		// memory
		// bcrypt singleton -> single object -> autowired
		
		
		repositoryUser.save(userEntity);
		// send mail
		serviceMail.sendWelcomeMail(userEntity.getEmail(), userEntity.getFirstName());
		return "redirect:/login";// jsp
		
	}
	// open forgetpassword jsp
	@GetMapping("forgetpassword")
	public String forgetpassword() {
		return "Forgetpassword";
	}
	
	// submit on forgetpassword ->
	@PostMapping("sendotp")
	public String sendotp(String email, Model model) {
		// email valid
		Optional<UserEntity> op = repositoryUser.findByEmail(email);
		if (op.isEmpty()) {
			// email invalid
			model.addAttribute("error", "Email not found");
			return "Forgetpassword";
		}
		else {
			// email valid
			// send mail otp
			// opt generate
			// send mail otp
			String otp = "";
			otp = (int) (Math.random() * 1000000) + "";// 0.25875621458541
			
			UserEntity user = op.get();
			user.setOtp(otp);
			repositoryUser.save(user);// update otp for user
			serviceMail.sendOtpForForgetPassword(email, user.getFirstName(), otp);
		}
		return "Chengepassword";
	}
	
	
	@PostMapping("authenticate")
	public String authenticate(String email, String password, Model model, HttpSession session) {
		
		System.out.println(email);
		System.out.println(password);
		
		Optional<UserEntity> op = repositoryUser.findByEmail(email);
		
		// select * from users where email = :email and password = :password
		if (op.isPresent()) {
			// true
			// email
			UserEntity dbUser = op.get();

			boolean ans = encoder.matches(password, dbUser.getPassword());

			if (ans) {
				session.setAttribute("user", dbUser); // Store full user object in session
 // session -> user set
				if (dbUser.getRole().equals("ADMIN")) {

					return "redirect:/admindashboard";
				} else if (dbUser.getRole().equals("BUYER")) {

					return "redirect:/buyer-dashboard";
				
				}else if (dbUser.getRole().equals("SELLER")) {
	                return "redirect:/seller-dashboard"; // Redirect to Seller Dashboard
	            }
				
				else {
					model.addAttribute("error", "Please contact Admin with Error Code #0991");
					return "Login";
				}
			}
			
		}
		model.addAttribute("error", "Invalid Credentials");
		return "Login";
				
	}		   
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";// login url
	}
	


	
	@PostMapping("updatepassword")
	public String updatepassword(String email, String password, String otp, Model model) {
		
		Optional<UserEntity> op = repositoryUser.findByEmail(email);
		if (op.isEmpty()) {
			model.addAttribute("error", "Invalid Data");
			return "Changepassword";
		} else {
			UserEntity user = op.get();
			if (user.getOtp() != null && user.getOtp().equals(otp)) {
				String encPwd = encoder.encode(password);
				user.setPassword(encPwd);
				user.setOtp("");
				repositoryUser.save(user);// update
			} else {

				model.addAttribute("error", "Invalid Data");
				return "Changepassword";
			}
		}
		model.addAttribute("msg","Password updated");
		return "redirect:/login";
	}
}