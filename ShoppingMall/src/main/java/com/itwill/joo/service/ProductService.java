package com.itwill.joo.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.itwill.joo.domain.Product;
import com.itwill.joo.dto.product.AdminProductPageDto;
import com.itwill.joo.dto.product.ProductCreateDto;
import com.itwill.joo.dto.product.ProductDto;
import com.itwill.joo.dto.product.ProductListPageDto;
import com.itwill.joo.dto.product.ProductSearchDto;
import com.itwill.joo.dto.product.ProductUpdateDto;
import com.itwill.joo.repository.ProductRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
/**
 * ProductService 클래스 작성
 * @author 김세엽
 *
 */
public class ProductService {

	private final ProductRepository productRepository;
	
	/**
	 * (모든상품/유저)상품리스트 페이지 보여주기 위한 리스트 입니다.
	 * @return List<ProductListPageDto>
	 */
	public List<ProductListPageDto> showAllProductsList(){
		List<Product> list = productRepository.selectByNew();
		List<ProductListPageDto> result = new ArrayList<>();
		for (Product p: list) {
			result.add(ProductListPageDto.fromEntity(p));
		}
		return result;
	}
	/**
	 * (모든상품/관리자)상품리스트 페이지 보여주기 위한 리스트 입니다.
	 * @return List<AdminProductPageDto>
	 */
	public List<AdminProductPageDto> showAllAdminProductsList(){
		List<AdminProductPageDto> result = new ArrayList<>();
		List<Product> pList = productRepository.selectOrderByModifiedTime();
		
		log.info("list = {}", pList);
		
		for(Product p : pList) {
			result.add(AdminProductPageDto.fromEntity(p));
		}
		return result;
	}
	
	/**
	 * (신상품/유저)상품리스트 페이지 보여주기 위한 리스트 입니다.
	 * @return List<ProductListPageDto>
	 */
	public List<ProductListPageDto> showNewProductsLsit(){
		List<ProductListPageDto> result = new ArrayList<>();
		List<Product> pList = productRepository.selectOrderByCreatedTimeDesc();
		for(Product p : pList) {
			result.add(ProductListPageDto.fromEntity(p));
		}
		return result;
		
	}
	
	/**
	 * (인기상품/유저)상품리스트 페이지 보여주기 위한 리스트 입니다.
	 * @return List<ProductListPageDto>
	 */
	public List<ProductListPageDto> showHotProductsLsit(){
		List<ProductListPageDto> result = new ArrayList<>();
		List<Product> pList = productRepository.selectOrderByPsodDesc();
		for(Product p : pList) {
			result.add(ProductListPageDto.fromEntity(p));
		}
		return result;
	}
	
	/**
	 * 상품 추가(사진없이)
	 * @param ProductCreateDto dto
	 * @return 추가된 행의 갯수 성공:1/실패:0
	 */
	public int createProductWithOutImage(ProductCreateDto dto) {
		int result = productRepository.insertNewProductWithOutImage(dto.toEntity());
		return result;
	}
	
	/**
	 * 상품 삭제
	 * @param long id
	 * @return 삭제된 행의 갯수 성공:1/실패:0
	 */
	public int deleteProduct(long id) {
		int result = productRepository.deleteProductWithId(id);
		return result;
	}
	
	/**
	 * 상품 수정
	 * @param ProductCreateDto dto
	 * @return 수정된 행의 갯수 성공:1/실패:0
	 */
	public int updateProduct(ProductUpdateDto dto) {
		int result = productRepository.updateProductWithProduct(dto.toEntity());
		return result;
	}
	
	/**
	 * 상품 하나 검색
	 * @param long id (상품 pk값)
	 * @return ProductCreateDto 객체
	 */
	public ProductCreateDto readOneProductByid(long id) {
		Product p = productRepository.selectById(id);
		return ProductCreateDto.fromEntity(p);
	}

	/**
	 * 상품 하나 검색
	 * @param long id (상품 pk값)
	 * @return ProductCreateDto 객체
	 */
	public ProductDto userReadOneProductByid(long id) {
		Product p = productRepository.selectById(id);
		return ProductDto.fromEntity(p);
	}
	
	/**
	 * 검색어에 해당하는 상품을 검색
	 * @param String search 검색한 값
	 * @return List<Product> 
	 */
	public List<ProductListPageDto> adminReadProductBySearch(String search){
		 List<Product> list = productRepository.selectBySearch(search);
			List<ProductListPageDto> result = new ArrayList<>();
			for (Product p: list) {
				result.add(ProductListPageDto.fromEntity(p));
			}
			return result;
		}
	/**
	 * 제고수가 없는 상품들을 검색
	 * @return List<ProductListPageDto>
	 */
	public List<ProductListPageDto> showNoPstockProductsList() {
		 List<Product> list = productRepository.selectThatNoPstock();
			List<ProductListPageDto> result = new ArrayList<>();
			for (Product p: list) {
				result.add(ProductListPageDto.fromEntity(p));
			}
			return result;
		}
	//------------------------- [유저] 상품 리스트 보여주기 --------------------------
	/**
	 * 신 상품 보여주기
	 * @return List<ProductListPageDto>
	 */
	public List<ProductListPageDto> showNewList() {
		List<Product> list = productRepository.selectByNew();
		List<ProductListPageDto> result = new ArrayList<>();
		for (Product p: list) {
			result.add(ProductListPageDto.fromEntity(p));
		}
		return result;
	}
	
	/**
	 * 인기 상품 보여주기
	 * @return List<ProductListPageDto>
	 */
	public List<ProductListPageDto> showHotList() {
		List<Product> list = productRepository.selectByHot();
		List<ProductListPageDto> result = new ArrayList<>();
		for (Product p: list) {
			result.add(ProductListPageDto.fromEntity(p));
		}
		return result;
	}
	
	/**
	 * 전통주 상품 보여주기
	 * @return List<ProductListPageDto>
	 */
	public List<ProductListPageDto> showOldList() {
		List<Product> list = productRepository.selectByOld();
		List<ProductListPageDto> result = new ArrayList<>();
		for (Product p: list) {
			result.add(ProductListPageDto.fromEntity(p));
		}
		return result;
	}
	
	/**
	 * 소주 상품 보여주기
	 * @return List<ProductListPageDto>
	 */
	public List<ProductListPageDto> showSojuList() {
		List<Product> list = productRepository.selectBySoju();
		List<ProductListPageDto> result = new ArrayList<>();
		for (Product p: list) {
			result.add(ProductListPageDto.fromEntity(p));
		}
		return result;
	}
	
	/**
	 * 맥주 상품 보여주기
	 * @return List<ProductListPageDto>
	 */
	public List<ProductListPageDto> showBearList() {
		List<Product> list = productRepository.selectByBear();
		List<ProductListPageDto> result = new ArrayList<>();
		for (Product p: list) {
			result.add(ProductListPageDto.fromEntity(p));
		}
		return result;
	}
	
	/**
	 * 와인 상품 보여주기
	 * @return List<ProductListPageDto>
	 */
	public List<ProductListPageDto> showWineList() {
		List<Product> list = productRepository.selectByWine();
		List<ProductListPageDto> result = new ArrayList<>();
		for (Product p: list) {
			result.add(ProductListPageDto.fromEntity(p));
		}
		return result;
	}
	
	/**
	 * 기타 상품 보여주기
	 * @return List<ProductListPageDto>
	 */
	public List<ProductListPageDto> showAnotherList() {
		List<Product> list = productRepository.selectByAnother();
		List<ProductListPageDto> result = new ArrayList<>();
		for (Product p: list) {
			result.add(ProductListPageDto.fromEntity(p));
		}
		return result;
	}
	/**
	 * 검색 상품 보여주기
	 * @param ProductSearchDto dto
	 * @return List<ProductListPageDto> 
	 */
	public List<ProductListPageDto> ReadProductBySearchDto(ProductSearchDto dto) {
		List<Product> list = productRepository.selectByUserSearch(dto);
		List<ProductListPageDto> result = new ArrayList<>();
		for (Product p: list) {
			result.add(ProductListPageDto.fromEntity(p));
		}
		return result;
	}
	
}