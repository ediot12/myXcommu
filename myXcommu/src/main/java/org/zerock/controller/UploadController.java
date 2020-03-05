package org.zerock.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.Resource;

import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.AttachFileDTO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
@RequestMapping("/board")
public class UploadController {
	
	@RequestMapping(method=RequestMethod.GET, value="/uploadForm")
	public void uplaodForm( ) {
		
		log.info("Enter Page");
		
	}
	
	
	@RequestMapping(method=RequestMethod.POST, value="uploadFormAction", headers = ("content-type=multipart/*"))
	public void uplaodFormPost( MultipartFile[] uploadFile, Model model  ) {
	
		String uploadFolder = "C://upload";
		
		for( MultipartFile multipartFile : uploadFile ) {
			
			log.info("==========================");
			log.info("Upload File Name : " + multipartFile.getOriginalFilename() );
			log.info("Upload File Size : " + multipartFile.getSize() );
			
			File saveFile = new File( uploadFolder, multipartFile.getOriginalFilename() );
			
			try {
				 
				multipartFile.transferTo( saveFile );
				
			} catch ( Exception e ) {
				e.printStackTrace();
			}
			
			
		}
		
	}
	
	
	@RequestMapping( method=RequestMethod.GET, value="uploadAjax" )
	public void uploadAjax() {
		
		log.info( "upload Ajax method" );
	}
	
	
	
	@PreAuthorize("isAuthenticated()")
	@ResponseBody
	@RequestMapping( method=RequestMethod.POST, value="uploadAjaxAction", produces=MediaType.APPLICATION_JSON_UTF8_VALUE )
	 public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost( MultipartFile[] uploadFile ) {
		 
		log.info("update ajax post ..........");
		
		List<AttachFileDTO> list 	= new ArrayList<>();
		String uploadFolder 		= "C:\\upload";
		String uploadFolderPath 	= getFolder();
		
		//make folder --
		
		File uploadPath = new File( uploadFolder, uploadFolderPath );
		log.info("upload Path : " + uploadPath);
		
		if( uploadPath.exists() == false ) {
			uploadPath.mkdirs();
		} // make yyyy/mm/dd folder
		
		
		//사실 이부분도 부하에 안걸릴라면 for문으로 하되 뭔가 서버 부하에를 덜 주는 방향으로 생각해보아야함.
		
		
		for( MultipartFile multipartFile : uploadFile ) {
			
			
			AttachFileDTO attachDTO = new AttachFileDTO();
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			log.info("==========================");
			log.info("Upload File Name : " + uploadFileName );
			log.info("Upload File Size : " + multipartFile.getSize() );
			
			/*
			 * uploadFileName = uploadFileName.substring( uploadFileName.lastIndexOf("\\"),
			 * + 1 );
			 * 
			 * log.info("only File name : " + uploadFileName );
			 */
			
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			attachDTO.setFileName( uploadFileName );
			
			
			try {

				File saveFile = new File( uploadPath, uploadFileName );
				multipartFile.transferTo( saveFile );
				
				attachDTO.setUuid( uuid.toString() );
				attachDTO.setUploadPath( uploadFolderPath );
				
				if( checkImageType ( saveFile ) ) {
					attachDTO.setImage( true );
					FileOutputStream thumbnail = new FileOutputStream( new File( uploadPath, "s_" + uploadFileName ) );
					Thumbnailator.createThumbnail( multipartFile.getInputStream(), thumbnail, 100, 100 );
					thumbnail.close();
				}


				log.info( "Final UUID : " + uuid );
				log.info( "Final FileName : " + uploadFileName );
				list.add( attachDTO );
				
				
			} catch ( Exception e ) {
				e.printStackTrace();
			}
			
			
			
		}
		
		return new ResponseEntity<>(list, HttpStatus.OK);
		
		 
	 }
	
	
	private String getFolder(){
		
		SimpleDateFormat 	sdf 	= new SimpleDateFormat("yyyy-MM-dd");
		Date 				date 	= new Date();
		String				str 	= sdf.format( date );
	
		return str.replace( "-", File.separator );
	}
	
	private boolean checkImageType( File file ) {
		
		try {
			
			String contentType = Files.probeContentType( file.toPath() );
		
			return contentType.startsWith("image");
			
		} catch( IOException e ) {
			e.printStackTrace();
		}
		
		return false;
		
	}
	
	
	@RequestMapping(method=RequestMethod.GET, value="/display")
	public ResponseEntity<byte[]> getFile( String fileName ){
		
		log.info("fileName : " + fileName);
		
		File file = new File( "c:\\upload\\" + fileName );
		
		log.info( "file exists !! "  + file.exists() );
		
		log.info("file : " + file);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-type", Files.probeContentType( file.toPath() ) );
			
			result = new ResponseEntity<>( FileCopyUtils.copyToByteArray( file ) , header, HttpStatus.OK ); 
			
		} catch( IOException e ) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	
	//Mime 타입을 다운로드를 할 수 있는 application/octet-stream으로 지정하고 다운로드시 저장되는 이름은 content-disposition을 이용해서 지정
	//파일명이 한글인 경우 깨지는걸 방지하기 위해서이다.
	//근데 ie는 시발 한글이 쳐깨져서 애초에 지금 들어온 새끼가 ie인지 아닌지 식별한번 해줘야함. 
	@RequestMapping(method=RequestMethod.GET, value="downloadFile", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE )
	@ResponseBody
	public ResponseEntity<Resource> downloadFile( @RequestHeader("User-Agent") String userAgent, String fileName ){
		
		log.info( "download File : " + fileName );
		
		Resource resource = new FileSystemResource( "c:\\upload\\" + fileName );
		
		if( resource.exists() == false ) {
			return new ResponseEntity<>( HttpStatus.NOT_FOUND );
		}
		
		int fileIndexStart = 0;
		boolean imageType = true;		
		String resourceName = resource.getFilename();
		
		
		//image type check!!!! 
		try {
			imageType = checkImageType ( resource.getFile() );
			log.info( "image type is true? : "  + imageType );
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		if( imageType == true ) {
			fileIndexStart = resourceName.indexOf("s_") + 2;
		} else {
			fileIndexStart = resourceName.indexOf("_") + 1;
		}
		

		////////////////////////근데 이부분은 언더바가 파일명에있으면 무조건 꼬이므로 다른방법을 강구해야함.
		
		String resourceOriginalName = resourceName.substring( resourceName.indexOf("_") + 1 );	
		HttpHeaders headers = new HttpHeaders();
		
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
	
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping( method=RequestMethod.POST, value="/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile( String fileName, String type ){
		
		log.info("deleteFile : " + fileName);
		File file;
		
		try {
			
			file = new File("c:\\upload\\" + URLDecoder.decode( fileName,"UTF-8") );
			
			file.delete();
			
			if( type.equals("image") ) {
				
				String largeFileName = file.getAbsolutePath().replace("s_", "");
				
				log.info("large File Name : " + largeFileName );
				
				file = new File( largeFileName );
				
				file.delete();
						
				
			}
			
		} catch ( UnsupportedEncodingException e ) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK );
		
	}

}
