package com.itwill.joo.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.joo.domain.PaymentInfo;
import com.itwill.joo.dto.payment.PaymentCancelDto;
import com.itwill.joo.dto.payment.PaymentInfoDto;
import com.itwill.joo.service.PaymentService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/api/payment")
public class PaymentRestController {
	
	@Autowired
	private PaymentService paymentService;
	
	private final IamportClient iamportClient;
    private final String REST_API = "2600328773634706";
    private final String REST_API_SECRET = "XgywrlDXHt3KLbPRKnwi2GtCc6XPh7bR93NfYdIdELYErDIYezTzGyPj8HsOo1C3Y0e6zcIgR3OvddJX";

    public PaymentRestController() {
        this.iamportClient = new IamportClient(REST_API, REST_API_SECRET);
    }

	@RequestMapping("/verify/{imp_uid}")
	@ResponseBody
	public IamportResponse<Payment> paymentByImpUid(@PathVariable("imp_uid") String imp_uid) 
			throws IamportResponseException, IOException {		
		log.info("paymentByImpUid({})", imp_uid);
		
		return iamportClient.paymentByImpUid(imp_uid);
	}
	
	@PostMapping("/save")
	public ResponseEntity<Integer> savePayment(@RequestBody Map<String, String> map) {
		PaymentInfoDto dto = PaymentInfoDto.builder()
				.o_id(Long.parseLong(map.get("o_id")))
				.imp_uid(map.get("imp_uid"))
				.merchant_uid(map.get("merchant_uid"))
				.pay_method(map.get("pay_method"))
				.amount(Integer.parseInt(map.get("amount")))
				.build();
		
		int result = paymentService.insertPaymentData(dto);
		
		log.info("result = {}", result);
		
		return ResponseEntity.ok(result);
	}
	
	@PutMapping("/cancel/{oid}")
	@ResponseBody
	public IamportResponse<Payment> paymentCancel(@PathVariable("oid") long oid) 
			throws IamportResponseException, IOException {
		log.info("paymentCancel({})", oid);
		
		PaymentInfoDto dto = paymentService.selectPaymentByOrderId(oid);
		log.info("dto = {}", dto);
		
		BigDecimal val = BigDecimal.valueOf(dto.getAmount());
		CancelData data = new CancelData(dto.getMerchant_uid(), false, val);
		
		return iamportClient.cancelPaymentByImpUid(data);
	}

}
