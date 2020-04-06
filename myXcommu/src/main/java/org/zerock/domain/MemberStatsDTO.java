package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberStatsDTO {
	
	private String userid;
	private Date regdate;
	private Date updatedate;
	private int user_level;
	private int login_count;
	private String email;
	private int board_cnt;
	private int reply_cnt;

}
