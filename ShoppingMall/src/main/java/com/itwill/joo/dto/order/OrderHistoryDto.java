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
public class OrderHistoryDto {
	
	private long id; // Delivery_id
	
	private String ptitle_image; // 주문 상품 이미지
	private String pname; // 상품 이름
	private int pstock; // 수량(임시로 재고 사용)
	private int pprice; // 상품 가격	
	private int pcount; // 상품 수량	
	private Timestamp dcreated_time; // 주문 일자
	private Timestamp dmodified_time; // 취소 일자(배송 업데이트 시간)	
	private String dstatus; // 배송 상태
	private int odiscount_price; // 총 할인액
	private long uid; // 유저 아이디
	private long pid; // 상품 아이디
	private int opoint; // 적립될 포인트
	private long oid; // 주문 아이디
    private long opid; // 주문상품 아이디
    private long dcode; // 송장 번호
    private int oinitial_price; // 상품 총 금액(할인 제외)
    private int palc; // 상품 도수
    private String pregion; // 상품 원산지
	
	
	
	
	
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
