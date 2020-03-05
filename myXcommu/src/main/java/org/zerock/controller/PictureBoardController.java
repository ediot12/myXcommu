package org.zerock.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.domain.PictureBoardDTO;
import org.zerock.mapper.PictureBoardMapper;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/picture/*")
public class PictureBoardController {
	
	@Autowired
	private PictureBoardMapper mapper;
	
	@RequestMapping( value="/main", method=RequestMethod.GET )
	public String viewMainPage() {
		
		ArrayList<PictureBoardDTO> pictureList = mapper.getPictureBoardList();
		
		return "picture/main";
	}
	
	@RequestMapping( value="/register", method=RequestMethod.GET )
	public String viewRegisterPage() {
		
		
		return "picture/register";
	}

}
