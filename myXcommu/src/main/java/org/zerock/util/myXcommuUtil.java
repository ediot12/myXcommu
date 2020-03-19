package org.zerock.util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.zerock.mapper.CommonMapper;

import lombok.extern.log4j.Log4j;

@Log4j
public class myXcommuUtil {
	
	@Autowired
	private static CommonMapper commonMapper;
	
	public static String returnDivisionType( String division ) {
		
		// 근데 왜 length가 길어지는지 모르겠지만 일단 trim으로 대체함
		division = division.replaceAll(" ", "");
	
		if( division.equals("q1") ){
			division =  "질문유형1";
		} else if ( division.equals("q2") ) {
			division = "질문유형2";
		} else {
			division = "error";
		}
		
		return division;
		
	}
	
	public static HttpServletResponse checkCookieUpdateView( 
															HttpServletRequest request, 
															HttpServletResponse response, 
															String boardType, 
															int boardSeq ) {
		
		
		Cookie[] cookies = request.getCookies();
		boolean existCookie = false;
		Map<String,Object> updateMap = new HashMap<String,Object>();
 
        // 쿠키가 있을 경우 
        if (cookies != null && cookies.length > 0) {
            for (int i = 0; i < cookies.length; i++) {
            	
                if ( cookies[i].getName().equals( boardType + "-" + boardSeq ) ){
                	existCookie = true;
                	break;
                }
            }
        }
        
        
        //들어온적이 없다면 update를 시켜줘야함  + 쿠키 생성
        if( existCookie == false ) {
        	
        	log.warn( "cookie create!!!! : " + boardSeq );
        	Cookie addCookie = new Cookie( boardType + "-" + boardSeq  , Integer.toString( boardSeq ) );
        	addCookie.setMaxAge( 60 );
        	
        	updateMap.put("boardType"	, returnBoardType( boardType ) );
        	updateMap.put("boardSeq"	, boardSeq );
        	
        	commonMapper.updateViewCnt( updateMap ); 
        	
        	response.addCookie( addCookie );
        	
        	
        }
		
		return response;
	}
	
	public static String returnBoardType( String korBoardType ) {
		
		if( korBoardType.equals("proposal") ) {
			return "4";
		} else if ( korBoardType.equals("picture") ) {
			return "3";
		} else if( korBoardType.equals("qna") ) {
			return "2";
		} else if( korBoardType.equals("notice") ) {
			return "5";
		}
		
		else {
			return "1";
		}
		
	}

}
