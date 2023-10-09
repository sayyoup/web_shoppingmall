package com.itwill.joo.interceptor;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.itwill.joo.service.BasketProductService;
import com.itwill.joo.service.UserService;

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {
	
	@Autowired
	private BasketProductService basketProductService;
	
	@Autowired
	private UserService userService;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		clearAuthenticationAttributes(request);
		
		List<String> roleNames = new ArrayList<>();
		
		authentication.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});
		
		HttpSession session = request.getSession();
		String login_id = request.getParameter("login_id");
		long userId = userService.getUserInfo(login_id).getId();
		session.setAttribute("login_id", login_id);
		session.setAttribute("basketCount", basketProductService.read(userId).size());
		
		if(roleNames.contains("ROLE_USER")) {
			response.sendRedirect("/joo");
			return;
		}
		
		response.sendRedirect("/joo/admin/adminMain");
	}
	
	// 이전에 로그인 실패한 이력이 있을 경우 session에 남아있는 실패 이력을 지움
	private void clearAuthenticationAttributes(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session != null) {
			session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
		}
	}
	
}
