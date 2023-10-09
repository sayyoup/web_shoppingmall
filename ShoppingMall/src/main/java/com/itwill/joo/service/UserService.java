package com.itwill.joo.service;

import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.itwill.joo.domain.User;
import com.itwill.joo.dto.user.FindLoginIdDto;
import com.itwill.joo.dto.user.FindPasswordDto;
import com.itwill.joo.dto.user.UserAuthenticationDto;
import com.itwill.joo.dto.user.UserCreateDto;
import com.itwill.joo.dto.user.UserDetailDto;
import com.itwill.joo.dto.user.UserUpdateDto;
import com.itwill.joo.repository.UserRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class UserService {
	
	private final BCryptPasswordEncoder passwordEncoder;
	private final UserRepository userRepository;
	
	// 사용자가 로그인 시에 입력한 아이디를 가지고 있는 User 객체를 DB에서 찾아 리턴
	// 해당되는 객체가 없으면 null을 리턴
	public User select(String loginId) {
		return userRepository.selectUserByLoginId(loginId);
	}
	
	// 사용자의 상세 정보를 가져오는 메서드
	public UserDetailDto getUserInfo(String loginId) {
		User user = userRepository.selectUserByLoginId(loginId);
		return UserDetailDto.fromEntity(user);
	}
	
	public String getLoginId(FindLoginIdDto dto) {
		return userRepository.selectLoginIdByEmailAndName(dto);
	}
	
	// 비밀번호 찾기 기능에 사용되는 메서드
	public int isUserExisting(FindPasswordDto dto) {
		return userRepository.selectByLoginIdAndEmail(dto);
	}
	
	// 이메일 중복 여부 체크
	// 사용 가능한 이메일이면 1, 이미 사용중인 이메일이면 0을 리턴
	public int checkEmail(String email) {
		User user = userRepository.selectUserByEmail(email);
		if(user == null) {
			return 1;
		}
		return 0;
	}
	
	// 아이디 중복 여부 체크
	// 사용 가능한 아이디이면 1, 이미 사용중인 아이디이면 0을 리턴
	public int validateLoginId(String loginId) {
		User user = userRepository.selectUserByLoginId(loginId);
		if(user == null) {
			return 1;
		}
		return 0;
	}
	
	public int selectByLoginIdAndPassword(UserAuthenticationDto dto) {
		log.info("selectByLoginIdAndPassword({})", dto);
		User user = userRepository.selectUserByLoginId(dto.getLoginId());
		
		boolean result = passwordEncoder.matches(dto.getPassword(), user.getUpassword());
		log.info("result = {}", result);
		if(result) {
			return 1;
		}
		
		return 0;
	}
	
	// 사용자의 회원가입 정보를 DB에 저장하는 메서드
	public int create(UserCreateDto dto) {
		String password = passwordEncoder.encode(dto.getPassword());
		dto.setPassword(password);
		dto.setRole("ROLE_USER");
		
		int result = userRepository.createUser(dto.toEntity());
		log.info("result = {}", result);
		
		long u_id = userRepository.selectUserByLoginId(dto.getLoginId()).getId();
		userRepository.createUserBasket(u_id);
		
		return result;
	}
	
	// 회원 정보 업데이트하는 메서드
	public int updateUserInfo(UserUpdateDto dto, String loginId) {
		log.info("updateUserInfo({})", dto);
		
		String password = passwordEncoder.encode(dto.getPassword());
		dto.setPassword(password);
		
		User user = dto.toEntity();
		user.setLogin_id(loginId);
		
		return userRepository.updateUser(user);
	}
	
	// 비밀번호 업데이트하는 메서드
	public int updatePassword(String loginId, String password) {
		password = passwordEncoder.encode(password);
		
		return userRepository.updatePassword(loginId, password);
	}
	
	// 사용자 탈퇴 메서드
	public int deleteUser(long u_id) {
		log.info("deleteUser({})", u_id);
		
		// 유저 장바구니 삭제
		long b_id = userRepository.selectBasketByUserId(u_id);
		userRepository.deleteBasketProductsByBasketId(b_id);
		userRepository.deleteBasketByUserId(u_id);
		
		// 주문, 배송 기록 삭제
		List<Long> orderIds = userRepository.selectOrderByUserId(u_id);
		for(long o_id : orderIds) {
			userRepository.deletePaymentsByOrderId(o_id);
			userRepository.deleteDeliveriesByOrderId(o_id);
			userRepository.deleteOrderProductsByOrderId(o_id);
		}
		userRepository.deleteOrdersByUserId(u_id);
		
		// 문의, 리뷰 삭제
		userRepository.deleteQuestionsByUserId(u_id);
		userRepository.deleteReviewsByUserId(u_id);
		
		// USERS 테이블에서 user 삭제
		return userRepository.deleteUserById(u_id);
	}

}
