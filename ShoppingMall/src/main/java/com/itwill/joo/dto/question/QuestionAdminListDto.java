package com.itwill.joo.dto.question;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class QuestionAdminListDto {

	// 답변아이디, 유저 아이디
	private long q_id;
	
	// 작성자의 이름을 받아 사용
	private String u_id;
	
	private String qtype;
	private String qtitle;
	private String qcontent;
	private String is_answered;
	
	private Timestamp qcreated_time;
	private Timestamp qreplycreate_time;
	
	
}
