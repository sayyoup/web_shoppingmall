package com.itwill.joo.dto.recommend;

import java.sql.Timestamp;

import com.itwill.joo.domain.Product;
import com.itwill.joo.dto.question.QuestionDetailDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@Builder
@Getter
@ToString
@Setter
public class RecommendDetailDto {

    private long id;
    private long u_id;
    private long p_id;
    
    private String login_id;
    private Product product;
    
}
