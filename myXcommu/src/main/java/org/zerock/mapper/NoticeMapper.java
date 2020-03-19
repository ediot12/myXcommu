package org.zerock.mapper;

import java.util.ArrayList;
import java.util.Map;

import org.zerock.domain.NoticeDTO;

public interface NoticeMapper {
	
	public void registerNotice ( NoticeDTO dto );
	public ArrayList<NoticeDTO> getAllNoticeList();
	public NoticeDTO getNoticeBySeq( int seq );
	public int updateNotice( Map<String,Object> map );

}
