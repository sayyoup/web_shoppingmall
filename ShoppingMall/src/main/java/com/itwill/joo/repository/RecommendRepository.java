package com.itwill.joo.repository;

import java.util.List;

import com.itwill.joo.domain.Recommend;

public interface RecommendRepository {
    
    // 추천 입력
    int insertRecommend(Recommend recommend);
    
    //추천 삭제
    int deleteRecommend(long u_id, long p_id) ;
    
    // 해당 상품의 추천 수 조회
    Recommend selectRecommendProductByPid(long p_id);

    // 상품 조회(많이 받은 순으로)
    List<Recommend> selectRecommendProductOrderByDesc();

    // 자신이 한 추천 상품 조회
    List<Recommend> selectRecommendByUid(long u_id);
    
    
    
}
