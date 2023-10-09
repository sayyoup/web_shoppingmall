package com.itwill.joo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.joo.domain.Review;
import com.itwill.joo.dto.review.ReviewCreateDto;
import com.itwill.joo.dto.review.ReviewListDto;
import com.itwill.joo.repository.ReviewRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Service
@RequiredArgsConstructor
@Slf4j
public class ReviewService {
	private final ReviewRepository reviewRepository;
	
	public int createReview(ReviewCreateDto dto) {
		log.info("createReview({})", dto);
		
		return reviewRepository.createReview(dto.toEntity());
	}
	
	public List<ReviewListDto> selectReviewsByPid(long pid) {
		log.info("selectReviewsByPid({})", pid);
		
		List<Review> reviews = reviewRepository.selectAllReviewsByPid(pid);
		
		return reviews.stream().map(ReviewListDto::fromEntity).toList();
	}

	public List<ReviewListDto> selectReviewsByUid(long uid) {
		log.info("selectReviewsByUid({})", uid);
		
		List<Review> reviews = reviewRepository.selectAllReviewsByUid(uid);
		
		return reviews.stream().map(ReviewListDto::fromEntity).toList();
	}
	
}




















