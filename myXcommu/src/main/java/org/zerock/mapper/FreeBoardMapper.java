package org.zerock.mapper;

import java.util.ArrayList;
import java.util.Map;

import org.zerock.domain.FreeBoardDTO;

public interface FreeBoardMapper {
	
	public ArrayList<FreeBoardDTO> getAllFreeBoardList();
	public FreeBoardDTO getFreeBoard( int seq );
	public void insertFreeBoard( FreeBoardDTO dto );
	public int updateFreeBoard( Map<String,Object> map );
	public int currSequenceVal();
	

}
