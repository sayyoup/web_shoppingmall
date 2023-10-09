package com.itwill.joo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwill.joo.domain.User;
import com.itwill.joo.dto.user.FindLoginIdDto;
import com.itwill.joo.dto.user.FindPasswordDto;
import com.itwill.joo.dto.user.UserAuthenticationDto;

public interface UserRepository {
	
	User selectUserByEmail(String email);
	
	User selectUserByLoginId(String login_id);
	
	String selectLoginIdByEmailAndName(FindLoginIdDto dto);

	int createUser(User user);
	
	int createUserBasket(long u_id);
	
	int createKakaoUser(User user);
	
	int updateUser(User user);
	
	int updatePassword(@Param("loginId") String loginId, @Param("password") String password);
	
	int deleteUserById(long id);

	// 채한별:
	// 유저 아이디로 찾기
    User selectUserById(long id);

	int selectByLoginIdAndEmail(FindPasswordDto dto);
	
	// 회원 탈퇴시 장바구니 기록 삭제하는 sql
	long selectBasketByUserId(long u_id);
	int deleteBasketByUserId(long u_id);
	int deleteBasketProductsByBasketId(long b_id);
	
	// 회원 탈퇴시 주문 관련 데이터를 삭제하는 sql
	List<Long> selectOrderByUserId(long u_id);
	int deleteOrderProductsByOrderId(long o_id);
	int deletePaymentsByOrderId(long o_id);
	int deleteDeliveriesByOrderId(long o_id);
	int deleteOrdersByUserId(long u_id);
	
	// 회원 탈퇴시 유저가 작성한 문의, 리뷰 삭제하는 sql
	int deleteQuestionsByUserId(long u_id);
	int deleteReviewsByUserId(long u_id);

}
