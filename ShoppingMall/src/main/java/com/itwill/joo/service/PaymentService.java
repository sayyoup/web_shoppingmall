package com.itwill.joo.service;

import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itwill.joo.domain.PaymentInfo;
import com.itwill.joo.domain.User;
import com.itwill.joo.dto.payment.PaymentInfoDto;
import com.itwill.joo.repository.OrderRepository;
import com.itwill.joo.repository.PaymentRepository;
import com.itwill.joo.repository.UserRepository;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class PaymentService {
	
	private final PaymentRepository paymentRepository;
	
	@Transactional
	public int verifyPayment(IamportResponse<Payment> irsp, int amount, long o_id) {		
		PaymentInfo payment = PaymentInfo.builder()
				.pay_method(irsp.getResponse().getPayMethod())
				.imp_uid(irsp.getResponse().getImpUid())
				.merchant_uid(irsp.getResponse().getMerchantUid())
				.amount(irsp.getResponse().getAmount().intValue())
				.o_id(o_id)
				.build();
		
		return paymentRepository.insertPaymentData(payment);
	}

	public int insertPaymentData(PaymentInfoDto dto) {
		log.info("insertPaymentData({})", dto);
		
		return paymentRepository.insertPaymentData(dto.toEntity());
	}
	
	public PaymentInfoDto selectPaymentByOrderId(long o_id) {
		PaymentInfo payment = paymentRepository.selectPaymentByOrderId(o_id);
		
		log.info("payment = {}", payment);
		
		return PaymentInfoDto.fromEntity(payment);
	}
	
}