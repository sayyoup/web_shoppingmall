package com.itwill.joo.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.DeleteMapping;

import com.itwill.joo.domain.User;
import com.itwill.joo.dto.product.ProductListPageDto;
import com.itwill.joo.dto.user.AdminReadAllUserListDto;
import com.itwill.joo.repository.AdminUserRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
@Service // -> 스프링 컨테이너에서 서비스 컴포넌트 객체를 생성하고 관리(필요한 곳에 주입).
@RequiredArgsConstructor // 2. (2) final로 선언된 필드를 초기화하는 생성자를 자동으로 만들어줌.@Slf4j
@Slf4j
public class AdminUserService {

	private final AdminUserRepository adminUserRepository;
	private final UserService userService;
	
	// 유저 전체보기 (관리자 페이지)
	public List<AdminReadAllUserListDto> readAllUsers() {
		List<User> list = adminUserRepository.readAllUserOrderByCreatedTime();
		log.info("전체 유저목록 = {}", list);
		List<AdminReadAllUserListDto> result = new ArrayList<>();
		for(User l : list) {
			result.add(AdminReadAllUserListDto.fromEntity(l));
		}
		return result;
	}
	
	// 유저 ban 하기
	public int BanUser(long id) {
		return userService.deleteUser(id);
	}

	// 검색한 유저 전체보기(관리자 페이지)
	public List<AdminReadAllUserListDto> adminSearchUser(String search) {
		List<User> list = adminUserRepository.readAllUserBySearch(search);
		List<AdminReadAllUserListDto> result = new ArrayList<>();
		for(User l : list) {
			result.add(AdminReadAllUserListDto.fromEntity(l));
		}
		return result;
	}
	
	
}
