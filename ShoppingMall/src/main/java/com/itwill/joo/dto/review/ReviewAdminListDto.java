package com.itwill.joo.dto.review;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReviewAdminListDto {

	// 리뷰 아이디
	private long r_id;

	// 리뷰 작성자의 로그인 아이디
	private String login_id;

	private String rcontent; // 리뷰 내용
	private String rreview_reply; // 리뷰 답변 내용

	private LocalDateTime rcreated_time; // 리뷰 작성시간

}