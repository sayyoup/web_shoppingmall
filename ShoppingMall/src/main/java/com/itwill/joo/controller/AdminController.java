package com.itwill.joo.controller;

import java.util.Random;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.joo.dto.board.BoardCreateDto;
import com.itwill.joo.dto.board.BoardDetailDto;
import com.itwill.joo.dto.board.BoardUpdateDto;
import com.itwill.joo.dto.product.ProductBasicSetting;
import com.itwill.joo.dto.product.ProductCreateDto;
import com.itwill.joo.service.BoardService;
import com.itwill.joo.service.ProductService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor // 생성자 자동 생성
@RequestMapping("/admin")
@Controller
public class AdminController {

	private Random ra = new Random();
	private final BoardService boardService;
	private final ProductService productService;

	@GetMapping("/adminMain")
	public void AdmainMain() {
		log.info("AdmainMain()");
	}

	@GetMapping("/adminNewProductBasic")
	public void adminNewProductBasic() {
		log.info("새상품등록페이지이동");
	}

	@GetMapping("/adminNewProductImage")
	public void adminNewProductImage(@ModelAttribute("product") ProductBasicSetting productBasicSetting, Model model) {

		model.addAttribute("product", productBasicSetting);

	}

	@PostMapping("/adminCreateProduct")
	public String adminCreateProduct(ProductCreateDto dto) {

		log.info("타이틀 이미지 주소 = {}", dto.getPname());
		// 할인률이 0일때 랜덤값 처리
		if (dto.getPdiscount() == 0) {
			int randomDiscount = ra.nextInt(20) + 5;
			log.info("랜덤값 설정 ! = {}",randomDiscount);
			dto.setPdiscount(randomDiscount);
		}

		log.info("새상품 등록");
		// db에 상품추가(이미지들이 null값일때는, 자동으로 기본값으로 세팅)
		productService.createProductWithOutImage(dto);
		return "redirect:/admin/adminMain";

	}

	@GetMapping("/postModify")
	public void postModify(Long id, Model model) {

		BoardDetailDto dto = boardService.read(id);

		model.addAttribute("board", dto);

	}

	@GetMapping("/postCreate")
	public void insert() {
		log.info("GET: create()");
	}

	@PostMapping("/postCreate")
	public String insert(BoardCreateDto dto) {

		log.info("POST: insert({})", dto);

		int result = boardService.insert(dto);
		log.info("result = {}", result);

		return "redirect:/post/postList";

	}

	@PostMapping("/update")
	public String update(BoardUpdateDto dto, Long id) {
		log.info("update(dto={})", dto);

		int result = boardService.update(dto);
		log.info("업데이트 결과 = {}", result);

		return "redirect:/post/postList";
	}

	@PostMapping("/delete")
	public String delete(Long id) {

		int result = boardService.delete(id);

		return "redirect:/post/postList";
	}

}