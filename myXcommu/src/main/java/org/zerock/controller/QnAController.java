package org.zerock.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.BoardReplyDTO;
import org.zerock.domain.CustomUser;
import org.zerock.domain.FileInfoDTO;
import org.zerock.domain.MemberVO;
import org.zerock.domain.QuestionBoardDTO;
import org.zerock.mapper.CommonMapper;
import org.zerock.mapper.QnABoardMapper;
import org.zerock.mapper.UploadFileMapper;
import org.zerock.util.myXcommuUtil;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/qna/*")
public class QnAController {

	@Autowired
	private QnABoardMapper mapper;
	
	@Autowired
	private CommonMapper commonMapper;
	
	@Autowired
	private UploadFileMapper fileMapper;
	
	private static int current_view_seq = -1;
	
	@RequestMapping( value ="/main", method=RequestMethod.GET )
	public String viewPage( Model model ) throws IOException {
		
		ArrayList<QuestionBoardDTO> boardList = mapper.getQuestionBoardList();
		current_view_seq = -1;
		
		//사실 이 부분은 애초에 db에서 제대로하던지 뭔가 다른방법을 찾던지 해야할듯 하다.
		for( int i = 0; i <  boardList.size(); i++ ) {
			
			boardList.get(i).setDivision( myXcommuUtil.returnDivisionType( boardList.get(i).getDivision() ) );
			
		}
		
		model.addAttribute( "list", boardList );
		
		return "qna/main";
		
	}
	
	@RequestMapping( value="/register", method=RequestMethod.GET )
	public String viewRegisterPage() {
		
		return "qna/register";
	}
	
	@RequestMapping( value="/modify/{num}")
	public String viewModifyPage( @PathVariable("num") int board_seq, Model model, HttpServletResponse response ) throws IOException {
		
		Authentication 		authentication 	= SecurityContextHolder.getContext().getAuthentication();
		CustomUser 			user 			= (CustomUser) authentication.getPrincipal();
		QuestionBoardDTO 	dto 			= mapper.getQuestionBySeq( board_seq );
		String 				userId 			= dto.getWriter();
		Map<String,Object>	findMap			= new HashMap<String,Object>();
		current_view_seq 					= board_seq; // 서버에서 값 저장하는거

		findMap.put("type"	, "2");
		findMap.put("seq"	, board_seq);
		
		FileInfoDTO 		fileInfo  = fileMapper.findFileInformation(findMap);
		
		//url 조작으로 인해 권한없는 유저가 수정하려는 경우
		if ( !userId.equals( user.getUsername() ) ){
			
			response.sendRedirect("/qna/main");
			return null;
		}
		
		dto.setDivision( dto.getDivision().trim() );
		
		model.addAttribute("board"			, dto );
		model.addAttribute("fileInfo"		, fileInfo );
		
		log.info("modify board :: " + dto );
		
		return "/qna/modify";
	}
	
	@Transactional
	@RequestMapping( value="/modify/updateQuestion", method=RequestMethod.POST )
	public void updateQuestion( HttpServletRequest request, QuestionBoardDTO dto, HttpServletResponse response, MultipartFile[] uploadFile ) throws IOException {
		
		Authentication 		authentication 	= SecurityContextHolder.getContext().getAuthentication();
		CustomUser 			user 			= (CustomUser) authentication.getPrincipal();
		Map<String,Object> 	insertMap 		= new HashMap<String,Object>();
		int					boardSeq		= current_view_seq;
		String				fileDeleteYN 	= request.getParameter("fileDeleteYN");
		String				fileChangeYN	= request.getParameter("fileChangeYN");

		log.info("fileDeleteYN is :: " + fileDeleteYN );
		log.info("fileChangeYN is :: " + fileChangeYN );
		
		/* insertMap.put( "writer" , user.getUsername() ); */
		insertMap.put( "type"		, "2");
		insertMap.put( "seq"		, boardSeq );
		insertMap.put( "division"	, dto.getDivision() 	);
		insertMap.put( "content"	, dto.getContent() 		);
		insertMap.put( "subject"	, dto.getSubject() 		);
		
		log.info("update dto :: " + dto );
		
		
		int updateCnt 	= mapper.updateQuestion( insertMap );
		int fileCnt 	= fileMapper.findFileInformationByUpdate( insertMap );
		
		if ( updateCnt == 0 ) {
			log.warn("update error occured!!!!!");
		}
		

		
		if( fileDeleteYN.equals("N") && fileChangeYN.equals("N") ) {
			log.info("not change file");
			response.sendRedirect("/qna/main");
			return;
		}
		
		
		// 여기서 부터 파일 업로드 관련
		log.info("file info :: " + uploadFile);
		
		
		String uploadFolder 		= "C:\\upload";
		String uploadFolderPath 	= getFolder();
		
		//make folder --
		
		File uploadPath = new File( uploadFolder, uploadFolderPath );
		log.info("upload Path : " + uploadPath);
		
		if( uploadPath.exists() == false ) {
			uploadPath.mkdirs();
		} // make yyyy/mm/dd folder
		
		int currSeq = boardSeq;		
		
		
		//기존에 올려둔 파일을 삭제하시겠습니까? >> db 삭제 파일 삭제
		if( fileDeleteYN.equals("Y") && fileChangeYN.equals("Y") ) {
			//update해야함
		}else if ( fileDeleteYN.equals("N") && fileChangeYN.equals("Y") ) {
			// file delete and db update 
		}
		
		
		
		for( MultipartFile multipartFile : uploadFile ) {
			
			if( multipartFile.isEmpty() ) { // 파일 변화가 있지 않고 deleteYN이 yes인 경우임
				
				fileMapper.fileDeleteInformation( insertMap );
				log.info("only file delete not change");
				response.sendRedirect("/qna/main");
				return;
				
			} else { // 파일의 변화가 있고 파일 유무의 따라 삭제를 해야함. 일단 update만
				
				FileInfoDTO originFileDTO = fileMapper.findFileInformation( insertMap );
				
				
				
				String uploadFileName = multipartFile.getOriginalFilename();
				String originFileName = uploadFileName;
				
				UUID uuid = UUID.randomUUID();
				
				uploadFileName = uuid.toString() + "_" + uploadFileName;
				
				try {
					//근데 이전 파일은 find해서 찾아줘야하는지도 생각할것. 일단 그부분은 생략
					File saveFile = new File( uploadPath, uploadFileName );
					multipartFile.transferTo( saveFile );

					
					
					insertMap.put("board_type"	, "2"); 
					insertMap.put("board_seq"	, currSeq);
					insertMap.put("file_locate"	, uploadPath.toString() );
					insertMap.put("file_uuid"	, uuid.toString() );
					insertMap.put("file_name"	, originFileName );
					insertMap.put("writer"		, user.getUsername() );
					
					
					if( fileCnt == 0 ) { //기존 게시글에 파일이 없엇고 새로 올리는 경우
						fileMapper.insertFileInformation(insertMap);
					} else {  // 실제 파일이 있음.. db 업데이트와 파일 삭제해야함
						String pastFileName = originFileDTO.getFile_locate() + "\\" + originFileDTO.getFile_uuid() + "\\" + originFileDTO.getFile_name();
						File pastFile = new File( pastFileName );						
						pastFile.delete();
						log.info("file Delete Complete!");
						fileMapper.updateFileInformation( insertMap ) ;
					}
					//윗부분 겹치는데 함수로 바꿔야 하나 싶기도하고 ...
					
					
				} catch ( Exception e ) {
					e.printStackTrace();
				}
				
				
			}
			
			
			
		}
		
		response.sendRedirect("/qna/main");
	}
	
	@RequestMapping( value="/view/{num}", method=RequestMethod.GET )
	public String viewContentPage( @PathVariable("num") int board_seq, Model model, HttpServletRequest request, HttpServletResponse response ) {
		
		QuestionBoardDTO 			dto 		= mapper.getQuestionBySeq( board_seq );
		String 						userId 		= dto.getWriter();
		MemberVO 					regiUser 	= commonMapper.getRegiUserInfor( userId );
		Map<String,Object>			findMap		= new HashMap<String,Object>();
		current_view_seq 						= board_seq; // 서버에서 값 저장하는거		
		ArrayList<QuestionBoardDTO> boardList 	= mapper.getQuestionBoardList();
		
		//사실 이 부분은 애초에 db에서 제대로하던지 뭔가 다른방법을 찾던지 해야할듯 하다.
		for( int i = 0; i <  boardList.size(); i++ ) {
			
			boardList.get(i).setDivision( myXcommuUtil.returnDivisionType( boardList.get(i).getDivision() ) );
			
		}
		

		findMap.put("type"	, "2");
		findMap.put("seq"	, board_seq);
		
		ArrayList<BoardReplyDTO>	replyList = commonMapper.getBoardReplyList(findMap);
		FileInfoDTO 				fileInfo  = fileMapper.findFileInformation(findMap);
		
		//division type check  && return kor
		dto.setDivision( myXcommuUtil.returnDivisionType( dto.getDivision() ) );		
		
		Cookie[] cookies = request.getCookies();
		boolean existCookie = false;
		Map<String,Object> updateMap = new HashMap<String,Object>();
		
		 // 쿠키가 있을 경우 >> 이부분만 따로 common할수도있을듯.. 믿에는 좀 그렇슴 
        if (cookies != null && cookies.length > 0) {
            for (int i = 0; i < cookies.length; i++) {
            	
                if ( cookies[i].getName().equals( "qna" + "-" + board_seq ) ){
                	existCookie = true;
                	break;
                }
            }
        }
        
      //들어온적이 없다면 update를 시켜줘야함  + 쿠키 생성
        if( existCookie == false ) {
        	
        	log.warn( "cookie create!!!! : " + board_seq );
        	Cookie addCookie = new Cookie( "qna" + "-" + board_seq  , Integer.toString( board_seq ) );
        	addCookie.setMaxAge( 60 );
        	
        	updateMap.put("boardType"	, myXcommuUtil.returnBoardType( "qna" ) );
        	updateMap.put("boardSeq"	, board_seq );
        	
			commonMapper.updateViewCnt( updateMap );
			
			log.warn("come here?");
        	
        	response.addCookie( addCookie );
        	
        	
        }
		
		
		model.addAttribute("board"			, dto ); 
		model.addAttribute("replyList"		, replyList );
		model.addAttribute("fileInfo"		, fileInfo );
		model.addAttribute("contentRegiDate", regiUser.getRegDate() );
		model.addAttribute("userConnectDate", regiUser.getUpdateDate() );
		model.addAttribute( "writerInfo"    , regiUser );	
		model.addAttribute( "list"			, boardList );
		
		return "qna/view";
	}
	
	@Transactional
	@RequestMapping( value="/registerQuestion", method=RequestMethod.POST )
	public void registerQuestion( HttpServletRequest request, QuestionBoardDTO dto, HttpServletResponse response, MultipartFile[] uploadFile ) throws IOException {
		
		Map<String,Object> 	insertMap 		= new HashMap<String,Object>();
		Authentication 		authentication 	= SecurityContextHolder.getContext().getAuthentication();
		CustomUser 			user 			= (CustomUser) authentication.getPrincipal();

		insertMap.put( "writer"		, user.getUsername() 	);
		insertMap.put( "division"	, dto.getDivision() 	);
		insertMap.put( "content"	, dto.getContent() 		);
		insertMap.put( "subject"	, dto.getSubject() 		);
		insertMap.put( "board_type" , "2" 					);
		
		log.info("file info :: " + uploadFile);
		
		
		String uploadFolder 		= "C:\\upload";
		String uploadFolderPath 	= getFolder();
		
		//make folder --
		
		File uploadPath = new File( uploadFolder, uploadFolderPath );
		log.info("upload Path : " + uploadPath);
		
		if( uploadPath.exists() == false ) {
			uploadPath.mkdirs();
		} // make yyyy/mm/dd folder
		
		mapper.registerQuestion( insertMap );
		
		int currSeq = mapper.currSequenceVal();		

		insertMap.put( "seq"	, currSeq );
		
		commonMapper.insertBoardDBLog( insertMap );
		
		for( MultipartFile multipartFile : uploadFile ) {
			
			if( multipartFile.isEmpty() ) {
				break;
			};
			
			String uploadFileName = multipartFile.getOriginalFilename();
			String originFileName = uploadFileName;
			
			log.info("==========================");
			log.info("Upload File Name : " + uploadFileName );
			log.info("Upload File Size : " + multipartFile.getSize() );
			
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			log.info("file name is :: " + uploadFileName);
			
			try {

				File saveFile = new File( uploadPath, uploadFileName );
				multipartFile.transferTo( saveFile );

				log.info("uploadPath :: " + uploadPath);
				log.info("uploadFileName :: " + uploadFileName);
				log.info("saveFile :: " + saveFile);
				
				insertMap.put("board_type"	, "2"); 
				insertMap.put("board_seq"	, currSeq);
				insertMap.put("file_locate"	, uploadPath.toString() );
				insertMap.put("file_uuid"	, uuid.toString() );
				insertMap.put("file_name"	, originFileName );
				
				fileMapper.insertFileInformation(insertMap);
				
				
			} catch ( Exception e ) {
				e.printStackTrace();
			}
			
		}
		
		
		
		
		
		response.sendRedirect("/qna/main");
		
	}
	
	
	/*
	 * @Transactional
	 * 
	 * @PreAuthorize("isAuthenticated()")
	 * 
	 * @RequestMapping( value="/view/completeQuestion", method=RequestMethod.POST )
	 * public ResponseEntity<String> completeQuestion( HttpServletRequest request ){
	 * 
	 * Authentication authentication =
	 * SecurityContextHolder.getContext().getAuthentication(); CustomUser
	 * currentUser = (CustomUser) authentication.getPrincipal(); String registerUser
	 * = request.getParameter("writer"); int boardSeq = current_view_seq;
	 * 
	 * if( !registerUser.equals( currentUser.getUsername() ) ) {
	 * log.warn(" authorize failed!!!! "); return new ResponseEntity<>("fail",
	 * HttpStatus.INTERNAL_SERVER_ERROR); }
	 * 
	 * int updateCount = mapper.updateQuestionStatus( boardSeq ); current_view_seq =
	 * -1;
	 * 
	 * log.warn(" authorize comeplete!!!! ");
	 * 
	 * 
	 * 
	 * return updateCount != 0 ? new ResponseEntity<>("success", HttpStatus.OK) :
	 * new ResponseEntity<>("fail", HttpStatus.INTERNAL_SERVER_ERROR); }
	 */
	
	
	
	
	
	@RequestMapping(method=RequestMethod.GET, value="/view/downloadFile", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE )
	@ResponseBody
	public ResponseEntity<Resource> downloadFile( @RequestHeader("User-Agent") String userAgent, String fileName ){
		
		Map<String,Object> 	findMap 	= new HashMap<String,Object>();
		int					boardSeq	= current_view_seq;
		String 				board_type 	= "2";
		
		findMap.put("type"		, board_type);
		findMap.put("seq"		, boardSeq);
		
		FileInfoDTO 	fileInfo  = fileMapper.findFileInformation(findMap);
		
		String saveFileName = fileInfo.getFile_locate() + "\\" + fileInfo.getFile_uuid() + "_" + fileName;
		
		log.info( "download File : " + fileName );
		log.info("download File Full Location :: " + saveFileName );
		
		Resource resource = new FileSystemResource( saveFileName );
		
		if( resource.exists() == false ) {
			log.info("not found file :: exists is " + resource.exists() );
			return new ResponseEntity<>( HttpStatus.NOT_FOUND );
		}
				
		String resourceName = resource.getFilename();
		
		////////////////////////근데 이부분은 언더바가 파일명에있으면 무조건 꼬이므로 다른방법을 강구해야함.
		
		String resourceOriginalName = resourceName.substring( resourceName.indexOf("_") + 1 );	
		HttpHeaders headers = new HttpHeaders();

		log.info("resourceName is :: " + resourceName );
		log.info("resourceOriginalName is :: " + resourceOriginalName );
		
		try {
				
			String downloadName = null;
			
			log.info(" userAgent : " + userAgent);
			
			if( userAgent.contains("Trident") ) {
				
				log.info("IE browser");
				
				downloadName = URLEncoder.encode( resourceOriginalName, "UTF-8".replaceAll("\\+", " ") );
				
			} else if( userAgent.contains("Edge") ) {
				log.info("Edge Browser");
				downloadName = URLEncoder.encode( resourceOriginalName, "UTF-8" );
			} else {
				
				
				log.info("Chrome Browser");
				downloadName = new String( resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1" );
			}
			
			headers.add("Content-Disposition", "attachment; filename=" + downloadName );
			
		} catch( UnsupportedEncodingException e ) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<Resource>( resource , headers, HttpStatus.OK );
		
	}
	
	
	private String getFolder(){
		
		SimpleDateFormat 	sdf 	= new SimpleDateFormat("yyyy-MM-dd");
		Date 				date 	= new Date();
		String				str 	= sdf.format( date );
	
		return str.replace( "-", File.separator );
	}

}
