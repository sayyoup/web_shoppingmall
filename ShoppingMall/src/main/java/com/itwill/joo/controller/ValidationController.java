package com.itwill.joo.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.joo.service.MailService;
import com.itwill.joo.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("/api/validate")
public class ValidationController {
	
	private final UserService userService;
	
	@PostMapping("/loginId")
	@ResponseBody
	public ResponseEntity<Integer> loginIdValidate(@RequestParam("loginId") String loginId) {
		log.info("loginIdValidate({})", loginId);
		
		int result = userService.validateLoginId(loginId);
		
		return ResponseEntity.ok(result);
	}
	
	@PostMapping("/emailCheck")
	@ResponseBody
	public ResponseEntity<Integer> checkEmail(@RequestParam("email") String email) {
		log.info("checkEmail({})", email);
		
		int result = userService.checkEmail(email);
		
		return ResponseEntity.ok(result);
	}
	
	@PostMapping("/sendCode")
	@ResponseBody
	public String sendValidationCode(@RequestParam("email") String email) {
		log.info("sendValidationCode({})", email);
		
		// 인증 코드 생성
		String code = MailService.generateValidationNumber();
		log.info("code = {}", code);
		
		// 이메일 전송
		MailService.sendValidationCode(email, code);
		
		return code;
	}

}
