package com.itwill.joo.dto.recommend;

import com.itwill.joo.domain.Recommend;
import com.itwill.joo.dto.question.QuestionCreateDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data // Getter, Setter, toString, equals, hashCode
@NoArgsConstructor // 기본 생성자
@AllArgsConstructor // 모든 필드를 아규먼트로 갖는 생성자
@Builder
public class RecommendDto {
    
    private long u_id; // 유저 번호
    private long p_id; // 상품 번호
    
   public Recommend toEntity() {
       return Recommend.builder()
               .u_id(u_id)
               .p_id(p_id)
               .build();
   }
    
    
}
