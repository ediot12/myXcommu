package org.zerock.security;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.AccountMapper;
import org.zerock.mapper.MemberMapper;

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{
	

	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private AccountMapper accountMapper;
	

	private static final Logger logger = LoggerFactory.getLogger(CustomLoginSuccessHandler.class);
	
	@Override
	public void onAuthenticationSuccess( HttpServletRequest request, HttpServletResponse response, Authentication auth) throws IOException, ServletException {
		
		logger.warn("Login Success!");
		
		List<String> roleNames = new ArrayList<>();
		
		HttpSession session = request.getSession( true );
		Date date = new Date();
		SimpleDateFormat smf = new SimpleDateFormat("yyyy-MM-dd");
		
		
		
		///Login date update /////////////////////////////////////
		
		logger.warn("login first in! : " +  auth.getPrincipal() );
		String userId = auth.getName();
		String recentLoginDate = mapper.recentlyLoginRecord( userId );
		
		mapper.updateLoginDate( userId );
		mapper.updateLoginCount( userId );
		
		auth.getAuthorities().forEach( authority -> {
			
			roleNames.add( authority.getAuthority() );
			
		});
		
		logger.warn("  Role Names : " + roleNames );
		
		
		
		MemberVO member = accountMapper.getAccountInformation( userId );
		
		if( member.getEmail_check_valid().equals("1") ) {
			response.sendRedirect("/accessError");
			session.invalidate();
			return;
		}
		
		session.setAttribute("currentUserId", auth.getName());
		session.setAttribute("image64", member.getProfile_image() );
		session.setAttribute("loginTime", smf.format(date));
		session.setAttribute("recentlyLoginDate", recentLoginDate ); 
		
		if( roleNames.contains("ROLE_ADMIN") ) {
			response.sendRedirect("/board/list_");
			return;
		}
		
		if( roleNames.contains("ROLE_MEMBER") ) {
			response.sendRedirect("/board/list_");
			return;
		}
		
		
		response.sendRedirect("/");
		
	}

}
