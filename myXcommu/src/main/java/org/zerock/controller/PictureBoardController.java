package org.zerock.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.BoardReplyDTO;
import org.zerock.domain.CustomUser;
import org.zerock.domain.FileInfoDTO;
import org.zerock.domain.MemberVO;
import org.zerock.domain.PictureBoardDTO;
import org.zerock.domain.QuestionBoardDTO;
import org.zerock.mapper.CommonMapper;
import org.zerock.mapper.PictureBoardMapper;
import org.zerock.util.myXcommuUtil;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/picture/*")
public class PictureBoardController {
	
	@Autowired
	private PictureBoardMapper mapper;
	
	@Autowired 
	private CommonMapper commonMapper;
	
	@RequestMapping( value="/main", method=RequestMethod.GET )
	public String viewMainPage( Model model ) {
		
		ArrayList<PictureBoardDTO> pictureList = mapper.getPictureBoardList();
		
		log.info("pictureList ::: " +  pictureList.size() );
		
		model.addAttribute("pictureList", pictureList);
		
		return "picture/main";
	}
	
	@RequestMapping( value="/register", method=RequestMethod.GET )
	public String viewRegisterPage( PictureBoardDTO dto , HttpServletRequest request ) {
		
		
		
		return "picture/register";
	}
	
	
	@Transactional
	@RequestMapping( value="/view/{num}", method=RequestMethod.GET )
	public String viewPicturePage( @PathVariable("num") int board_seq, Model model, HttpServletRequest request, HttpServletResponse response ) {
		
		PictureBoardDTO 			dto 		= mapper.getPictureBoard( board_seq );
		String 						userId 		= dto.getWriter();
		MemberVO 					regiUser 	= commonMapper.getRegiUserInfor( userId );
		Map<String,Object> 			findMap		= new HashMap<String,Object>();
		ArrayList<PictureBoardDTO>	pictureList = mapper.getPictureBoardList();
		
		

		findMap.put("type"	, "3");
		findMap.put("seq"	, board_seq);
		
		Cookie[] cookies = request.getCookies();
		boolean existCookie = false;
		Map<String,Object> updateMap = new HashMap<String,Object>();
		
		 // 쿠키가 있을 경우 >> 이부분만 따로 common할수도있을듯.. 믿에는 좀 그렇슴 
        if (cookies != null && cookies.length > 0) {
            for (int i = 0; i < cookies.length; i++) {
            	
                if ( cookies[i].getName().equals( "picture" + "-" + board_seq ) ){
                	existCookie = true;
                	break;
                }
            }
        }
        
      //들어온적이 없다면 update를 시켜줘야함  + 쿠키 생성
        if( existCookie == false ) {
        	
        	log.warn( "cookie create!!!! : " + board_seq );
        	Cookie addCookie = new Cookie( "picture" + "-" + board_seq  , Integer.toString( board_seq ) );
        	addCookie.setMaxAge( 60 );
        	
        	updateMap.put("boardType"	, myXcommuUtil.returnBoardType( "picture" ) );
        	updateMap.put("boardSeq"	, board_seq );
        	
			commonMapper.updateViewCnt( updateMap );
			
			log.warn("come here?");
        	
        	response.addCookie( addCookie );
        	
        	
        }
		

		ArrayList<BoardReplyDTO>	replyList 	= commonMapper.getBoardReplyList(findMap);
		
		model.addAttribute("pictureBoard"	, dto );
		model.addAttribute("replyList"		, replyList );
		model.addAttribute("contentRegiDate", regiUser.getRegDate() );
		model.addAttribute("userConnectDate", regiUser.getUpdateDate() );
		model.addAttribute( "writerInfo"    , regiUser );	
		model.addAttribute("pictureList"	, pictureList);
		
		return "picture/view";
		
	}
	
	@Transactional
	@RequestMapping( value="/registerPicture", method=RequestMethod.POST )
	public void registerPicture( PictureBoardDTO dto , HttpServletRequest request, HttpServletResponse response ) throws IOException {
		
		Authentication 		authentication 	= SecurityContextHolder.getContext().getAuthentication();
		CustomUser 			user 			= (CustomUser) authentication.getPrincipal();
		Document 			doc 			= Jsoup.parse( dto.getContent() );
        Elements 			img_tags 		= doc.select("img");
        Map<String,Object>	insertMap		= new HashMap<String,Object>();
        
		dto.setWriter( user.getUsername() );
        dto.setBase64_code( img_tags.get(0).attr("src") );
        
        
        
        mapper.registerPictureBoard( dto );

        insertMap.put( "writer"		, user.getUsername() );
        insertMap.put( "content"	, dto.getContent() 	);
        insertMap.put( "board_type"	, "3" );
        insertMap.put( "subject"	, dto.getSubject() );
        insertMap.put( "seq"		, mapper.currSequenceVal() );
        
        commonMapper.insertBoardDBLog( insertMap );
       
		
		log.info( "picture dto :::: " + dto );
		
		response.sendRedirect("/picture/main");
		
	}
	
	@RequestMapping( value="/modify/{num}")
	public String viewModifyPage( @PathVariable("num") int board_seq, Model model, HttpServletResponse response ) throws IOException {
		
		Authentication 		authentication 	= SecurityContextHolder.getContext().getAuthentication();
		CustomUser 			user 			= (CustomUser) authentication.getPrincipal();
		PictureBoardDTO 	dto 			= mapper.getPictureBoardBySeq( board_seq );
		String 				userId 			= dto.getWriter();
		
		
		//url 조작으로 인해 권한없는 유저가 수정하려는 경우
		if ( !userId.equals( user.getUsername() ) ){
			
			response.sendRedirect("/picture/main");
			return null;
		}
		
		model.addAttribute("pictureBoard"	, dto );
		
		log.info("modify board :: " + dto );
		
		return "/picture/modify";
	}
	
	
	@Transactional
	@RequestMapping( value="/modify/updatePictureBoard", method=RequestMethod.POST )
	public void updateQuestion( HttpServletRequest request, PictureBoardDTO dto, HttpServletResponse response ) throws IOException {
		
		Authentication 		authentication 	= SecurityContextHolder.getContext().getAuthentication();
		CustomUser 			user 			= (CustomUser) authentication.getPrincipal();
		Map<String,Object> 	insertMap 		= new HashMap<String,Object>();
		int					boardSeq		= Integer.parseInt( request.getParameter("boardSeq") );
		insertMap.put( "type"		, "3");
		insertMap.put( "seq"		, boardSeq );
		insertMap.put( "division"	, dto.getDivision() 	);
		insertMap.put( "content"	, dto.getContent() 		);
		insertMap.put( "subject"	, dto.getSubject() 		);
		
		log.info("update dto :: " + dto );
		log.info("current login user :: " + user.getUsername() );
		log.info("register user is :: " + dto.getWriter() );
		log.info("login user == writer ?? :: " + user.getUsername().equals( dto.getWriter() ));
		
				
		int updateCnt = mapper.updatePictureBoard(insertMap);

		if (updateCnt == 0) {
			log.warn("update error occured!!!!!");
		}
		 
		
		
		response.sendRedirect("/picture/main");
	}
	
	
	@PreAuthorize("permitAll()")
	@RequestMapping( value="/register/imageUpload", method=RequestMethod.GET )
	public ResponseEntity<String> imageUpload() {
		log.info("image upload Controller!!");
		
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	

}
