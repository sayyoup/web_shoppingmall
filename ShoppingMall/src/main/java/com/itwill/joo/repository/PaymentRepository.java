package com.itwill.joo.repository;

import com.itwill.joo.domain.PaymentInfo;

public interface PaymentRepository {
	
	int insertPaymentData(PaymentInfo payment);
	
	PaymentInfo selectPaymentByOrderId(long o_id);

}
