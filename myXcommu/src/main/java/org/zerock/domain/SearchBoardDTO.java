package org.zerock.domain;

import java.util.Date;

import lombok.Data;


@Data
public class SearchBoardDTO {
	
	private int board_seq;
	private String board_type;
	private String subject;
	private String content; 
	private String writer;
	private Date regdate;
	private int view_cnt;
	

}
