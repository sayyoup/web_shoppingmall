package com.itwill.joo.repository;

import java.util.List;

import com.itwill.joo.domain.Review;
import com.itwill.joo.dto.review.ReviewListDto;

public interface ReviewRepository {
	
	int createReview(Review review);
	
	List<Review> selectAllReviewsByPid(long p_id);

	List<Review> selectAllReviewsByUid(long u_id);
	
}
