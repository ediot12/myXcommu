package org.zerock.service;

import org.zerock.domain.MemberVO;

public interface AccountService {
	
	public int registerAccount( String userId, String userPw, String email );

}
