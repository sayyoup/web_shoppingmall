package com.itwill.joo.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.joo.domain.Product;
import com.itwill.joo.dto.product.ProductDto;
import com.itwill.joo.dto.product.ProductListPageDto;
import com.itwill.joo.dto.question.QuestionsListDto;
import com.itwill.joo.dto.recommend.RecommendDto;
import com.itwill.joo.dto.review.ReviewListDto;

import com.itwill.joo.service.BasketService;
import com.itwill.joo.service.UserService;
import com.itwill.joo.service.ProductService;
import com.itwill.joo.service.QuestionService;
import com.itwill.joo.service.RecommendService;
import com.itwill.joo.service.ReviewService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor // 생성자 자동 생성
@RequestMapping("/product") // "/post" 로 시작하는 주소 다처리
@Controller
public class ProductController {

    private final BasketService basketService;
    private final UserService userService;
	  private final ReviewService reviewService;
    private final ProductService productService;
    private final QuestionService questionService;
    private final RecommendService recommendService;
    
    // 상품들을 리스트에 보여줌.
	@GetMapping("/productsList")
	public void productList(Model model) {
		List<ProductListPageDto> p = productService.showAllProductsList();
		model.addAttribute("products", p);
	}

	// 상품문의 정보에 product 번호를 받아옴으로써 그 제품의 상세정보를 확인
    @GetMapping("/productDetail")
    public void list(@RequestParam("pid") long pid, Principal principal, Model model) {
        log.info("GET: productQuestionsList()");
        
        if(principal != null) {
        	long userId = userService.select(principal.getName()).getId();
            long basketId = basketService.selectByUserId(userId).getId();
            model.addAttribute("basketId", basketId);
        }
        
       
        // 컨트롤러는 서비스 계층의 메서드를 호출한 후 서비스 기능을 수행
        List<QuestionsListDto> list = questionService.readProductId(pid);
        ProductDto p = productService.userReadOneProductByid(pid);
		model.addAttribute("product", p);
        
		
		// 상품 리뷰 리스트
		List<ReviewListDto> reviewList = reviewService.selectReviewsByPid(pid);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("reviewSize", reviewList.size());
		
        // 뷰에 보여줄 데이터를 모델에 저장
		
        model.addAttribute("questionsList", list);
        model.addAttribute("productId", pid);

       // model.addAttribute("u_id", u_id);
        //model.addAttribute("selectRecommendProductByPid", selectRecommendProductByPid);
        log.info("questionsList: {}", list);
    }
    
    /**
     * @author 한별
     * @param dto
     * @return
     */
    //제품 추천 등록
    @PostMapping
    public ResponseEntity<Integer> recommendCreate(@RequestBody RecommendDto dto) {
        log.info("recommendCreate()", dto);
        
        int result = recommendService.createRecommend(dto);
        
        return ResponseEntity.ok(result);
    }
    
    /**
     * @author 한별
     * @param dto
     * @return
     */
    // 제품 추천 삭제
    @DeleteMapping("/{p_id}/{u_id}")
    @ResponseBody
    public ResponseEntity<Integer> recommendDelete(@PathVariable long u_id, @PathVariable long p_id) {
        log.info("recommendDelete()");
        
        int result = recommendService.deleteRecommend(u_id, p_id);
        
        return ResponseEntity.ok(result);
    }
    
    @GetMapping("/productsNewList")
	public void productsNewList(Model model) {
		List<ProductListPageDto> p = productService.showNewProductsLsit();
		log.info("dto{}", p);
		model.addAttribute("products", p);		
	}
	
	@GetMapping("/productsHotList")
	public void productsHotList(Model model) {
		List<ProductListPageDto> p = productService.showHotProductsLsit();
		log.info("dto{}", p);
		model.addAttribute("products", p);
	}


}