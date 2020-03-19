package org.zerock.mapper;

import java.util.ArrayList;
import java.util.Map;

import org.zerock.domain.BoardReplyDTO;
import org.zerock.domain.MemberVO;

public interface CommonMapper {
	
	public MemberVO getRegiUserInfor( String userId );
	public int selectRecommandQuestionUserRecord( Map<String,Object> map );
	public void recommandBoard( Map<String,Object> map );
	public void deleteBoard( Map<String,Object> map );
	public void deleteBoardAllReply( Map<String,Object> map );
	public void deleteBoardReplyRecord( Map<String,Object> map );
	public void registerReply( Map<String,Object> map ); 
	public ArrayList<BoardReplyDTO> 	getBoardReplyList( Map<String,Object> map );
	public int								countEmpathyRecordToUser( Map<String,Object> map );
	public void empathyReply ( Map<String,Object> map ); 
	public void deleteReply( int seq );
	public void deleteReplyEmpthy( int seq );
	public void updateViewCnt( Map<String,Object> map );
}
