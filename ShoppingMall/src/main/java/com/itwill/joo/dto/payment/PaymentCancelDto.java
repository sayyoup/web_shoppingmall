package com.itwill.joo.dto.payment;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PaymentCancelDto {
	
	private String merchant_uid;
    private int cancel_request_amount;
    private String reason;
    private String refund_holder; 
    private String refund_bank;
    private String refund_account;

}
