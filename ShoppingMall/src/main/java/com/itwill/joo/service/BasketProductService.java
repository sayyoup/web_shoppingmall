
 
package com.itwill.joo.service;


import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.joo.domain.BasketProduct;
import com.itwill.joo.dto.basket.BasketProductDto;
import com.itwill.joo.dto.basket.BasketProductListDto;
import com.itwill.joo.repository.BasketProductRepository;
import com.itwill.joo.repository.BasketRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Service
@RequiredArgsConstructor
@Slf4j
public class BasketProductService {

	private final BasketRepository basketRepository;
	private final BasketProductRepository basketProductRepository;	
	
	/**
	 * 로그인한 회원의 장바구니 리스트를 보여준다.
	 * @param userId
	 * @return
	 */
	
	
	public List<BasketProductListDto> read(long userId) {
		log.info("read(uid={})", userId);
		
		long b_id = basketRepository.selectByUserId(userId).getId();
		
		log.info("b_id = {}", b_id);
		
		return basketProductRepository.selectOrderByBasketProductIdDesc(b_id);
		
	}
	
	
	
	
	/**
	 *  회원의 장바구니 상품 개별 삭제 
	 * @param id
	 * @return
	 */
	
	public int delete(long id) {
		log.info("delete(id={})", id);
		
		return basketProductRepository.deleteById(id);		
	}
	
	/**
	 * userId에 해당하는 리스트를 전체 삭제. 
	 * @param userId
	 * @return
	 */

		public int deleteAll(long userId) {
		log.info("deleteAllBaket(id={})", userId);
		
		//long userId = basketRepository.selectByUserId(userId).getId();
		return basketProductRepository.deleteAll(userId);
		
	}
	
	/**
	 * 상품을 장바구니에 넣는다.
	 * @param userId
	 * @param productId
	 * @return
	 */
	
	public int productAddBasket(BasketProductDto dto) {
		return basketProductRepository.insertProductAddBasket(dto.toEntity());
		
	}


	/**
	 * 장바구니에 넣기 전에 id를 찾기 위해서.
	 * @param dto
	 * @return
	 */
	
    public int selectById(BasketProductDto dto) {
        log.info("selectById({})", dto);
        
        return basketProductRepository.selectById(dto.toEntity());
    }

    /**
     * 수량을 수정한다.
     * @param dto
     * @return
     */
	
    public int updatePcount(BasketProductDto dto) {
        log.info("updatePcount(dto={}", dto);
        
        BasketProduct entity = BasketProduct.builder()
                .b_id(dto.getB_id())
                .p_id(dto.getP_id())
                .pcount(dto.getPcount())
                .build();
        log.info("entity={}", entity);
        return basketProductRepository.updatePcount(entity);
        
    }


  /**
   * 장바구니 창에서 수량을 수정할때
   * @param dto
   * @return
   */
    public int updateQuantityPcount(BasketProductDto dto) {
       log.info("updateQuantityPcount(dto)", dto);
       
       BasketProduct entity = BasketProduct.builder()
               .b_id(dto.getB_id())
               .p_id(dto.getP_id())
               .pcount(dto.getPcount())
               .build();
       log.info("entity={}", entity);
        
        return basketProductRepository.updateQuantityPcount(entity);
    }


   
}
