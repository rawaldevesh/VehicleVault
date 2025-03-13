package com.vehiclevault;

import java.util.Map;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

@SpringBootApplication
public class VehiclevaultApplication {

	public static void main(String[] args) {
		SpringApplication.run(VehiclevaultApplication.class, args);
	}
	
	@Bean
	PasswordEncoder encoder() {
		return new BCryptPasswordEncoder(5);
	}
	
	
	@Bean
	Cloudinary cloudinary() {
		Map<String, String> config = ObjectUtils.asMap("cloud_name", "dorup52uz", "api_key", "977478386553335",
				"api_secret", "_UypLy4-xyCHFPDCH6k3HalpD2M");
		return new Cloudinary(config);
	}

}
