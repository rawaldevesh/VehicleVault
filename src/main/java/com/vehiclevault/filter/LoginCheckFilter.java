package com.vehiclevault.filter;

import java.io.IOException;
import java.util.ArrayList;

import org.springframework.stereotype.Component;

import com.vehiclevault.entity.UserEntity;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Component
public class LoginCheckFilter implements Filter {


	ArrayList<String> publicURL = new ArrayList<>();
	public LoginCheckFilter() {
		publicURL.add("/login");
		publicURL.add("/signup");
		publicURL.add("/saveuser");
		publicURL.add("/forgetpassword");
		publicURL.add("/sendotp");
		publicURL.add("/authenticate");
		publicURL.add("/logout");
		publicURL.add("/updatepassword");
		publicURL.add("/home");
		publicURL.add("//");
		publicURL.add("/hvehiclevault");
		
		
	
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		//casting req
		HttpServletRequest requestHttp = (HttpServletRequest) request;
		
		String url = requestHttp.getRequestURI().toString(); // url = port + uri req like localhost:/9999 = port and /home/profile = uri
		
		String uri = requestHttp.getRequestURI();
 
		
		System.out.println("Filter Call...." + uri);

		if (publicURL.contains(uri) || uri.contains(".css") || uri.contains(".js") || uri.contains("dist")
				|| uri.contains("images")) {
			chain.doFilter(requestHttp, response);// go Ahead
		} else {
			HttpSession session = requestHttp.getSession();
			UserEntity user = (UserEntity) session.getAttribute("user");

			if (user == null) {
				requestHttp.getRequestDispatcher("login").forward(request, response);
			} else {
	            // Role-based access check
	            if (uri.startsWith("/admin")) {
	                if ("ADMIN".equals(user.getRole())) {
	                    chain.doFilter(request, response);
	                } else {
	                    requestHttp.getRequestDispatcher("login").forward(request, response);
	                }
	            } else if (uri.startsWith("/seller")) {
	                if ("SELLER".equals(user.getRole())) {
	                    chain.doFilter(request, response);
	                } else {
	                    requestHttp.getRequestDispatcher("login").forward(request, response);
	                }
	            } else if (uri.startsWith("/buyer")) {
	                if ("BUYER".equals(user.getRole())) {
	                    chain.doFilter(request, response);
	                } else {
	                    requestHttp.getRequestDispatcher("login").forward(request, response);
	                }
	            } else {
	                chain.doFilter(request, response); // Common pages
	            }
				// user role admin ?

			}
		}
		// go Ahead
	}
}// go Ahead