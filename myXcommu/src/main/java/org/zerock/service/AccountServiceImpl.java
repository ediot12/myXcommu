package org.zerock.service;

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
	public int registerAccount( String userId, String userPw, String email, String profile_image, String profile_info ) {
		
		
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
		  
		  int account = mapper.registerAccount( vo );
		  mapper.registerAuth( userId );
		/* sendMail( email ); */
		  log.warn("insert count : " + account );
		  
		  return account;
		 
		
	}
	
	/*
	 * private void sendMail( String email ) {
	 * 
	 * 
	 * Random r = new Random(); int dice = r.nextInt(4589362) + 49311; //이메일로 받는
	 * 인증코드 부분 (난수)
	 * 
	 * String setfrom = "admin@myXcommu.com"; String tomail = email; // 받는 사람 이메일
	 * String title = "회원가입 인증 이메일 입니다."; // 제목 String content = "This is content!"
	 * + Integer.toString( dice );
	 * 
	 * 
	 * 
	 * try { MimeMessage message = mailSender.createMimeMessage(); MimeMessageHelper
	 * messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	 * 
	 * messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
	 * messageHelper.setTo(tomail); // 받는사람 이메일 messageHelper.setSubject(title); //
	 * 메일제목은 생략이 가능하다 messageHelper.setText(content); // 메일 내용
	 * 
	 * mailSender.send(message); } catch (Exception e) { System.out.println(e); }
	 * 
	 * }
	 */
	
	

}
