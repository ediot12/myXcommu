package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
public class LoginAndLogoutController {
	

	
	
	@RequestMapping(method=RequestMethod.GET, value="/member")
	public void doMember() {
		
		log.info("Logined member");
		
		
	}
	
	
	@RequestMapping(method=RequestMethod.GET, value="/admin")
	public void doAdmin() {
		
		log.info("Admin Only");
		
		
	}

}
