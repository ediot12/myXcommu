package org.zerock.mapper;

import org.zerock.domain.MemberVO;

public interface MemberMapper {
	
	public MemberVO read( String userid );
	public void updateLoginDate( String userId );
	public void updateLoginCount( String userId );
	public String recentlyLoginRecord( String userId );

}
