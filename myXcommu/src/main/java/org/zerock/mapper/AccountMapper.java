package org.zerock.mapper;

import org.zerock.domain.MemberVO;

public interface AccountMapper {
	public int registerAccount( MemberVO vo );
	public void registerAuth( String userId );
	public MemberVO getAccountInformation( String userId );
	public void updateProfile( MemberVO vo );
}
