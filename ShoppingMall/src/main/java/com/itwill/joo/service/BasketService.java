package com.itwill.joo.service;

import org.springframework.stereotype.Service;

import com.itwill.joo.domain.Basket;
import com.itwill.joo.dto.basket.BasketProductDto;
import com.itwill.joo.repository.BasketRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class BasketService {
	
	private final BasketRepository basketRepository;
	
	public Basket selectByUserId(long userId) {
		log.info("selectByUserId({})", userId);
		
		return basketRepository.selectByUserId(userId);
	}

 


}
