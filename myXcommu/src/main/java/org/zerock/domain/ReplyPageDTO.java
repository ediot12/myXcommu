package org.zerock.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor //생성자를 파라미터로 처리한댄다.
@Getter
public class ReplyPageDTO {
	
	private int replyCnt;
	private List<ReplyVO> list;

}
