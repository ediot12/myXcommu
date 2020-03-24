package org.zerock.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.domain.CustomUser;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.AccountMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class ProfileController {
	
	@Autowired
	private AccountMapper mapper;
	
	@RequestMapping( value="/myProfile", method=RequestMethod.GET )
	public String viewProfilePage( Model model, HttpSession session ) {
		
		String currentLoginId = (String) session.getAttribute("currentUserId");
		
		MemberVO member = mapper.getAccountInformation(currentLoginId);
		
		model.addAttribute("member", member);
		
		return "etc/profile";
	}
	
	@RequestMapping( value="/myProfileModify", method=RequestMethod.GET )
	public String viewModifyPage( Model model, HttpSession session ) {
		
		String currentLoginId = (String) session.getAttribute("currentUserId");
		
		MemberVO member = mapper.getAccountInformation(currentLoginId);
		
		model.addAttribute("member", member);
		return "etc/profileModify";
	}
	
	@Transactional
	@RequestMapping( value="/updateProfile", method=RequestMethod.POST )	
	public void updateProfile( MemberVO vo,  HttpServletRequest request, HttpServletResponse response, HttpSession session ) throws Exception {
		
		Authentication 		authentication 	= SecurityContextHolder.getContext().getAuthentication();
		CustomUser 			user 			= (CustomUser) authentication.getPrincipal();
		
		String profile_info 	= vo.getProfile_info();
		String profile_image 	= vo.getProfile_image();
		String userId 			= request.getParameter("userid");
		
		
		log.info("memverVo is ::: " + vo );
		log.info("userid ::: " + userId );
		
		/*
		 * if( !user.getUsername().equals( userId ) ) { log.warn("잘못된 접근!!");
		 * response.sendRedirect("myProfile"); return; }
		 */
		
		mapper.updateProfile(vo);
		
		session.removeAttribute("image64");
		session.setAttribute("image64", vo.getProfile_image() );
		
		response.sendRedirect("myProfile");
	}

}
