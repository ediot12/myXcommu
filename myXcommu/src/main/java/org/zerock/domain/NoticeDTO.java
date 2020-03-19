package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeDTO {
	
	private int notice_seq;
	private String subject;
	private String content;
	private String writer;
	private Date regdate;
	private int view_cnt;

}
