package com.itwill.joo.dto.user;

import java.time.LocalDateTime;

import com.itwill.joo.domain.Product;
import com.itwill.joo.domain.User;
import com.itwill.joo.dto.product.ProductListPageDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AdminReadAllUserListDto {
	
	private long id;
	private String login_id;
	private String uname;
	private String uemail;
	private String uphone;
	private String ugrade;
	private long ucurrent_point;
	private LocalDateTime created_time;
	
	public static AdminReadAllUserListDto fromEntity(User entity) {
		
		return AdminReadAllUserListDto.builder().id(entity.getId()).login_id(entity.getLogin_id()).uname(entity.getUname())
				.uemail(entity.getUemail()).uphone(entity.getUphone()).ugrade(entity.getUgrade()).ucurrent_point(entity.getUcurrent_point())
				.created_time(entity.getCreated_time()).build();
	}

	
	
}
