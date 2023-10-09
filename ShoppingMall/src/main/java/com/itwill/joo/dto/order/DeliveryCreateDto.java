package com.itwill.joo.dto.order;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DeliveryCreateDto {
	
	private long id;	
	
	private long o_id; // 주문 아이디
	private String dcode; // 송장번호 10자리
	private String dstreet; // 수취인 주소
	private String ddetail_address; // 수취인 상세주소
	private String dpostcode; // 우편번호
	private String rname; // 수령인 이름
	private String rphone; // 수령인 전화번호
	private String dmessage; // 배송 메세지
	private String dstatus; // 배송 상태
	private int dtype; // 배송 타입
	
	
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
