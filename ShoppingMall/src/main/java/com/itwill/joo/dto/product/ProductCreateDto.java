package com.itwill.joo.dto.product;

import java.time.LocalDateTime;

import com.itwill.joo.domain.Product;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data 
@NoArgsConstructor 
@AllArgsConstructor
@Builder 
// 제품 생성 DTO
public class ProductCreateDto {

	private long id;
	private String pname; // 제품이름
	private String pcategory; // 제품카테고리
	private String pregion; // 원산지
	private String pvolume; // 용량
	private int pprice; // 가격
	private int palc; // 도수
	private int pstock; // 제고수
	private int pdiscount; // 할인
	
	private LocalDateTime pcreated_time;
	private LocalDateTime pmodified_time;
	
	public Product toEntity() {
		return Product.builder().id(id).pname(pname).pcategory(pcategory).pregion(pregion).pvolume(pvolume).pdiscount(pdiscount)
				.pprice(pprice).palc(palc).pstock(pstock).build();
	}
	
	public static ProductCreateDto fromEntity(Product p) {
		return ProductCreateDto.builder().id(p.getId()).pname(p.getPname())
				.pcategory(p.getPcategory()).pregion(p.getPregion())
				.pvolume(p.getPvolume()).pprice(p.getPprice())
				.palc(p.getPalc()).pstock(p.getPstock())
				.pdiscount(p.getPdiscount()).pcreated_time(p.getPcreated_Time().toLocalDateTime())
				.pmodified_time(p.getPmodified_Time().toLocalDateTime()).build();
	}
	
}
