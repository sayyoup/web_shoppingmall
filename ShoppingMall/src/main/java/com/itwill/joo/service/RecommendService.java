package com.itwill.joo.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.joo.domain.Product;
import com.itwill.joo.domain.Recommend;
import com.itwill.joo.domain.User;
import com.itwill.joo.dto.recommend.RecommendDto;
import com.itwill.joo.dto.recommend.RecommendListDto;
import com.itwill.joo.repository.ProductRepository;
import com.itwill.joo.repository.QuestionRepository;
import com.itwill.joo.repository.RecommendRepository;
import com.itwill.joo.repository.UserRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service // -> 스프링 컨테이너에서 서비스 컴포넌트 객체를 생성하고 관리(필요한 곳에 주입).
@RequiredArgsConstructor // 2. (2) final로 선언된 필드를 초기화하는 생성자를 자동으로 만들어줌.@Slf4j
@Slf4j
public class RecommendService {

    // 생성자에 의한 의존성 주입
    private final RecommendRepository recommendRepository;
    private final UserRepository userRepository;
    private final ProductRepository productRepository;
    private final QuestionRepository questionRepository; 
    
    // 추천 입력
   public int createRecommend(RecommendDto dto) {
       log.info("createRecommend)", dto);
       
       return recommendRepository.insertRecommend(dto.toEntity());
   }
   
   // 추천 삭제
   public int deleteRecommend(long u_id, long p_id) {
       log.info("deleteRecommend(u_id={}, p_id={})", u_id, p_id);
       
       return recommendRepository.deleteRecommend(u_id, p_id);
   }
  
   
    // 상품 추천수 따라 조회
   public List<RecommendListDto> selectRecommendOrderBydesc() {
       log.info("orderbyDesc");
       
       List<Recommend> list = recommendRepository.selectRecommendProductOrderByDesc();
       List<RecommendListDto> recommend = new ArrayList<>();
       
       for(Recommend r : list) {
           long userId = r.getU_id();
           long productId = r.getP_id();
           User user = userRepository.selectUserById(userId);
           Product product = questionRepository.selectProductById(productId);
           String login_id = user.getLogin_id();
           
           RecommendListDto dto = RecommendListDto.fromEntity(r);
           dto.setLogin_id(login_id);
           dto.setProduct(product);
           recommend.add(dto);
          
       }
       return recommend;
   }
   
   // 해당 상품의 추천수 조회
   public RecommendListDto selectRecommendProductByPid(long p_id) {
       log.info("selectRecommendProductByPid(p_id ={}", p_id);
       
       Recommend entity = recommendRepository.selectRecommendProductByPid(p_id);
       RecommendListDto dto = RecommendListDto.fromEntity(entity);
       
       User user = userRepository.selectUserById(p_id);
       dto.setLogin_id(user.getLogin_id());
       
       Product product = questionRepository.selectProductById(entity.getP_id());
       dto.setProduct(product);
       
       return dto;
   }
   
   // 자신이 한 추천 상품 조회
   public List<RecommendListDto> selectRecommendByUid(long u_id) {
       log.info("selectRecommendByUid(u_id={}", u_id);
       
       List<Recommend> list = recommendRepository.selectRecommendByUid(u_id);
       List<RecommendListDto> recommend = new ArrayList<>();
       for(Recommend r : list) {
           Product product = questionRepository.selectProductById(r.getP_id());
           RecommendListDto dto = RecommendListDto.fromEntity(r);
           dto.setProduct(product);
           recommend.add(dto);
       }
       return recommend;
   }
    
}
