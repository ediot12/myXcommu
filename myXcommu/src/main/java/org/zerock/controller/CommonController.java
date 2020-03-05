package org.zerock.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;


@Log4j
@Controller
public class CommonController {
	
	@RequestMapping(method=RequestMethod.GET, value="/accessError")
	public void accessDenied( Authentication auth, Model model ) {
		
		log.info(" access denied : " + auth );		
		
		model.addAttribute("msg", "Access Denied");
		
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/customLogin")
	public void loginInput( String error, String logout, Model model ) {
		
		log.info("error : " + error);
		log.info("logout : " + logout);
		
		if( error != null ) {
			model.addAttribute("error", "Login Error Check your Account");
		}
		
		if( logout != null ) {
			model.addAttribute("logout", "Logout !! ");
			
		}
		
		
	}
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping( method=RequestMethod.GET, value="/customLogout")
	public void logoutGet( HttpServletRequest request, HttpServletResponse response ) throws IOException {
		
		log.info("custom logout method get");
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication(); 
		
		log.info("auth : " + auth );
		
		if (auth != null){ 
			new SecurityContextLogoutHandler().logout(request, response, auth); 
			log.info("myXcommu logout Complete");
			response.sendRedirect("/customLogin");
		} else {
			
			log.info("logout failed");
		}
		
	}
	

	@PreAuthorize("isAuthenticated()")
	@RequestMapping( method=RequestMethod.POST, value="/customLogout")
	public void logoutPost( HttpServletResponse response ) throws IOException {
		
		log.info("custom logout method post");
		
		/* response.sendRedirect("/customLogout"); */
		
	}
	
	@RequestMapping( method=RequestMethod.GET, value="/accountRegister")
	public void accountRegister () {
		
		log.info("enter account register page");
		
	}

}
