package org.zerock.mapper;

import java.util.ArrayList;
import java.util.Map;

import org.zerock.domain.BoardReplyDTO;
import org.zerock.domain.MemberVO;
import org.zerock.domain.QuestionBoardDTO;

public interface QnABoardMapper {
	
	public void 							registerQuestion( Map<String, Object> map );
	public ArrayList<QuestionBoardDTO> 		getQuestionBoardList();
	public QuestionBoardDTO 				getQuestionBySeq( int seq );
	public MemberVO 						getRegiUserInfor( String userId );

	/* public void registerReply( Map<String,Object> map ); */
	/*
	 * public ArrayList<BoardReplyDTO> getQuestionReplyList( Map<String,Object> map
	 * );
	 */
	public int 								updateQuestionStatus( int seq );

	/* public void deleteQuestion( int seq ); */
	/* public void deleteQuestionAllReply( Map<String,Object> map ); */
	public int 								selectRecommandQuestionUserRecord( Map<String,Object> map );

	/* public void deleteQuestionReplyRecord( Map<String,Object> map ); */
	/* public void empathyReply ( Map<String,Object> map ); */

	/* public int countEmpathyRecordToUser( Map<String,Object> map ); */
	public int								currSequenceVal();
	public int 								updateQuestion( Map<String,Object> map );
 
}
