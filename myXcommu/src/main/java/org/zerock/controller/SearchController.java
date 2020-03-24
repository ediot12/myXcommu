package org.zerock.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.domain.SearchBoardDTO;
import org.zerock.mapper.CommonMapper;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class SearchController {
	
	
	@Autowired
	private CommonMapper commonMapper;
	
	
	@RequestMapping( value="/allSearch", method=RequestMethod.GET )
	public String viewSearchPage( Model model, HttpServletRequest request ) {
		
		 String searchWord = request.getParameter("searchWord"); 
		
		ArrayList<SearchBoardDTO> searchList = commonMapper.getAllSearchReport( searchWord );

		model.addAttribute("searchList", searchList); 
		model.addAttribute("searchWord", searchWord); 

		log.info("search word is :: "  + searchWord );
		log.info("search!!!!"  + searchList );
		
		return "etc/allSearch";
	}

}
