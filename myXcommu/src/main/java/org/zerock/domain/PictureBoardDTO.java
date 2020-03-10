package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PictureBoardDTO {
	
	private int picture_seq;
	private String division;
	private String subject;
	private String content;
	private String writer;
	private Date regdate;
	private int	recommand_cnt;
	private int reply_cnt;
	private String base64_code;
	

}
