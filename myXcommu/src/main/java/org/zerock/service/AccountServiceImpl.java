package org.zerock.service;

import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.AccountMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AccountServiceImpl implements AccountService{
	/*
	 * @Setter( onMethod_ = @Autowired ) private JavaMailSender mailSender;
	 */
	
	@Setter( onMethod_ = @Autowired )
	private PasswordEncoder pwencoder;
	
	@Setter( onMethod_ = @Autowired )
	private AccountMapper mapper;
	
	
	
	@Override
	@Transactional
	public int registerAccount( String userId, String userPw, String email, String profile_image, String profile_info, String emailCode ) {
		
		
		  String origin_pw = userPw; 
		  String origin_pw_new = pwencoder.encode( origin_pw );
		  
		  log.warn( "origin password : " + origin_pw ); 
		  log.warn( "encode password : " + origin_pw_new );
		  
		  MemberVO vo = new MemberVO();
		  
		  vo.setUserid(userId); 
		  vo.setUserpw( origin_pw_new ); 
		  vo.setEmail(email);
		  vo.setProfile_image(profile_image);
		  vo.setProfile_info(profile_info);
		  vo.setEmail_code( emailCode );
		  
		  int account = mapper.registerAccount( vo );
		  mapper.registerAuth( userId );
		/* sendMail( email ); */
		  log.warn("insert count : " + account );
		  
		  return account;
		 
		
	}
	
	
	
	

}
