package com.itwill.joo.dto.review;

import java.sql.Timestamp;

import com.itwill.joo.domain.Review;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReviewListDto {
	
	private long id;
	
	private long p_id;
	private long u_id;
	private long o_id;
	
	private String rcontent;
	private int rratings;
	
	private Timestamp rcreated_time;
	private Timestamp rmodified_time;
	
	private String review_reply;
	
	public static ReviewListDto fromEntity(Review review) {
		return ReviewListDto.builder()
				.id(review.getId())
				.p_id(review.getP_id())
				.u_id(review.getU_id())
				.o_id(review.getO_id())
				.review_reply(review.getRreview_reply())
				.rcontent(review.getRcontent())
				.rratings(review.getRratings())
				.rcreated_time(review.getRcreated_time())
				.build();
	}

}
