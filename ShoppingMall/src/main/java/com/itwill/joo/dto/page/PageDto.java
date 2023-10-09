package com.itwill.joo.dto.page;

import org.springframework.stereotype.Component;

import com.itwill.joo.domain.Criteria;

import lombok.Data;

@Component
@Data
public class PageDto {

    private int pageCount;
    private int startPage;
    private int endPage;
    private int realEnd;
    private boolean prev, next;
    private int total; 
    private Criteria criteria;
    
    public PageDto() {}
    
    public PageDto(Criteria criteria, int total) {
        this.total = total;
        this.criteria = criteria;
        
        this.endPage = (int)(Math.ceil(criteria.getPageNum()/pageCount))*pageCount;
        this.startPage = endPage - (pageCount-1);
        
        realEnd = (int)(Math.ceil(criteria.getPageNum()*1.0/pageCount))*pageCount;
        
        if(endPage > realEnd) {
            endPage = realEnd == 0 ? 1: realEnd;
        }
        
        prev = startPage > 1;
        next = endPage < realEnd;
    }
    
}