package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class UserLogDTO {

	private String division;
	private String writer;
	private String board_type;
	private String board_seq;
	private String board_subject;
	private String board_content;
	private int reply_seq;
	private String reply_content;
	private Date regdate;
	
}
