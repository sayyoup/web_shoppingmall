package com.itwill.joo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.joo.dto.order.CurrentPointWhenBuyDto;
import com.itwill.joo.dto.order.DeliveryCreateDto;
import com.itwill.joo.dto.order.DeliveryInfoDto;
import com.itwill.joo.dto.order.DetailOrderProductDto;
import com.itwill.joo.dto.order.OrderByBasketDto;
import com.itwill.joo.dto.order.OrderCancelHistoryDto;
import com.itwill.joo.dto.order.OrderCreateDto;
import com.itwill.joo.dto.order.OrderHistoryDto;
import com.itwill.joo.dto.order.OrderProductCreateDto;
import com.itwill.joo.dto.order.OrderedProductDto;
import com.itwill.joo.dto.order.OrdererInfoDto;
import com.itwill.joo.dto.order.PointWhenCancelDto;
import com.itwill.joo.dto.order.PointWhenCompleDto;
import com.itwill.joo.dto.order.RandomNumberGenerator;
import com.itwill.joo.dto.order.StockAndSoldWhenBuyDto;
import com.itwill.joo.dto.order.StockWhenCancelDto;
import com.itwill.joo.repository.OrderRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OrderService {
    
    private final OrderRepository orderRepository;
    
    public OrderedProductDto selectOrderedProduct(long id) {
        return orderRepository.selectOrderedProduct(id);
    }
    
    public OrdererInfoDto selectOrdererInfo(long id) {
        return orderRepository.selectOrdererInfo(id);
    }
    
    public List<OrderHistoryDto> selectOrderHistory(long id) {
        return orderRepository.selectOrderHistory(id); 
    }
    
    public List<OrderCancelHistoryDto> selectOrderCancelHistory(long id) {
        return orderRepository.selectOrderCancelHistory(id); 
    }
    
    public int deleteByOrderId(long id) {
        int resultSum = 0;
        
        resultSum += orderRepository.deleteOrder(id);
        resultSum += orderRepository.deleteOrderProduct(id);
        resultSum += orderRepository.deleteDelivery(id);
        return resultSum;
    }
    
    public int updateToCancelComple(long id) {
        return orderRepository.updateCancelComple(id);
    }
    
    public int updateToBuyComple(long id) {
        return orderRepository.updateBuyComple(id);
    }
    
    public DeliveryInfoDto selectDeliveryInfo(long id) {
        return orderRepository.selectDeliveryInfo(id);
    }
    
    public int createOrder(OrderCreateDto dto) {
        return orderRepository.insertOrder(dto);
    }
    public long readOrderMaxId() {
        return orderRepository.selectOrderMaxId();
    }
    
    public int createOrderProduct(OrderProductCreateDto dto) {
        return orderRepository.insertOrderProduct(dto);
    }
    
    public int createDelivery(DeliveryCreateDto dto) {
        dto.setDcode(RandomNumberGenerator.generateRandomNumber());
        return orderRepository.insertDelivery(dto);
    }
    
    public List<OrderByBasketDto> readOrderByBasket(long id) {
        return orderRepository.selectOrderByBasket(id);
    }
    
    public int updateCurrentPointWhenPay(CurrentPointWhenBuyDto dto) {
        return orderRepository.updateCurrentPointWhenPay(dto);
    }
    
    public int updateStockAndSoldWhenPay(StockAndSoldWhenBuyDto dto) {
        return orderRepository.updateStockAndSoldWhenPay(dto);
    }
    
    public int updatePointWhenCancel(PointWhenCancelDto dto) {
        return orderRepository.updateCurrentPointWhenCancel(dto);
    }
    
    public int updateStockAndSoldWhenCancel(StockWhenCancelDto dto) {
        return orderRepository.updateStockAndSoldWhenCancel(dto);
    }
    
    public int updatePointWhenComple(PointWhenCompleDto dto) {
        return orderRepository.updateCurrentPointWhenComple(dto);
    }
    
    public List<DetailOrderProductDto> readDetailOrderProduct(long id) {
        return orderRepository.selectDetailOrderProduct(id);
    }
    
    

}