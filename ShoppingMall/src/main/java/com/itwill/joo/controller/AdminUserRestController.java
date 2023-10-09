package com.itwill.joo.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.joo.dto.product.ProductListPageDto;
import com.itwill.joo.dto.user.AdminReadAllUserListDto;
import com.itwill.joo.service.AdminUserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/api/AdminUser")
public class AdminUserRestController {

	private final AdminUserService adminUserService;

	// 유저 전체보기 정렬
	@GetMapping("/UserList")
	public ResponseEntity<List<AdminReadAllUserListDto>> read() {
		log.info("관리자 유저리스트 메서드");
		List<AdminReadAllUserListDto> list = adminUserService.readAllUsers();
		return ResponseEntity.ok(list);
	}

	// 유저 삭제하기
	@DeleteMapping("/UserBan/{id}")
	public ResponseEntity<Integer> deleteProduct(@PathVariable long id) {
		log.info("유저 삭제 id = {}", id);
		int result = adminUserService.BanUser(id);
		return ResponseEntity.ok(result);
	}

	
	// 유저 검색버튼클릭시 리스트 like 검색
	@GetMapping("/search/{search}")
	public ResponseEntity<List<AdminReadAllUserListDto>> readSearch(@PathVariable String search) {
		List<AdminReadAllUserListDto> list = adminUserService.adminSearchUser(search);
		log.info("유저목록, 리스트수 = {}", list.size());
		return ResponseEntity.ok(list);
	}
}
