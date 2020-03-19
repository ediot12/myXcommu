package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class SearchController {
	
	
	@RequestMapping( value="/allSearch", method=RequestMethod.GET )
	public String viewSearchPage( Model model ) {
		
		
		return "etc/allSearch";
	}

}
