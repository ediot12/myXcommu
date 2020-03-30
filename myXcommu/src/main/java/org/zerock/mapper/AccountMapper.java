package org.zerock.mapper;

import java.util.Map;

import org.zerock.domain.MemberVO;

public interface AccountMapper {
	public int registerAccount( MemberVO vo );
	public void registerAuth( String userId );
	public MemberVO getAccountInformation( String userId );
	public MemberVO getAccountInformationByEmail( String email );
	public void updateProfile( MemberVO vo );
	public int updateEmailValid ( Map<String,Object> map );
	public int checkValidEmail( String userId );
}
 