package org.zerock.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.AccountMapper;
import org.zerock.service.AccountService;
import org.zerock.service.MailService;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
public class AccountController implements MailService {

	@Autowired
	private AccountService service;

	@Autowired
	private JavaMailSender javaMailSender;
	
	@Autowired
	private AccountMapper mapper;
	
	public void setJavaMailSender(JavaMailSender javaMailSender) {
		this.javaMailSender = javaMailSender;
	}

	@PreAuthorize("permitAll()")
	@RequestMapping(method = RequestMethod.POST, value = "/insertAccount")
	public void accountRegister(MemberVO vo, HttpServletResponse response) throws IOException {

		log.info("first : :::: " + vo);

		String userId = vo.getUserid();
		String userPw = vo.getUserpw();
		String userEmail = vo.getEmail();
		String profile_info = vo.getProfile_info();
		String profile_image = vo.getProfile_image();
		String uuid = UUID.randomUUID().toString();

		log.info("1: " + userId );
		log.info("2: " + userPw );
		log.info("3: " + userEmail );
		log.info("4: " + profile_info );
		log.info("5: " + profile_image );
		log.info("6: " + uuid );

		
	  int count = service.registerAccount(userId, userPw, userEmail, profile_image,  profile_info, uuid );
	  
	  log.info("vo!!!! : " + vo); 
	  log.info("into db !!! :: " + count);
		 
		
		send( userId, uuid.toString(), userEmail );

		response.sendRedirect("/");

	}

	@PreAuthorize("permitAll()")
	@RequestMapping(value = "/profileUploadCheck", method = RequestMethod.POST)
	public ResponseEntity<String> checkProfileImage(MultipartFile[] file) {

		log.info("check Profile Image :: " + file);
		log.info("check Profile Image[0] :: " + file[0]);

		return new ResponseEntity<>("success", HttpStatus.OK);
	}

	@Override
	public boolean send( String userId, String uuid, String targetEmail ) {
		// javax.mail.internet.MimeMessage
		MimeMessage message = javaMailSender.createMimeMessage();
		String emailText = "<table style=\"background: #f3f3f3; width: 100%; height: 100%;\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\r\n" + 
				"		<tbody>\r\n" + 
				"			<tr>\r\n" + 
				"				<td style=\"padding: 50px;\">\r\n" + 
				"					<table style=\"width: 550px; height: 100%; margin: 0 auto\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\r\n" + 
				"						<tbody>\r\n" + 
				"							<tr>\r\n" + 
				"								<td style=\"padding-top: 20px;\">\r\n" + 
				"									<img style=\"float: left; width : 200px; height : 80px;\" src=\"http://localhost:8080/resources/assets/images/myXcommu-logo.png\" alt=\"Logo\">									\r\n" + 
				"								</td>\r\n" + 
				"							</tr>\r\n" + 
				"							<tr>\r\n" + 
				"								<td style=\"border-radius: 10px; background: #fff; padding: 30px 60px 20px 60px; margin-top: 10px; display: block;\">\r\n" + 
				"									<p style=\"font-family: Roboto; font-size: 18px; font-weight: 500; font-style: normal; font-stretch: normal; line-height: 1.11; letter-spacing: normal; color: #2b80ff;\">Confirm Your E-Mail Address</p>\r\n" + 
				"									<p style=\"font-family: Roboto; font-size: 14px; font-weight: 500; font-style: normal; font-stretch: normal; line-height: 1.71; letter-spacing: normal; color: #001737; margin-bottom: 10px;\">Hi Cole Mendoza,</p>\r\n" + 
				"									<p style=\"font-family: Roboto; font-size: 14px; font-weight: normal; font-style: normal; font-stretch: normal; line-height: 1.71; letter-spacing: normal; color: #001737;\">Your account is now verified and you can purchase tokens for the staradmin. Also you can submit your documents for the KYC from my Account page.</p>\r\n" + 
				"									<a heref=\"#\" style=\"height: 34px; background-color: #2b80ff; border: none; color: #fff; padding: 8px 20px; border-radius: 4px; display: inline-block; margin-left: 10px; margin-bottom: 20px;\">VERIFY EMAIL</a>\r\n" + 
				"									<p style=\"font-family: Roboto; font-size: 14px; font-weight: normal; font-style: normal; font-stretch: normal; line-height: 1.71; letter-spacing: normal; color: #001737;\">\r\n" + 
				"										<b style=\"font-size: 20px; margin-right: 10px;\">OR</b>Follow this link to verify your email address.\r\n" + 
				"									</p>\r\n" + 
				"									<a href=\"http://localhost:8080/userJoinValidation?userId=\" + userId + \"&validCode=\" + uuid + \"\" style=\"display: block; font-family: Roboto; font-size: 14px; font-weight: 500; font-style: normal; font-stretch: normal; line-height: 1.71; letter-spacing: normal; color: #2b80ff; margin-bottom: 15px;\">http://localhost:8080/userJoinValidation?userId=" + userId + "&validCode=" + uuid + "</a>\r\n" + 
				"									<p style=\"font-family: Roboto; font-size: 14px; font-weight: normal; font-style: normal; font-stretch: normal; line-height: 1.71; letter-spacing: normal; color: #001737; margin-bottom: 0px;\">Good luck! Hope it works.</p>\r\n" + 
				"									<p style=\"font-family: Roboto; font-size: 14px; font-weight: 500; font-style: normal; font-stretch: normal; line-height: 2.5; letter-spacing: normal; color: #001737; margin-bottom: 0px;\">Staradmin team</p>\r\n" + 
				"								</td>\r\n" + 
				"							</tr>\r\n" + 
				"						</tbody>\r\n" + 
				"					</table>\r\n" + 
				"\r\n" + 
				"					<table style=\"margin: 20px auto 10px auto;\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\r\n" + 
				"						<tbody>\r\n" + 
				"							<tr>\r\n" + 
				"								<td style=\"font-family: Roboto; font-size: 14px; font-weight: normal; font-style: normal; font-stretch: normal; line-height: normal; letter-spacing: normal; color: #001737;\">Copyright © 2019 Bootstrapdash. All rights reserved.</td>\r\n" + 
				"							</tr>\r\n" + 
				"							<tr>\r\n" + 
				"								<td style=\"font-family: Roboto; font-size: 14px; font-weight: normal; font-style: normal; font-stretch: normal; line-height: normal; letter-spacing: normal; color: #bbb; text-align: center; padding-top: 15px;\">\r\n" + 
				"									Don't like these emails? <a style=\"color: inherit;\" href=\"#\">Unsubscribe</a>\r\n" + 
				"								</td>\r\n" + 
				"							</tr>\r\n" + 
				"						</tbody>\r\n" + 
				"					</table>\r\n" + 
				"				</td>\r\n" + 
				"			</tr>\r\n" + 
				"		</tbody>\r\n" + 
				"	</table>";
		try {
			// org.springframework.mail.javamail.MimeMessageHelper
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setSubject("안녕하세요? myXcommu 가입 인증 이메일입니다. 야발련아");
			helper.setText( emailText , true);
			helper.setFrom("starkcb123@gmail.com");
			helper.setTo("starkcb123@naver.com");
			javaMailSender.send(message);
			return true;
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	@RequestMapping( value="/userJoinValidation", method=RequestMethod.GET )
	public void emailValidation( HttpServletRequest request, HttpServletResponse response ) throws Exception {
		
		String 				userId 	  = request.getParameter("userId");
		String 				uuid 	  = request.getParameter("validCode");
		Map<String,Object>	updateMap = new HashMap<String,Object>();
		
		updateMap.put( "userId"		, userId );
		updateMap.put( "validCode"	, uuid );
		
		int updateCnt = mapper.updateEmailValid( updateMap );
		
		
		if( updateCnt == 0 ) {
			log.info("잘못된 계정 정보입니다.");
			throw new Exception();
		} else if ( updateCnt == 1 ){
			log.info("Email Validation complete!!!");
			response.sendRedirect("/");
		} else {
			log.info("잘못된 접근 입니다.");
			throw new Exception();
		}
		
		
	}
	
	
	@RequestMapping( value="/accountRegister/checkDuplicate", method=RequestMethod.GET )
	public ResponseEntity<String> checkDuplicate( HttpServletRequest request ){
		
		
		String checkType 	= request.getParameter("checkType");
		
		
		
		if( checkType.equals("id") ) {
			
			String checkId 	= request.getParameter("userId");
			MemberVO member = mapper.getAccountInformation( checkId );
			
			if( member != null ) { // 있는 계정이면
				
				return new ResponseEntity<>( "fail", HttpStatus.INTERNAL_SERVER_ERROR );
			} else { // 없는 계정이면
				return new ResponseEntity<>( "success", HttpStatus.OK );
			}
		
		} else { // email check
			
			String userEmail 	= request.getParameter("userEmail");
			MemberVO member 	= mapper.getAccountInformationByEmail( userEmail );
			
			if( member != null ) { // 있는 계정이면
				
				return new ResponseEntity<>( "fail", HttpStatus.INTERNAL_SERVER_ERROR );
			} else { // 없는 계정이면
				return new ResponseEntity<>( "success", HttpStatus.OK );
			}
			
			
		}		
		
	}

	@Override
	public boolean send() {
		// TODO Auto-generated method stub
		return false;
	}

}
