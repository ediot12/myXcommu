package org.zerock.mapper;

import java.util.ArrayList;
import java.util.Map;

import org.zerock.domain.PictureBoardDTO;

public interface PictureBoardMapper {

	public ArrayList<PictureBoardDTO> getPictureBoardList();
	public ArrayList<PictureBoardDTO> getPictureBoardListLimit();
	public void registerPictureBoard( PictureBoardDTO dto );
	public PictureBoardDTO getPictureBoard( int seq );
	public PictureBoardDTO getPictureBoardBySeq( int seq );
	public int updatePictureBoard( Map<String,Object> map );
	public int currSequenceVal();
	
}
