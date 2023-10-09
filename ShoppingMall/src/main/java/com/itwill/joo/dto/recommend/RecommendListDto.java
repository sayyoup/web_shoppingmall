package com.itwill.joo.dto.recommend;

import java.sql.Timestamp;

import com.itwill.joo.domain.Product;
import com.itwill.joo.domain.Recommend;
import com.itwill.joo.dto.question.QuestionsListDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@Builder
@Getter
@Setter
@ToString
public class RecommendListDto {

    private long id;
    
    private long u_id;
    private long p_id;
    private String login_id;
    
    private Product product;
    
    public static RecommendListDto fromEntity(Recommend entity) {
        return RecommendListDto.builder()
                .id(entity.getId())
                .u_id(entity.getU_id())
                .p_id(entity.getP_id())
                .build();
    }
    
}
