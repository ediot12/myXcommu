package org.zerock.service;

import java.util.Map;

public interface AccountService {
	
	public int registerAccount( String userId, String userPw, String email, String profile_image, String profile_info, String emailCode );
	/* public void updateEmailValid( Map<String,Object> map ); */

}
