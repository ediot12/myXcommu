package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QuestionBoardDTO {
	
	private int qna_board_seq;
	private String division;
	private String subject;
	private String content;
	private String writer;
	private Date regdate;
	private int recommand_cnt;
	private String file_yn;
	private String status;
	private int view_cnt;
	
	//outer join에 의해 추가함
	private int reply_cnt;
	

}
