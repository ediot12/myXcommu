package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class FreeBoardDTO {
	
	private int free_board_seq;
	private String subject;
	private String content;
	private Date regdate;
	private String writer;
	private int view_cnt;
	private int reply_cnt;

}
