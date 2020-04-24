package org.zerock.mapper;

import java.util.ArrayList;
import java.util.Map;

import org.zerock.domain.MemberStatsDTO;
import org.zerock.domain.MemberVO;
import org.zerock.domain.StatisticsDTO;
import org.zerock.domain.UserLogDTO;

public interface AccountMapper {
	public int registerAccount( MemberVO vo );
	public void registerAuth( String userId );
	public MemberVO getAccountInformation( String userId );
	public MemberVO getAccountInformationByEmail( String email );
	public void updateProfile( MemberVO vo );
	public int updateEmailValid ( Map<String,Object> map );
	public int checkValidEmail( String userId );
	public ArrayList<UserLogDTO> getRecentlyUserLog( String userId );
	public StatisticsDTO getBoardUserReplyCnt();
	public ArrayList<MemberStatsDTO> getAllMemberStats();
	public MemberStatsDTO getWriteBoardReplyCount( String userId );
	public MemberVO findUserIdEmail( String email );
	public MemberVO findPWAccount( Map<String,Object> map );
	public void findPwTemp( Map<String,Object> map );
	public String checkPwAccount( String userId );
}
 