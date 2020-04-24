package org.zerock.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.domain.BoardReplyDTO;
import org.zerock.domain.CustomUser;
import org.zerock.domain.FreeBoardDTO;
import org.zerock.domain.MemberVO;
import org.zerock.domain.NoticeDTO;
import org.zerock.domain.ProposalBoardDTO;
import org.zerock.mapper.CommonMapper;
import org.zerock.mapper.FreeBoardMapper;
import org.zerock.util.myXcommuUtil;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/free/*")
public class FreeBoardController {
	
	@Autowired
	private FreeBoardMapper mapper;
	
	@Autowired
	private CommonMapper commonMapper;
	
	@RequestMapping( value="/main", method=RequestMethod.GET ) 
	public String viewMainPage( Model model ) {
		
		ArrayList<FreeBoardDTO> freeBoardList =  mapper.getAllFreeBoardList();
		
		
		model.addAttribute("freeBoardList", freeBoardList);
		
		
		return "free/main";
	}
	
	@RequestMapping( value="/register", method=RequestMethod.GET )
	public String viewRegisterPage() {
		
		return "free/register";
	}
	
	
	@Transactional
	@RequestMapping( value="/registerFreeBoard", method=RequestMethod.POST )
	public void registerFreeBoard( FreeBoardDTO dto, HttpServletRequest request, HttpServletResponse response ) throws Exception{
		
		Map<String,Object> insertMap = new HashMap<String,Object>();
		log.info( "free board dto :: " + dto );
		
		/*
		 * mapper.insertFreeBoard( dto );
		 * 
		 * 
		 * int seq = mapper.currSequenceVal();
		 * 
		 * insertMap.put( "writer" , dto.getWriter() ); insertMap.put( "division" ,
		 * "board" ); insertMap.put( "content" , dto.getContent() ); insertMap.put(
		 * "subject" , dto.getSubject() ); insertMap.put( "board_type" , "6" );
		 * insertMap.put( "seq" , seq );
		 * 
		 * commonMapper.insertBoardDBLog( insertMap );
		 */
		
		response.sendRedirect("/free/main");
	}
	
	@Transactional
	@RequestMapping( value="/view/{num}", method=RequestMethod.GET )
	public String viewFreeBoardPage( @PathVariable("num") int free_board_seq, Model model, HttpServletRequest request, HttpServletResponse response  ) {
		
		FreeBoardDTO 				dto 			= mapper.getFreeBoard( free_board_seq );
		String 						userId 			= dto.getWriter();
		MemberVO 					regiUser 		= commonMapper.getRegiUserInfor( userId );
		Map<String,Object>			findMap			= new HashMap<String,Object>();
		ArrayList<FreeBoardDTO> 	freeBoardList 	=  mapper.getAllFreeBoardList();
		
		
		
		
		Cookie[] cookies = request.getCookies();
		boolean existCookie = false;
		Map<String,Object> updateMap = new HashMap<String,Object>();
		
		
        // 쿠키가 있을 경우 >> 이부분만 따로 common할수도있을듯.. 믿에는 좀 그렇슴 
        if (cookies != null && cookies.length > 0) {
            for (int i = 0; i < cookies.length; i++) {
            	
                if ( cookies[i].getName().equals( "free" + "-" + free_board_seq ) ){
                	existCookie = true;
                	break;
                }
            }
        }
        
      //들어온적이 없다면 update를 시켜줘야함  + 쿠키 생성
        if( existCookie == false ) {
        	
        	log.warn( "cookie create!!!! : " + free_board_seq );
        	Cookie addCookie = new Cookie( "free" + "-" + free_board_seq  , Integer.toString( free_board_seq ) );
        	addCookie.setMaxAge( 60 );
        	
        	updateMap.put("boardType"	, myXcommuUtil.returnBoardType( "free" ) );
        	updateMap.put("boardSeq"	, free_board_seq );
        	
			commonMapper.updateViewCnt( updateMap );
        	
        	response.addCookie( addCookie );
        	
        	
        }

		findMap.put("type"	, "6");
		findMap.put("seq"	, free_board_seq);
		
		ArrayList<BoardReplyDTO>	replyList	= commonMapper.getBoardReplyList(findMap);
		
		model.addAttribute( "board" 			, dto );
		model.addAttribute( "replyList"			, replyList );
		model.addAttribute( "contentRegiDate"	, regiUser.getRegDate() );
		model.addAttribute( "userConnectDate"	, regiUser.getUpdateDate() );
		model.addAttribute( "writerInfo"    	, regiUser );	
		model.addAttribute("freeBoardList"		, freeBoardList);
		
		return "free/view";
	}
	
	@RequestMapping( value="/modify/{num}")
	public String viewModifyPage( @PathVariable("num") int board_seq, Model model, HttpServletResponse response ) throws IOException {
		
		Authentication 		authentication 	= SecurityContextHolder.getContext().getAuthentication();
		CustomUser 			user 			= (CustomUser) authentication.getPrincipal();
		FreeBoardDTO	 	dto 			= mapper.getFreeBoard( board_seq );
		String 				userId 			= dto.getWriter();
		
		//url 조작으로 인해 권한없는 유저가 수정하려는 경우
		if ( !userId.equals( user.getUsername() ) ){
			
			response.sendRedirect("/free/main");
			return null;
		}
		
		
		model.addAttribute("board"			, dto );
		
		return "/free/modify";
	}
	
	@Transactional
	@RequestMapping( value="/modify/updateFreeBoard", method=RequestMethod.POST )
	public void updateNotice( HttpServletRequest request, FreeBoardDTO dto, HttpServletResponse response ) throws IOException {
		
		Authentication 		authentication 	= SecurityContextHolder.getContext().getAuthentication();
		CustomUser 			user 			= (CustomUser) authentication.getPrincipal();
		Map<String,Object> 	insertMap 		= new HashMap<String,Object>();
		int					boardSeq		= Integer.parseInt( request.getParameter("boardSeq") );
		
		insertMap.put( "type"		, "6");
		insertMap.put( "seq"		, boardSeq );
		insertMap.put( "content"	, dto.getContent() 		);
		insertMap.put( "subject"	, dto.getSubject() 		);
		
				
		int updateCnt = mapper.updateFreeBoard(insertMap);

		if (updateCnt == 0) {
			log.warn("update error occured!!!!!");
		}
		 
		
		
		response.sendRedirect("/free/main");
		
	}
	

}
