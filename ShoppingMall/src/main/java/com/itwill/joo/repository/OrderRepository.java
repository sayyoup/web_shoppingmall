package com.itwill.joo.repository;

import java.util.List;

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
import com.itwill.joo.dto.order.StockAndSoldWhenBuyDto;
import com.itwill.joo.dto.order.StockWhenCancelDto;

public interface OrderRepository {
	
OrderedProductDto selectOrderedProduct(long id);
    
    OrdererInfoDto selectOrdererInfo(long id);
    
    List<OrderHistoryDto> selectOrderHistory(long id);
    List<OrderCancelHistoryDto> selectOrderCancelHistory(long id);
    
    int deleteOrder(long id);
    int deleteOrderProduct(long id);
    int deleteDelivery(long id);
    
    int updateCancelComple(long id);
    
    int updateBuyComple(long id);
    
    DeliveryInfoDto selectDeliveryInfo(long id);
       
    int insertOrder(OrderCreateDto dto);
    long selectOrderMaxId();
    
    int insertOrderProduct(OrderProductCreateDto dto);
    
    int insertDelivery(DeliveryCreateDto dto);
    
    List<OrderByBasketDto> selectOrderByBasket(long id);
    
    int updateCurrentPointWhenPay(CurrentPointWhenBuyDto dto);
    
    int updateStockAndSoldWhenPay(StockAndSoldWhenBuyDto dto);
    
    int updateCurrentPointWhenCancel(PointWhenCancelDto dto);
    
    int updateStockAndSoldWhenCancel(StockWhenCancelDto dto);
    
    int updateCurrentPointWhenComple(PointWhenCompleDto dto);
    
    List<DetailOrderProductDto> selectDetailOrderProduct(long id);

}

