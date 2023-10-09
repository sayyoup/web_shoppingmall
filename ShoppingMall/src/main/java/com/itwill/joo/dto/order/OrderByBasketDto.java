package com.itwill.joo.dto.order;

import com.itwill.joo.domain.Product;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OrderByBasketDto {
	private long id;	
	
    private String ptitle_image; // 상품 이미지
    private String pname; // 상품 이름
    private int pprice; // 상품 가격
    private int pstock; // 상품 재고
	private String uname; // 주문자 정보
	private int upostcode; // 주문자 우편번호
	private String ustreet; // 주문자 주소
	private String udetail_address; // 주문자 상세주소
	private String uphone; // 주문자 연락처
	private String uemail; // 주문자 이메일
	private int ucurrent_point; // 주문자 현재 포인트
	private int pcount; // 장바구니 상품 개별 수량
	private long uid; // 유저 id
	private long pid; // 상품 id
	
	

//	public Product toEntity() {
//		return Product.builder()
//				.login_id(loginId)
//				.upassword(password)
//				.uname(name)
//				.uemail(email)
//				.uphone(phone)
//				.ustreet(street)
//				.udetail_address(detailAddress)
//				.upostcode(postcode)
//				.role("ROLE_USER")
//				.build();
//	}
	
}
