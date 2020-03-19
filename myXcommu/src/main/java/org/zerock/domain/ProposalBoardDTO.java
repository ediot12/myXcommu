package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ProposalBoardDTO {
	
	private int proposal_seq;
	private String division;
	private String subject;
	private String content;
	private String writer;
	private Date regdate;
	private String status;
	private int view_cnt;
	private int reply_cnt;

}
