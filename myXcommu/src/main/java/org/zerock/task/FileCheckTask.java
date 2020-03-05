package org.zerock.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.zerock.domain.BoardAttachVO;
import org.zerock.mapper.BoardAttachMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class FileCheckTask {
	
	@Setter( onMethod_ = {@Autowired} )
	private BoardAttachMapper attachMapper;
	
	private String getFolderYesterday() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		
		cal.add( Calendar.DATE, -1 );
		
		String str = sdf.format( cal.getTime() );
		
		return str.replace("-", File.separator );
		
	}

	
	/*
	 * 먼저 attachMapper를 이용하여 어제 날짜로 보과되는 모든 첨부파일의 목록을 가져온다. db에서 가져온 파일 목록은
	 * BoardAttachVO 타입의 객체이므로 나중에 비교를 위해서 java.nio.Paths의 목록으로 변환한다. 이때 이미지 파일의
	 * 경우에는 섬네일 파일도 목록에 필요하기 때문에 별도로 처리해서 해당 일의 예상 파일 목록을 완성한다. 코드에서는 fileListPaths
	 * 라는 이름의 변수로 처리한다. db에 있는 파일들의 준비가 끝나면 실제 폴더에 있는 파일들의 목록에서 db에는 없는 파일들을 찾아서
	 * 목록으로 준비한다. 이 결과는 removeFiles 변수에 담아서 처리한다. 최종ㅈ적으로는 삭제 대상이 되는 파일들을 삭제한다.
	 */
	

	/* @Scheduled( cron = "0 * * * * *" ) */
	@Scheduled( cron = "0 0 12 * * *" )
	public void checkFiles() throws Exception {
		
		log.warn("Fiile Check Task run.................");
		log.warn( new Date() );

		//file list in db
		List<BoardAttachVO> fileList = attachMapper.getOldFiles();
		
		// ready for check file in directory with db file list
		List<Path> fileListPaths = fileList.stream().map( vo -> Paths.get("C:\\upload", vo.getUploadPath(), vo.getUuid() + "_" +vo.getFileName())).collect( Collectors.toList() );
		
		//image file has thumbnail file
		fileList.stream().filter( vo->vo.isFileType() == true).map( vo-> Paths.get("C:\\upload", vo.getUploadPath(), "s_" + vo.getUuid() + "_" + vo.getFileName() )).forEach( p -> fileListPaths.add( p ));
				
		log.warn("===================================================================");
		
		fileListPaths.forEach( p -> log.warn( p ) );
		
		// files in yesterday directory
		
		File targetDir = Paths.get("C:\\upload", getFolderYesterday()).toFile();
		
		
		if( targetDir.length() != 0 ) {
			
			File[] removeFiles = targetDir.listFiles( file -> fileListPaths.contains( file.toPath()) == false );
			
			log.warn("============================================remove Files");
			
			for( File file : removeFiles ) {
				
				log.warn( file.getAbsolutePath() );
				file.delete();
			}
			
		}
		
		
		
		
		
		
	}
	
}
