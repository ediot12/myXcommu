package org.zerock.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
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
import org.zerock.domain.MemberVO;
import org.zerock.domain.PictureBoardDTO;
import org.zerock.domain.ProposalBoardDTO;
import org.zerock.mapper.CommonMapper;
import org.zerock.mapper.ProposalMapper;
import org.zerock.util.myXcommuUtil;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/proposal/*")
public class ProposalController {
	
	@Autowired
	private ProposalMapper mapper;
	
	@Autowired
	private CommonMapper commonMapper;
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String viewProposalPage( Model model ) {
		
		ArrayList<ProposalBoardDTO> proposalList = mapper.getAllProposalBoard();
		
		model.addAttribute( "proposalList", proposalList );
		
		log.info("proposalList :: " + proposalList );
		
		return "/proposal/main";
	}
	
	@RequestMapping( value="/register", method=RequestMethod.GET )
	public String registerPage() {
		
		
		return "/proposal/register";
	}
	
	@Transactional
	@RequestMapping( value="/registerProposal", method=RequestMethod.POST )
	public void registerProposal( ProposalBoardDTO dto , HttpServletRequest request, HttpServletResponse response ) throws IOException {
		
		Authentication 		authentication 	= SecurityContextHolder.getContext().getAuthentication();
		CustomUser 			user 			= (CustomUser) authentication.getPrincipal();
        
		dto.setWriter( user.getUsername() );
		/* dto.setDivision( divisionProposal ( dto.getDivision() ) ); */
        
        mapper.registerProposalBoard( dto );

		
		log.info( "proposal dto :::: " + dto );
		
		response.sendRedirect("/proposal/main");
		
	}
	
	@Transactional
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value="/view/{num}", method=RequestMethod.GET)
	public String viewProposalPage( @PathVariable("num") int proposal_seq, Model model, HttpServletRequest request, HttpServletResponse response ) {
		
		ProposalBoardDTO 			dto 		= mapper.getProposalBoard( proposal_seq );
		String 						userId 		= dto.getWriter();
		MemberVO 					regiUser 	= commonMapper.getRegiUserInfor( userId );
		Map<String,Object>			findMap		= new HashMap<String,Object>();
		
		
		Cookie[] cookies = request.getCookies();
		boolean existCookie = false;
		Map<String,Object> updateMap = new HashMap<String,Object>();
 
		
		
        // 쿠키가 있을 경우 >> 이부분만 따로 common할수도있을듯.. 믿에는 좀 그렇슴 
        if (cookies != null && cookies.length > 0) {
            for (int i = 0; i < cookies.length; i++) {
            	
                if ( cookies[i].getName().equals( "proposal" + "-" + proposal_seq ) ){
                	existCookie = true;
                	break;
                }
            }
        }
        
      //들어온적이 없다면 update를 시켜줘야함  + 쿠키 생성
        if( existCookie == false ) {
        	
        	log.warn( "cookie create!!!! : " + proposal_seq );
        	Cookie addCookie = new Cookie( "proposal" + "-" + proposal_seq  , Integer.toString( proposal_seq ) );
        	addCookie.setMaxAge( 60 );
        	
        	updateMap.put("boardType"	, myXcommuUtil.returnBoardType( "proposal" ) );
        	updateMap.put("boardSeq"	, proposal_seq );
        	
			commonMapper.updateViewCnt( updateMap );
			
			log.warn("come here?");
        	
        	response.addCookie( addCookie );
        	
        	
        }
		
		/*
		 * myXcommuUtil.checkCookieUpdateView(request, response, "proposal",
		 * proposal_seq);
		 */
        

		findMap.put("type"	, "4");
		findMap.put("seq"	, proposal_seq);
		
		ArrayList<BoardReplyDTO>	replyList	= commonMapper.getBoardReplyList(findMap);
		
		model.addAttribute( "board" 			, dto );
		model.addAttribute( "replyList"			, replyList );
		model.addAttribute( "contentRegiDate"	, regiUser.getRegDate() );
		model.addAttribute( "userConnectDate"	, regiUser.getUpdateDate() );
		
		log.info("come!!?@");
		
		
		return "/proposal/view";
	}
	
	
	@RequestMapping( value="/modify/{num}")
	public String viewModifyPage( @PathVariable("num") int board_seq, Model model, HttpServletResponse response ) throws IOException {
		
		Authentication 		authentication 	= SecurityContextHolder.getContext().getAuthentication();
		CustomUser 			user 			= (CustomUser) authentication.getPrincipal();
		ProposalBoardDTO 	dto 			= mapper.getProposalBoard( board_seq );
		String 				userId 			= dto.getWriter();
		
		
		//url 조작으로 인해 권한없는 유저가 수정하려는 경우
		if ( !userId.equals( user.getUsername() ) ){
			
			response.sendRedirect("/proposal/main");
			return null;
		}
		
		model.addAttribute("proposalBoard"	, dto );
		
		log.info("proposal modify board :: " + dto );
		
		return "/proposal/modify";
	}
	
	
	@Transactional
	@RequestMapping( value="/modify/updateProposal", method=RequestMethod.POST )
	public void updateProposal( HttpServletRequest request, ProposalBoardDTO dto, HttpServletResponse response ) throws IOException {
		
		Authentication 		authentication 	= SecurityContextHolder.getContext().getAuthentication();
		CustomUser 			user 			= (CustomUser) authentication.getPrincipal();
		Map<String,Object> 	insertMap 		= new HashMap<String,Object>();
		int					boardSeq		= Integer.parseInt( request.getParameter("boardSeq") );
		insertMap.put( "type"		, "4");
		insertMap.put( "seq"		, boardSeq );
		insertMap.put( "division"	, dto.getDivision() 	);
		insertMap.put( "content"	, dto.getContent() 		);
		insertMap.put( "subject"	, dto.getSubject() 		);
		
		log.info("update dto :: " + dto );
		log.info("current login user :: " + user.getUsername() );
		log.info("register user is :: " + dto.getWriter() );
		log.info("login user == writer ?? :: " + user.getUsername().equals( dto.getWriter() ));
		
				
		int updateCnt = mapper.updateProposalBoard(insertMap);

		if (updateCnt == 0) {
			log.warn("update error occured!!!!!");
		}
		 
		
		
		response.sendRedirect("/proposal/main");
	}

}
