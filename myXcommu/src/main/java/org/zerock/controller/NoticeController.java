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
import org.zerock.domain.FileInfoDTO;
import org.zerock.domain.MemberVO;
import org.zerock.domain.NoticeDTO;
import org.zerock.domain.ProposalBoardDTO;
import org.zerock.domain.QuestionBoardDTO;
import org.zerock.mapper.CommonMapper;
import org.zerock.mapper.NoticeMapper;
import org.zerock.util.myXcommuUtil;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value="/notice/*")
public class NoticeController {
	
	@Autowired
	private NoticeMapper mapper;
	
	@Autowired
	private CommonMapper commonMapper;
	
	@RequestMapping( value="/main", method=RequestMethod.GET )
	public String viewMainPage( Model model ) {
		
		ArrayList<NoticeDTO> noticeList = mapper.getAllNoticeList();
		
		model.addAttribute("noticeList", noticeList);
		
		return "/notice/main";
		
	}
	
	
	@RequestMapping( value="/register", method=RequestMethod.GET )
	public String registerPage() {
		
		
		return "/notice/register";
	}
	
	@Transactional
	@RequestMapping( value="/registerNotice", method=RequestMethod.POST )
	public void registerNotice( NoticeDTO dto , HttpServletRequest request, HttpServletResponse response ) throws IOException {
		
		Authentication 		authentication 	= SecurityContextHolder.getContext().getAuthentication();
		CustomUser 			user 			= (CustomUser) authentication.getPrincipal();
        
		dto.setWriter( user.getUsername() );
		/* dto.setDivision( divisionProposal ( dto.getDivision() ) ); */
        
        mapper.registerNotice( dto );

		
		log.info( "notice dto :::: " + dto );
		
		response.sendRedirect("/notice/main");
		
	}
	
	@Transactional
	@RequestMapping( value="/view/{num}", method=RequestMethod.GET )
	public String viewContentPage( @PathVariable("num") int board_seq, Model model, HttpServletRequest request, HttpServletResponse response ) {
		
		NoticeDTO 				dto 		= mapper.getNoticeBySeq( board_seq );
		String 					userId 		= dto.getWriter();
		MemberVO 				regiUser 	= commonMapper.getRegiUserInfor( userId );
		ArrayList<NoticeDTO> 	noticeList 	= mapper.getAllNoticeList();
		
		
		Cookie[] 			cookies 	= request.getCookies();
		boolean 			existCookie = false;
		Map<String,Object> 	updateMap 	= new HashMap<String,Object>();
		
		 // 쿠키가 있을 경우 >> 이부분만 따로 common할수도있을듯.. 믿에는 좀 그렇슴 
        if (cookies != null && cookies.length > 0) {
            for (int i = 0; i < cookies.length; i++) {
            	
                if ( cookies[i].getName().equals( "notice" + "-" + board_seq ) ){
                	existCookie = true;
                	break;
                }
            }
        }
        
      //들어온적이 없다면 update를 시켜줘야함  + 쿠키 생성
        if( existCookie == false ) {
        	
        	log.warn( "cookie create!!!! : " + board_seq );
        	Cookie addCookie = new Cookie( "notice" + "-" + board_seq  , Integer.toString( board_seq ) );
        	addCookie.setMaxAge( 60 );
        	
        	updateMap.put("boardType"	, myXcommuUtil.returnBoardType( "notice" ) );
        	updateMap.put("boardSeq"	, board_seq );
        	
			commonMapper.updateViewCnt( updateMap );
			
			log.warn("come here?");
        	
        	response.addCookie( addCookie );
        	
        	
        }
		
		
		model.addAttribute("board"			, dto ); 
		model.addAttribute("contentRegiDate", regiUser.getRegDate() );
		model.addAttribute("userConnectDate", regiUser.getUpdateDate() );
		model.addAttribute( "writerInfo"    , regiUser );
		model.addAttribute("noticeList"		, noticeList);
		
		
		return "notice/view";
	}
	

	@RequestMapping( value="/modify/{num}")
	public String viewModifyPage( @PathVariable("num") int board_seq, Model model, HttpServletResponse response ) throws IOException {
		
		Authentication 		authentication 	= SecurityContextHolder.getContext().getAuthentication();
		CustomUser 			user 			= (CustomUser) authentication.getPrincipal();
		NoticeDTO		 	dto 			= mapper.getNoticeBySeq( board_seq );
		String 				userId 			= dto.getWriter();
		Map<String,Object>	findMap			= new HashMap<String,Object>();

		findMap.put("type"	, "5");
		findMap.put("seq"	, board_seq);
		
		
		//url 조작으로 인해 권한없는 유저가 수정하려는 경우
		if ( !userId.equals( user.getUsername() ) ){
			
			response.sendRedirect("/notice/main");
			return null;
		}
		
		
		model.addAttribute("board"			, dto );
		
		log.info("modify board :: " + dto );
		
		return "/notice/modify";
	}
	
	@Transactional
	@RequestMapping( value="/modify/updateNotice", method=RequestMethod.POST )
	public void updateNotice( HttpServletRequest request, NoticeDTO dto, HttpServletResponse response ) throws IOException {
		
		Authentication 		authentication 	= SecurityContextHolder.getContext().getAuthentication();
		CustomUser 			user 			= (CustomUser) authentication.getPrincipal();
		Map<String,Object> 	insertMap 		= new HashMap<String,Object>();
		int					boardSeq		= Integer.parseInt( request.getParameter("boardSeq") );
		
		insertMap.put( "type"		, "5");
		insertMap.put( "seq"		, boardSeq );
		insertMap.put( "content"	, dto.getContent() 		);
		insertMap.put( "subject"	, dto.getSubject() 		);
		
				
		int updateCnt = mapper.updateNotice(insertMap);

		if (updateCnt == 0) {
			log.warn("update error occured!!!!!");
		}
		 
		
		
		response.sendRedirect("/notice/main");
		
	}
	
	
}
