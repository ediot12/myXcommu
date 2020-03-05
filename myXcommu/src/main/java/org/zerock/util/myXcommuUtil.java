package org.zerock.util;

public class myXcommuUtil {
	
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

}
