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
public class DeliveryInfoDto {
	
	private long id;	
	
	private String dstatus; // 배송 상태
	private String dcode; // 송장번호
	private Timestamp ocreated_time; // 주문일자
	private Timestamp dcreated_time; // 배송일자
	private String rname; // 수취인 이름
	private String dstreet; // 수취인 주소
	private String ddetail_address; // 수취인 상세주소

	
	
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
