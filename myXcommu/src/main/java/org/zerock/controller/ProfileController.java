package org.zerock.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.domain.CustomUser;
import org.zerock.domain.MemberStatsDTO;
import org.zerock.domain.MemberVO;
import org.zerock.domain.UserLogDTO;
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
		
		MemberVO 				member 		= mapper.getAccountInformation(currentLoginId);
		ArrayList<UserLogDTO> 	userLog 	= mapper.getRecentlyUserLog(currentLoginId);
		MemberStatsDTO 			writerCount = mapper.getWriteBoardReplyCount( currentLoginId );
		
		model.addAttribute("member"		, member );
		model.addAttribute("userLog"	, userLog );
		model.addAttribute("writerCnt"	, writerCount);
		
		log.info("userLog :: " + userLog);
		
		return "etc/profile";
	}
	
	@RequestMapping( value="/myProfileModify", method=RequestMethod.GET )
	public String viewModifyPage( Model model, HttpSession session ) {
		
		String currentLoginId = (String) session.getAttribute("currentUserId");
		
		
		MemberVO 		member 			= mapper.getAccountInformation(currentLoginId);
		MemberStatsDTO 	writerCount 	= mapper.getWriteBoardReplyCount( currentLoginId );
		
		model.addAttribute("member"		, member);
		model.addAttribute("writerCnt"	, writerCount);
		
		log.info( "my user Log :: " + member ); 
		
		return "etc/profileModify";
	}
	
	@Transactional
	@RequestMapping( value="/updateProfile", method=RequestMethod.POST )	
	public void updateProfile( MemberVO vo,  HttpServletRequest request, HttpServletResponse response, HttpSession session ) throws Exception {
		
		Authentication 		authentication 	= SecurityContextHolder.getContext().getAuthentication();
		CustomUser 			user 			= (CustomUser) authentication.getPrincipal();		
		String 				userId 			= request.getParameter("userid");
		
		
		log.info("memverVo is ::: " + vo );
		log.info("userid ::: " + userId );
		
		
		if (!user.getUsername().equals(userId)) {
			log.warn("잘못된 접근!!");
			response.sendRedirect("myProfile");
			return;
		}
		 
		
		mapper.updateProfile(vo);
		
		if( !vo.getProfile_image().equals("") ) {
			session.removeAttribute("image64");
			session.setAttribute("image64", vo.getProfile_image() );
		}
		
		response.sendRedirect("myProfile");
	}
	
	
	@RequestMapping( value="/viewProfile", method=RequestMethod.GET )
	public String viewUserProfile( Model model, HttpServletRequest request  ) {
		
		String 					viewUserId 	= request.getParameter("userId");
		MemberVO 				member 		= mapper.getAccountInformation(viewUserId);
		ArrayList<UserLogDTO> 	userLog 	= mapper.getRecentlyUserLog(viewUserId);
		MemberStatsDTO 			writerCount = mapper.getWriteBoardReplyCount( viewUserId );
		
		model.addAttribute("member"		, member);
		model.addAttribute("userLog"	, userLog );
		model.addAttribute("writerCnt"	, writerCount);
		
		log.info("userLog :: " + userLog);
		
		return "etc/profile";
	}
	
	@RequestMapping( value="/changePwPage", method=RequestMethod.GET )
	public String viewChangePwPage( HttpServletRequest request, Model model, HttpSession session ) {
		
		String 					currentLoginId 	= (String) session.getAttribute("currentUserId");
		MemberVO 				member 			= mapper.getAccountInformation( currentLoginId );
		
		model.addAttribute("member"		, member);
		
		return "etc/changePw";
	}
	
	@RequestMapping( value="checkPwAccount", method=RequestMethod.POST ) 
	public ResponseEntity<String> checkPwAccount( HttpServletRequest request, HttpSession session  ){
		
		String 					currentLoginId 	= (String) session.getAttribute("currentUserId");
		PasswordEncoder 		pwencoder 		= new BCryptPasswordEncoder();
		String 					checkPw 		= mapper.checkPwAccount( currentLoginId );
		String					originPw		= request.getParameter("originPw");
		String					newPw			= request.getParameter("newPw");
		boolean 				pwCompare 		= pwencoder.matches( originPw, checkPw );
		Map<String,Object>		updateMap		= new HashMap<String,Object>();
	
		
		if( pwCompare ) {
			
			updateMap.put("userId", currentLoginId);
			updateMap.put("userPw", pwencoder.encode( newPw ) );
			
			mapper.findPwTemp(updateMap); // sql이 같아서 그냥 갖다씀
			
			return new ResponseEntity<>("success", HttpStatus.OK);
		} else {
			return new ResponseEntity<>("error"	, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
	}

}
