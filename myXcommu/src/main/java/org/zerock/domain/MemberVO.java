package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	
	private String userid;
	private String userpw;
	private boolean enabled;
	private Date regDate;
	private Date updateDate;
	private List<AuthVO> authList;
	
	private int user_level;
	private int login_count;
	private String email;
	private String email_check_valid;
}
