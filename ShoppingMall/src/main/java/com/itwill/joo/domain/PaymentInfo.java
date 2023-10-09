package com.itwill.joo.domain;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
/**
 * Payment 클래스 작성
 * @author 서원준
 *
 */
public class PaymentInfo {
	
	private long id;
	private long o_id;
	
	private String pay_method;
	
	private String imp_uid;
	
	private String merchant_uid;
	
	private int amount;
	
	private LocalDateTime pcreated_time;

}
