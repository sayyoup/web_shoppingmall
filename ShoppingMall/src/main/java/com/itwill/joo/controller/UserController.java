package com.itwill.joo.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwill.joo.dto.review.ReviewListDto;
import com.itwill.joo.dto.user.FindLoginIdDto;
import com.itwill.joo.dto.user.FindPasswordDto;
import com.itwill.joo.dto.user.UserAuthenticationDto;
import com.itwill.joo.dto.user.UserCreateDto;
import com.itwill.joo.dto.user.UserDetailDto;
import com.itwill.joo.dto.user.UserUpdateDto;
import com.itwill.joo.service.MailService;
import com.itwill.joo.service.ReviewService;
import com.itwill.joo.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {
	
	private final ReviewService reviewService;
	private final UserService userService;
	
	@GetMapping("/login")
	public String loginPage(@RequestParam(name = "errorMessage", required = false) String errorMessage, Model model) {
		model.addAttribute("errorMessage", errorMessage);
		return "user/login";
	}
	
	@GetMapping("/join")
	public String joinPage(UserCreateDto dto, Model model) {
		log.info("join()");
		
		model.addAttribute("dto", dto);
		
		return "user/join";
	}
	
	@PostMapping("/join")
	public String join(UserCreateDto dto, BindingResult bindingResult, Model model) {
		log.info("join({})", dto);
		
		if(bindingResult.hasErrors()) {
			model.addAttribute("dto", dto);
			return "user/join";
		}
		
		int result = userService.create(dto);
		log.info("result = {}", result);
		
		return "redirect:/";
	}
	
	@GetMapping("/findId")
	public String findId() {
		return "user/findId";
	}
	
	@PostMapping("/findId")
	@ResponseBody
	public String findId(@RequestBody FindLoginIdDto dto) {
		log.info("findId({})", dto);
		
		String loginId = userService.getLoginId(dto);
		log.info("loginId = {}", loginId);
		
		return loginId;
	}
	
	@GetMapping("/findPassword")
	public String findPassword() {
		return "user/findPassword";
	}
	
	@PostMapping("/findPassword")
	@ResponseBody
	public int sendPassword(@RequestBody FindPasswordDto dto) {
		log.info("findPassword({})", dto);
		
		int count = userService.isUserExisting(dto);
		if(count == 0) {
			return 0;
		}
		
		String code = MailService.generateTemporaryPassword();
		MailService.sendTemporaryPassword(dto.getEmail(), code);
		log.info("code = {}", code);
		
		log.info("updatePassword({}, {})", dto.getLoginId(), code);
		int result = userService.updatePassword(dto.getLoginId(), code);
		
		return result;
	}
	
	@GetMapping("/passwordAuthentication")
	public String passwordAuthentication(Principal principal, Model model) {
		model.addAttribute("loginId", principal.getName());
		
		return "user/passwordAuthentication";
	}
	
	@PostMapping("/passwordAuthentication")
	@ResponseBody
	public int passwordAuthentication(@RequestBody UserAuthenticationDto dto, RedirectAttributes rttr) {
		log.info("passwordAuthentication({})", dto);

		int result = userService.selectByLoginIdAndPassword(dto);
		log.info("result = {}", result);
		
		return result;
	}
	
	@GetMapping("/myDetails")
	public String userDetails(Principal principal, Model model) {
		UserDetailDto dto = userService.getUserInfo(principal.getName());
		model.addAttribute("user", dto);
		
		return "user/details";
	}
	
	@GetMapping("/myGrade")
	public String userGrade(Principal principal, Model model) {
		UserDetailDto dto = userService.getUserInfo(principal.getName());
		model.addAttribute("user", dto);
		
		return "user/myGrade";
	}
	
	@GetMapping("/myReviews")
	public String myReviews(Principal principal, Model model) {
		long uid = userService.getUserInfo(principal.getName()).getId();
		
		List<ReviewListDto> reviews = reviewService.selectReviewsByUid(uid);
		model.addAttribute("reviews", reviews);
		
		return "user/reviews";
	}
	
	@PostMapping("/modify")
	@ResponseBody
	public int modifyUserInfo(@RequestBody UserUpdateDto dto, Principal principal) {
		log.info("modifyUserInfo({})", dto);
		
		int result = userService.updateUserInfo(dto, principal.getName());
		log.info("result = {}", result);
		
		return result;
	}
	
	@GetMapping("/withdrawal")
	public String deletePage(Principal principal, Model model) {
		log.info("deletePage()");
		
		UserDetailDto dto = userService.getUserInfo(principal.getName());
		model.addAttribute("user", dto);
		
		return "user/delete";
	}
	
	@PostMapping("/delete")
	@ResponseBody
	public int delete(@RequestParam("id") long id) {
		log.info("delete({})" ,id);
		
		int result = userService.deleteUser(id);
		log.info("result = {}", result);
		
		return result;
	}
	
	@PostMapping("/logout")
	public void logout() {
		
	}

}
