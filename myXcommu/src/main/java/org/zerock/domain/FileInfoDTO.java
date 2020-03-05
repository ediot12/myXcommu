package org.zerock.domain;

import lombok.Data;

@Data
public class FileInfoDTO {

	private String board_type;
	private int board_seq;
	private int file_seq;
	private String writer;
	private String file_locate;
	private String file_uuid;
	private String file_name;
	
}
