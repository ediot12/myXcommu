package org.zerock.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.domain.CustomUser;
import org.zerock.mapper.CommonMapper;

import lombok.extern.log4j.Log4j;


@Log4j
@Controller
public class CommonController {
	
	@Autowired
	private CommonMapper mapper;
	
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
	
	

	
	@Transactional
	@PreAuthorize("isAuthenticated()")
	@RequestMapping( value="/common/view/recommandBoard", method=RequestMethod.POST )
	public ResponseEntity<String> recommandBoard( HttpServletRequest request ){
		
		Authentication 		authentication 	= SecurityContextHolder.getContext().getAuthentication();
		CustomUser 			currentUser		= (CustomUser) authentication.getPrincipal();
		String				registerUser	= request.getParameter("writer");
		int					boardSeq		= Integer.parseInt( request.getParameter("boardSeq") );
		String				boardType		= request.getParameter("boardType");
		Map<String,Object>	insertMap		= new HashMap<String,Object>();
		

		insertMap.put("type", boardType);
		insertMap.put("user", currentUser.getUsername() );
		insertMap.put("seq"	, boardSeq);
		
		int	recommandCount = mapper.selectRecommandQuestionUserRecord( insertMap );
		
		if( registerUser.equals( currentUser.getUsername() ) || recommandCount != 0 ) {
			log.warn("register user == recommand user or already recommand user");
			log.warn("recommand count :: " + recommandCount );
			return new ResponseEntity<>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
		mapper.recommandBoard( insertMap );
		
		
		return new ResponseEntity<>("success", HttpStatus.OK );
	}
	
	
	@Transactional
	@PreAuthorize("isAuthenticated()")
	@RequestMapping( value="/common/view/deleteBoard", method=RequestMethod.GET )
	public ResponseEntity<String> deleteQuestion( HttpServletRequest request ){
		
		Authentication 		authentication 	= SecurityContextHolder.getContext().getAuthentication();
		CustomUser 			currentUser		= (CustomUser) authentication.getPrincipal();
		String				registerUser	= request.getParameter("writer");
		int					boardSeq		= Integer.parseInt( request.getParameter("boardSeq") );
		String				boardType		= request.getParameter("boardType");
		Map<String,Object>	insertMap		= new HashMap<String,Object>();
		
		if( !registerUser.equals( currentUser.getUsername() ) ) {
			log.warn(" authorize failed!!!! ");
			return new ResponseEntity<>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		insertMap.put("type"	, boardType);
		insertMap.put("seq"		, boardSeq);
		
		log.info("insertMap :: " + insertMap);
		
		mapper.deleteBoard( insertMap ); // 질문게시글 자체 삭제 
		mapper.deleteBoardAllReply( insertMap ); //  질문게시글의 댓글 삭제
		mapper.deleteBoardReplyRecord( insertMap ); // 질문게시글의 추천 삭제
		
		
		log.info( "delete Board && reply complete!! ");
		
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	

	
	@Transactional
	@RequestMapping( value="/common/view/registerReply", method=RequestMethod.POST )
	public ResponseEntity<String> registerReply( HttpServletRequest request, HttpServletResponse response ) throws IOException {
		
		Map<String,Object>	insertMap		= new HashMap<String,Object>();
		Authentication 		authentication 	= SecurityContextHolder.getContext().getAuthentication();
		CustomUser 			user 			= (CustomUser) authentication.getPrincipal();
		String				boardType		= currentBoardType( request.getParameter("boardType") );
		
		insertMap.put( "replyer"			, user.getUsername() 	);
		insertMap.put( "reply" 				, request.getParameter("reply") );
		insertMap.put( "board_type"			, boardType);
		insertMap.put( "board_seq"			, Integer.parseInt( request.getParameter("boardSeq") ));
		
		
		mapper.registerReply( insertMap );
		
		
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	

	
	@Transactional
	@PreAuthorize("isAuthenticated()")
	@RequestMapping( value="/common/view/empathyReply", method=RequestMethod.POST )
	public ResponseEntity<String> empathyReplyAction( HttpServletRequest request ){
		Authentication 		authentication 	= SecurityContextHolder.getContext().getAuthentication();
		CustomUser 			currentUser		= (CustomUser) authentication.getPrincipal();
		String				replyerUser		= request.getParameter("replyer");
		int					boardSeq		= Integer.parseInt( request.getParameter("boardSeq") );
		int					replySeq		= Integer.parseInt( request.getParameter("replySeq") );
		String				boardType		= request.getParameter("boardType");
		String				empathyType		= request.getParameter("empathy");
		Map<String,Object>	insertMap		= new HashMap<String,Object>();
		
		insertMap.put("board_type"		, boardType);
		insertMap.put("board_seq"		, boardSeq);
		insertMap.put("reply_seq"		, replySeq);
		insertMap.put("recommand_user"	, currentUser.getUsername() );
		insertMap.put("empathy_type"	, empathyType);
		
		int empathyRecord = mapper.countEmpathyRecordToUser( insertMap );
		
		if( empathyRecord != 0 || replyerUser.equals( currentUser.getUsername() ) ) {
			log.info("count :: " + empathyRecord);
			log.info("id equal :: " + replyerUser.equals( currentUser.getUsername() ));
			log.info("already empathy reply recorded or empathy user is same writer" );
			return new ResponseEntity<>("fail", HttpStatus.INTERNAL_SERVER_ERROR );
		}
		
		mapper.empathyReply( insertMap );
		log.info("empathy success!");
		
		return new ResponseEntity<>("success", HttpStatus.OK );
	}
	
	
	
	private String currentBoardType( String boardType ) {
		
		if( boardType.equals("qna") ) { return "2"; }
		else if( boardType.equals("picture") ) { return "3"; }
		else { return boardType; }
	}
	
	
	

}
