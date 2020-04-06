package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardReportDTO {
	
	private String 	board_type;
	private int 	board_seq;
	private String 	board_writer;
	private String 	board_reporter;
	private Date 	report_time;

}
