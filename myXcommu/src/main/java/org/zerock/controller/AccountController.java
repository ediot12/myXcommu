package org.zerock.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.MemberVO;
import org.zerock.service.AccountService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Controller
@Log4j
public class AccountController {
	
	private AccountService service;

	@PreAuthorize("permitAll()")
	@RequestMapping( method=RequestMethod.POST, value="/insertAccount")
	public void accountRegister( MemberVO vo, HttpServletResponse response ) throws IOException {
		
		log.info( "first : :::: " + vo);
		
		String userId 			= vo.getUserid();
		String userPw 			= vo.getUserpw();
		String userEmail 		= vo.getEmail();
		String profile_info 	= vo.getProfile_info();
		String profile_image 	= vo.getProfile_image();
		
		log.info("infomation : " + userId + " , " + userPw + " , " + userEmail);
		
		int count = service.registerAccount( userId, userPw, userEmail, profile_image, profile_info );
		
		log.info( "vo!!!! : " + vo  );
		log.info("into db !!! :: " + count );
		
		response.sendRedirect("/");
		
	}
	
	
	@PreAuthorize("permitAll()")
	@RequestMapping( value="/profileUploadCheck", method=RequestMethod.POST )
	public ResponseEntity<String> checkProfileImage( MultipartFile[] file ){

		log.info("check Profile Image :: " + file );
		log.info("check Profile Image[0] :: " + file[0] );
		
		return new ResponseEntity<>("success", HttpStatus.OK );
	}
	
}
