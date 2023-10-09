package com.itwill.joo.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.joo.dto.question.QuestionAdminListDto;
import com.itwill.joo.dto.question.QuestionAnsweredUpdateDto;
import com.itwill.joo.service.AdminQuestionService;
import com.itwill.joo.service.QuestionService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/api/AdminQuestion")
public class AdminQuestionRestController {

	private final AdminQuestionService adminQuestionService;	
	
    // 관리자 페이지에서 보여질 문의리스트
	@GetMapping("/QuestionList")
	public ResponseEntity<List<QuestionAdminListDto>> read() {
		List<QuestionAdminListDto>list = adminQuestionService.readWithUsersName();
		return ResponseEntity.ok(list);
	}
	
	@GetMapping("/NoAnswered")
	public ResponseEntity<List<QuestionAdminListDto>> readNoAnswere() {
		List<QuestionAdminListDto>list = adminQuestionService.selectNoAnsweredFirst();
		return ResponseEntity.ok(list);
	}
	
	// 문의 답하기 모달
	@GetMapping("/modify/{id}")
	public ResponseEntity<QuestionAdminListDto> modify(@PathVariable long id){
		QuestionAdminListDto dto = adminQuestionService.readWithName(id);
		log.info("read(dto= {})",dto);
		return ResponseEntity.ok(dto);
	}

	// 답변 완료(question 수정)
	@PutMapping("/answere/{q_id}")
	public ResponseEntity<Integer> updateProduct(@RequestBody QuestionAnsweredUpdateDto dto) {
		
		log.info("답변완료 dto = {}", dto);
		int result = adminQuestionService.answere(dto);
		return ResponseEntity.ok(result);
	}
	
	 
}