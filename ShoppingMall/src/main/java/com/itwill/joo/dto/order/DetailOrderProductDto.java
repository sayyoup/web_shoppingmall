package com.itwill.joo.dto.order;

import java.sql.Timestamp;

import com.itwill.joo.domain.Product;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DetailOrderProductDto {
	
	private long id;	
	
	private long pid; // 상품 아이디	
	private String ptitle_image; // 상품 타이틀 이미지
	private String pname; // 상품 이름
	private String pcount; // 주문 상품 갯수
	private String pprice; // 주문 상품 가격
	private Timestamp dcreated_time; // 주문일자
	

	
	
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
