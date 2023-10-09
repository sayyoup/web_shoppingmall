package com.itwill.joo.repository;

import java.util.List;

import com.itwill.joo.domain.User;

public interface AdminUserRepository {

	/**
	 * 관리자가 전체유저를 보는 메서드
	 * @return List<User>
	 */
	List<User> readAllUserOrderByCreatedTime();

	/**
	 * 유저 검색하기 검색어에 해당하는 유저찾기
	 * @param String search
	 * @return List<User>
	 */
	
	List<User> readAllUserBySearch(String search);
	
}
