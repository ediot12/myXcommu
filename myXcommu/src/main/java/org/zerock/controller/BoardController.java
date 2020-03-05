package org.zerock.controller;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.domain.QuestionBoardDTO;
import org.zerock.mapper.QnABoardMapper;
import org.zerock.service.BoardService;
import org.zerock.util.myXcommuUtil;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@AllArgsConstructor
@Log4j
public class BoardController {
	
	private BoardService service;
	

	@Autowired
	private QnABoardMapper qnaMapper;
	
	@RequestMapping( value ="/list", method=RequestMethod.GET )
	public void list( Criteria cri, Model model ) {
		
		System.out.println("list");
		System.out.println( service.getList( cri ).toString() );
		model.addAttribute("list", service.getList( cri ) );
		model.addAttribute("pageMaker", new PageDTO( cri, 123 ) ); 
		
		int total = service.getTotal( cri );
		model.addAttribute("pageMaker", new PageDTO( cri, total ) );
		
	}
	
	@RequestMapping( value ="/list_", method=RequestMethod.GET )
	public void listTest( Criteria cri, Model model ) {
		
		ArrayList<QuestionBoardDTO> questionList = qnaMapper.getQuestionBoardList();
		
		//사실 이 부분은 애초에 db에서 제대로하던지 뭔가 다른방법을 찾던지 해야할듯 하다.
		
		for (int i = 0; i < questionList.size(); i++) {

			questionList.get(i).setDivision( myXcommuUtil.returnDivisionType ( questionList.get(i).getDivision() ) );

		}
		 
		
		model.addAttribute( "questionList", questionList );
		
		model.addAttribute("list", service.getList( cri ) );		
	}
	
	@PostMapping("/register")
	@PreAuthorize("isAuthenticated()") //어떠한 사용자건 로그인이 성공한 사용자만이 해당 기능을 사용할 수 있도록 처리
	public String register( BoardVO board, RedirectAttributes rttr ) {
		
		log.info("========================");
		log.info("register : " + board );
		
		if( board.getAttachList() != null ) {
			board.getAttachList().forEach( attach -> log.info( attach ) );
		}
		
		log.info("========================");
	
		
		service.register( board ); 
		rttr.addFlashAttribute("result", board.getBno() );
		 
		return "redirect:/board/list";
		
	}
	
	/* @GetMapping({"/get", "/modify"}) */
	@RequestMapping({"/get", "/modify"})
	public void get( @RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri ,Model model ) {
		
		System.out.println("/get or modify");
		model.addAttribute("board", service.get( bno ) );
	}
	
	
	 @PostMapping("/modify") 
	 @PreAuthorize("principal.username == #board.writer")
	 public String modify( BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr ) {
	  	 
		 System.out.println("/modify : " + board.toString() );	  
	 
		 if( service.modify ( board ) ) { 
			 
			 rttr.addFlashAttribute("result", "success");
	 
		 }
		 
		 rttr.addAttribute( "pageNum"	, cri.getPageNum() );
		 rttr.addAttribute( "amount"	, cri.getAmount() );
		 rttr.addAttribute( "type"		, cri.getType() );
		 rttr.addAttribute( "keyword"	, cri.getKeyword() );
		 
		 return "redirect:/board/list" + cri.getListLink(); 
	  
	}
	 
	
	@PostMapping("/remove")
	@PreAuthorize("principal.username == #writer")
	public String remove( 	@RequestParam("bno") Long bno, 
							@ModelAttribute("cri") Criteria cri,
							String writer,
							RedirectAttributes rttr  ) {
		
		log.info("remove : " + bno );
		
		List<BoardAttachVO> attachList = service.getAttachList( bno );
		
		if( service.remove( bno ) ) {
			
			deleteFiles( attachList );
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute( "pageNum"	, cri.getPageNum() 	);
		rttr.addAttribute( "amount"		, cri.getAmount() 	);
		rttr.addAttribute( "type"		, cri.getType() 	);
		rttr.addAttribute( "keyword"	, cri.getKeyword() 	);
		
		return "redirect:/board/list" + cri.getListLink();	
		
	}
	
	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public void register() {
		
		
	}
	
	
	@ResponseBody
	@RequestMapping( value="/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE )
	public ResponseEntity<List<BoardAttachVO>> getAttachList( Long bno ){
		
		log.info("get AttachList " + bno );
		
		return new ResponseEntity<>( service.getAttachList( bno ), HttpStatus.OK );
		
	}
	
	
	private void deleteFiles( List<BoardAttachVO> attachList ) {

		if( attachList == null || attachList.size() == 0 ) {
			
			return;
		}
		
		log.info("delete attach files.....................");
		log.info( attachList );
		
		attachList.forEach( attach -> {
			
			try {
				
				Path file = Paths.get("C:\\upload\\" + attach.getUploadPath() + "\\" + attach.getUuid() + "_" + attach.getFileName() );
				Files.deleteIfExists( file );
				
				if( Files.probeContentType( file ).startsWith("image")) {
					
					Path thumbNail = Paths.get("C:\\upload\\" + attach.getUploadPath() + "\\s_" + attach.getUuid() + "_" + attach.getFileName() );
					Files.delete( thumbNail );
				}
				
			} catch( Exception e ) {
				log.error("delete file error : " + e.getMessage() );
			}
			
		});
		
	}

}
