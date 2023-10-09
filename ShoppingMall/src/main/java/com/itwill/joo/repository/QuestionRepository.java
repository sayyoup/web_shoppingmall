package com.itwill.joo.repository;

import java.util.List;

import org.springframework.web.bind.annotation.PathVariable;

import com.itwill.joo.domain.Criteria;
import com.itwill.joo.domain.Product;
import com.itwill.joo.domain.Question;
import com.itwill.joo.dto.question.QuestionAdminListDto;
import com.itwill.joo.dto.question.QuestionsListDto;

//application-context.xml에서 scan하는 패키지에 있기 때문에
//인터페이스를 구현하는 클래스가 MyBatis에 의해서 자동으로 만들어짐.
//question-mapper.xml 파일에서 설정된 id와 메서드 이름이 같으면
//해당 아이디의 SQL 문장을 실행하는 구현 메서드를 만들어줌.
public interface QuestionRepository {

  // 상품문의
    
  // 문의 작성 
  int insert(Question question);
  
  // 문의 목록 조회
  List<Question> selectOrderByDesc();
  
  // 상세 문의 조회
  Question selectById(long id);
  //List<Question> selectById(long id);
  
  // 문의 수정
  int updateTitleAndContent(Question question);
  
  // 문의 삭제
  int deleteById(long id);
  
  // 유저 번호를 통한 문의 조회(자기 문의 조회)
   List<Question> selectByUserId(long u_id);
   // 유저 번호를 통한 문의 조회(자기 문의 조회) + 페이징
   List<Question> selectByUserIdWithPaging(long u_id, Criteria cri);
 
  // 상품 문의 조회 -일단 보류 
  //List<Question> selectWhereTypeProductWithPaging(long p_id, Criteria criteria);
  
  List<Question> selectWhereTypeProduct(long p_id);
  
  // QNA 문의 조회
  List<Question> selectWhereTypeQnA();
  
  // 개별 상품 총 수
  int totalSelectQuestionTypeProduct(Criteria cri);
  
  // 전체 QNA 수
  int totalSelectWhereTypeQnA(Criteria cri);
  
  // 전체 문의 수 
 int totalSelectQuestions(Criteria cri);
  
  // 상품 전체 조회
  List<Product> selectAllProducts();
  
  //상품 아이디 통한 상세 조회
  Product selectProductById(long id);

	// ====================================================================== //
	// 세엽
	List<QuestionAdminListDto> selectWithUsersNameList();

	// id로 검색시 문의를 남긴 유저의 이름과 같이 반환(QuestionAdminListDto 타입객체)
	QuestionAdminListDto selectWithUsersNameOne(long id);

	// 문의 리스트 1. 미답변 우선, 2. 오래된 순서로 리스트 반환
	List<QuestionAdminListDto> selectNoAnsweredFirst();

	// 업데이트
	int updateAnswered(Question entity);

}