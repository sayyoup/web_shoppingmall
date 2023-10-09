package com.itwill.joo.dto.review;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import com.itwill.joo.domain.Review;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReviewCreateDto {
	
	private long id;
	
	private long p_id;
	private long o_id;
	private long u_id;
	
	private int rratings;
	private String rcontent;
	
	private Timestamp rcreated_time;
	private Timestamp rmodified_time;
	
	public Review toEntity() {
		return Review.builder()
				.id(id)
				.p_id(p_id)
				.o_id(o_id)
				.u_id(u_id)
				.rratings(rratings)
				.rcontent(rcontent)
				.rcreated_time(rcreated_time)
				.rmodified_time(rmodified_time)
				.build();
	}

}
