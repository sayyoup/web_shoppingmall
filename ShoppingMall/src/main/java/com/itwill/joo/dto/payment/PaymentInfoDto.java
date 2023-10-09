package com.itwill.joo.dto.payment;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import com.itwill.joo.domain.PaymentInfo;
import com.itwill.joo.domain.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PaymentInfoDto {

	private long id;
	private long o_id;
	
	private String pay_method;
	private String imp_uid;
	private String merchant_uid;
	
	private int amount;
	
	private LocalDateTime pcreated_time;
	
	public PaymentInfo toEntity() {
		return PaymentInfo.builder()
				.o_id(o_id)
				.pay_method(pay_method)
				.imp_uid(imp_uid)
				.merchant_uid(merchant_uid)
				.amount(amount)
				.pcreated_time(pcreated_time)
				.build();
	}
	
	public static PaymentInfoDto fromEntity(PaymentInfo entity) {
		return PaymentInfoDto.builder()
				.id(entity.getId())
				.o_id(entity.getO_id())
				.pay_method(entity.getPay_method())
				.imp_uid(entity.getImp_uid())
				.merchant_uid(entity.getMerchant_uid())
				.amount(entity.getAmount())
				.pcreated_time(entity.getPcreated_time())
				.build();
	}
	
}
