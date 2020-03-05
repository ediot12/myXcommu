package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardReplyDTO {
	
	private String board_type;
	private int board_seq;
	private String replyer;
	private String reply;
	private Date regdate;
	private Date updatedate;
	/* private int recommand_cnt; */
	private int reply_seq;
	
	// 공감 // 비공감
	private int empathy_yes;
	private int empathy_no;
	

}
