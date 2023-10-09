package com.itwill.joo.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.joo.dto.order.CurrentPointWhenBuyDto;
import com.itwill.joo.dto.order.DeliveryCreateDto;
import com.itwill.joo.dto.order.OrderCreateDto;
import com.itwill.joo.dto.order.OrderProductCreateDto;
import com.itwill.joo.dto.order.OrderToProductDto;
import com.itwill.joo.dto.order.PointWhenCancelDto;
import com.itwill.joo.dto.order.PointWhenCompleDto;
import com.itwill.joo.dto.order.ReviewToOrderDto;
import com.itwill.joo.dto.order.StockAndSoldWhenBuyDto;
import com.itwill.joo.dto.order.StockWhenCancelDto;
import com.itwill.joo.service.BasketProductService;
import com.itwill.joo.service.OrderService;
import com.itwill.joo.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("/api/order")
public class OrderRestController {
    
	private final UserService userService;
	private final BasketProductService basketProductService;
    private final OrderService orderService;
    
    @DeleteMapping("/{id}")
    public ResponseEntity<Integer> deleteOrder(@PathVariable long id) {
        log.info("deleteOrder(id={})", id);
        
        int result = orderService.deleteByOrderId(id);
        
        return ResponseEntity.ok(result);
    }
    
    // -> 취소완료
    @PutMapping("/cancel/{id}")
    public ResponseEntity<Integer> updateToCancelComple(@PathVariable long id) {
        log.info("updateToCancelComple(id={})", id);
        
        int result = orderService.updateToCancelComple(id);
        
        return ResponseEntity.ok(result);
    }
    
    // -> 구매확정
    @PutMapping("/buy/{id}")
    public ResponseEntity<Integer> updateToBuyComple(@PathVariable long id) {
        log.info("updateToBuyComple(id={})", id);
        
        int result = orderService.updateToBuyComple(id);
        
        return ResponseEntity.ok(result); 
    }
    
    // 결제시 주문 정보 저장
    @PostMapping("/order")
    public ResponseEntity<Long> createOrderInfo(HttpServletRequest request,  @RequestBody OrderCreateDto dto, Principal principal) {
        log.info("createOrderInfo(dto={})", dto);
        orderService.createOrder(dto);
        
        long id = orderService.readOrderMaxId(); // 주문아이디(oid)
        long userId= userService.getUserInfo(principal.getName()).getId();
        
        HttpSession session = request.getSession();
        basketProductService.deleteAll(userId);
		session.setAttribute("basketCount", basketProductService.read(userId).size());
        
        return ResponseEntity.ok(id); // 주문아이디(oid) 리턴
    }
    
    // 결제시 주문상품 정보 저장
    @PostMapping("/orderProduct")
    public ResponseEntity<?> createOrderProductInfo(@RequestBody OrderProductCreateDto dto) {
        log.info("createOrderProductInfo(dto={})", dto);
        orderService.createOrderProduct(dto);
        
        return ResponseEntity.ok("orderProduct 저장 성공"); 
    }
    
    // 결제시 배송 정보 저장
    @PostMapping("/delivery")
    public ResponseEntity<?> createDeliveryInfo(@RequestBody DeliveryCreateDto dto) {
        log.info("createDeliveryInfo(dto={})", dto);
        orderService.createDelivery(dto);
        
        return ResponseEntity.ok("delivery 저장 성공"); 
    }
    
    // 결제 시 -> 유저 현재 포인트 - 사용 포인트
    @PostMapping("/currentPointWhenBuy")
    public ResponseEntity<Integer> updateCurrentPointWhenBuy(@RequestBody CurrentPointWhenBuyDto dto) {
        log.info("updateCurrentPointWhenBuy(dto={})", dto);
        int result = orderService.updateCurrentPointWhenPay(dto);
        
        return ResponseEntity.ok(result); 
    }
    
    // 결제 시 -> 재고감소, 판매량증가
    @PostMapping("/stockAndSoldWhenBuy")
    public ResponseEntity<Integer> updateStockAndSold(@RequestBody StockAndSoldWhenBuyDto dto) {
        log.info("updateStockAndSold(dto={})", dto);
        int result = orderService.updateStockAndSoldWhenPay(dto);
        
        return ResponseEntity.ok(result); 
    }
    
    // 주문 취소 시 -> 유저 현재 포인트 + 사용 포인트 
    @PutMapping("/point")
    public ResponseEntity<Integer> updatePointWhenCancel(@RequestBody PointWhenCancelDto dto) {
        log.info("updatePointWhenCancel(dto={})", dto);
        
        int result = orderService.updatePointWhenCancel(dto);
        
        return ResponseEntity.ok(result);
    }
    
    // 주문 취소 시 -> 재고수 + 수량 / 판매량 - 수량 
    @PutMapping("/stock")
    public ResponseEntity<Integer> updateStockAndSoldWhenCancel(@RequestBody StockWhenCancelDto dto) {
        log.info("updateStockAndSoldWhenCancel(dto={})", dto);
        
        int result = orderService.updateStockAndSoldWhenCancel(dto);
        
        return ResponseEntity.ok(result);
    }
    
    // 주문 취소 시 -> 재고수 + 수량 / 판매량 - 수량 
    @PutMapping("/finalPoint")
    public ResponseEntity<Integer> updatePointWhenComple(@RequestBody PointWhenCompleDto dto) {
        log.info("updatePointWhenComple(dto={})", dto);
        
        int result = orderService.updatePointWhenComple(dto);
        
        return ResponseEntity.ok(result);
    }
    
    // 상품 상세 페이지 -> 주문 페이지
    @PostMapping("/toOrder")
    public String readToOrder(@RequestBody OrderToProductDto dto, HttpSession session) {
        log.info("readToOrder({})", dto);
        session.setAttribute("productInfo", dto);
        
        return "order/orderPage";
    }

}