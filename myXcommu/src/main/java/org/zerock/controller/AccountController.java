package org.zerock.controller;

import java.io.IOException;


import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.BoardAttachMapper;
import org.zerock.mapper.BoardMapper;
import org.zerock.service.AccountService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Controller
@Log4j
public class AccountController {
	
	private AccountService service;

	@RequestMapping( method=RequestMethod.POST, value="/insertAccount")
	public void accountRegister( MemberVO vo, HttpServletResponse response ) throws IOException {
		
		log.info( "first : :::: " + vo);
		
		String userId = vo.getUserid();
		String userPw = vo.getUserpw();
		String userEmail = vo.getEmail();
		
		log.info("infomation : " + userId + " , " + userPw + " , " + userEmail);
		
		int count = service.registerAccount( userId, userPw, userEmail );
		
		log.info("into db !!! :: " + count );
		
		response.sendRedirect("/");
		
	}

}
