package com.itwill.joo.dto.basket;



import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BasketProductListDto {
	
	//제품 이름, 제품 가격,pcount , basketProduct id 
	
	private long id;
	
	private long b_id; //basket 테이블 b_id
	private long p_id; //basket 테이블 p_id	
	private int pcount; //basket 테이블 pcount
	
	private long pid; //상품 테이블 id
	private long uid; //유저 정보 
	
	private String pname;
	private int pprice;
	private String ptitle_image; //상품 사진.
	
	
    /*
     * public BasketProduct toEntity() { return BasketProduct.builder() .b_id(b_id)
     * .p_id(p_id) .pcount(pcount) .build(); }
     */
	
	
}
