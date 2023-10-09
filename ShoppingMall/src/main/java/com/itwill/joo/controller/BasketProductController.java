package com.itwill.joo.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.joo.dto.basket.BasketProductDto;
import com.itwill.joo.dto.basket.BasketProductListDto;
import com.itwill.joo.service.BasketProductService;
import com.itwill.joo.service.BasketService;
import com.itwill.joo.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
public class BasketProductController {

	private final UserService userService;
	private final BasketService basketService;
	private final BasketProductService basketProductService;
	

	@GetMapping("/myBasket")
	public String basketlist(Model model, Principal principal, HttpSession session) {
		log.info("myBasketList()");
		
		
		
		long userId = userService.select(principal.getName()).getId();
		
		List<BasketProductListDto> list = basketProductService.read(userId);
		
		log.info("size = {}", list.size());
		
		long basketId = basketService.selectByUserId(userId).getId();
		
		model.addAttribute("basketproducts",list);
		model.addAttribute("basketId", basketId);
		model.addAttribute("userId", userId);
		
		return "basket/myBasket";
	}

	

	
	
	//장바구니 개별 삭제
	@PostMapping("/deleteProduct")
	public String delete(HttpServletRequest request, long id, Principal principal) {
		log.info("delete(id={})", id);
		
		long u_id = userService.select(principal.getName()).getId();
		
		int result = basketProductService.delete(id);
		log.info("delete(id={})", result);
		
		HttpSession session = request.getSession();
		session.setAttribute("basketCount", basketProductService.read(u_id).size());
		
		return "redirect:/user/myBasket";
	}
	
	
	//장바구니 전체 삭제
	@PostMapping("/deleteAll")
	@ResponseBody
	public ResponseEntity<String> deleteAll(HttpServletRequest request, Principal principal) {
	    log.info("deleteAll()");
	    
	    long userId = userService.select(principal.getName()).getId();
	    
	    // 장바구니 전체 삭제 서비스 메소드 호출
	    int result = basketProductService.deleteAll(userId);
	    log.info("result = {}", result);
	    
	    HttpSession session = request.getSession();
		session.setAttribute("basketCount", basketProductService.read(userId).size());
	    
	    // 장바구니 리스트 페이지로 리다이렉트
	    return ResponseEntity.ok("success");
	}
	
	

	//상품 디테일 페이지 -> 내 장바구니 페이지
	//장바구니에 넣을때 사용 .장바구니에 있을 경우 pcount 업데이트. 
	@PostMapping("/updatePcount")
	@ResponseBody
	public ResponseEntity<Integer> updatePcount(HttpServletRequest request, @RequestBody BasketProductDto dto, Principal principal){
	    log.info("updatePcount(dto={}", dto);
	    
	    long u_id = userService.select(principal.getName()).getId();
	    
	    //장바구니에 있는 상품인지 체크
	    int result = basketProductService.selectById(dto);
	    int rsp = 0;
	    if(result == 0) {
	        rsp = basketProductService.productAddBasket(dto);
	    } else {
	        rsp = basketProductService.updatePcount(dto);
	    }
	    
	    HttpSession session = request.getSession();
		session.setAttribute("basketCount", basketProductService.read(u_id).size());
		
	    
	    return ResponseEntity.ok(rsp);
	    
	}

	//장바구니 페이지에서 상품수량 수정. 
	@PostMapping("/updateQuantity")
	@ResponseBody
	public ResponseEntity<Integer> updateQuantity(@RequestBody BasketProductDto dto) {
	    log.info("updateQuantityPcount(dto=P{}", dto);
	    
	   
	    int result = basketProductService.updateQuantityPcount(dto);
	    log.info("result = {}", result);
	   
	    return ResponseEntity.ok(result);
	    
	}
	
	
	
	
}
	