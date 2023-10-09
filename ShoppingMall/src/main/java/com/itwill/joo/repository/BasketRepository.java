package com.itwill.joo.repository;

import com.itwill.joo.domain.Basket;
import com.itwill.joo.dto.basket.BasketProductDto;
import com.itwill.joo.dto.basket.BasketProductListDto;

public interface BasketRepository {
	
	Basket selectByUserId(long userId);


}
