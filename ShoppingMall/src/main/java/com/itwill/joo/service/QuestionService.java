package com.itwill.joo.service;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.joo.dto.question.QuestionDetailDto;
import com.itwill.joo.dto.question.QuestionUpdateDto;
import com.itwill.joo.domain.Criteria;
import com.itwill.joo.domain.Product;
import com.itwill.joo.domain.Question;
import com.itwill.joo.domain.User;
import com.itwill.joo.dto.question.QuestionAdminListDto;
import com.itwill.joo.dto.question.QuestionAnsweredUpdateDto;
import com.itwill.joo.dto.question.QuestionCreateDto;
import com.itwill.joo.dto.question.QuestionsListDto;
import com.itwill.joo.repository.ProductRepository;
import com.itwill.joo.repository.QuestionRepository;
import com.itwill.joo.repository.UserRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service // -> 스프링 컨테이너에서 서비스 컴포넌트 객체를 생성하고 관리(필요한 곳에 주입).
@RequiredArgsConstructor // 2. (2) final로 선언된 필드를 초기화하는 생성자를 자동으로 만들어줌.@Slf4j
@Slf4j
public class QuestionService {

    // 생성자에 의한 의존성 주입
    private final UserRepository userRepository;
    private final QuestionRepository questionRepository;
    private final ProductRepository productRepository;
    
    // 상품 Service

    // 개인 문의 조회
    public List<QuestionsListDto> selectByUserId(long u_id) {
        log.info("selectByUserId({})", u_id);
        
        List<Question> list = questionRepository.selectByUserId(u_id);
        List<QuestionsListDto> questions = new ArrayList<>();
        for(Question q : list) {
            Product product = questionRepository.selectProductById(q.getP_id());
            QuestionsListDto dto = QuestionsListDto.fromEntity(q);
            dto.setProduct(product);
            questions.add(dto);
            
            log.info("dto = {}", dto);
        }
        return questions;
    }
    // 개인 문의 조회 (페이징)
    public List<QuestionDetailDto> selectByUserIdWithPaging(long u_id, Criteria cri) {
        log.info("selectByUserIdWithPaging({}, {})", u_id, cri);
        
        List<Question> question = questionRepository.selectByUserIdWithPaging(u_id, cri);
        log.info("selectByUserIdWithPaging(question={})", question);
        
        return question.stream().map(QuestionDetailDto::fromEntity).toList();
    }
    
    
    // 상품 문의 목록
    public List<QuestionsListDto> readProductId(long p_id) {
        log.info("read()");
        
        
        // p_id를 아규먼트로 받아야한다!!!!!!!!
        List<Question> list = questionRepository.selectWhereTypeProduct(p_id);
        
        List<QuestionsListDto> questions = new ArrayList<>();
        
        for(Question q : list) {
            long userId = q.getU_id();
            long productId = q.getP_id();
            User user = userRepository.selectUserById(userId);
            Product product = questionRepository.selectProductById(productId);
            String login_id =  user.getLogin_id();
        
            QuestionsListDto dto = QuestionsListDto.fromEntity(q);
            dto.setLogin_id(login_id);
            dto.setProduct(product);
            log.info("dto={}", dto);
            questions.add(dto);
            
        }
//        return list.stream().map(QuestionsListDto::fromEntity).toList();
		return questions;
	}

	// 상품 문의 상세보기
	public QuestionDetailDto read(long id) {
		log.info("read(id)");

		Question entity = questionRepository.selectById(id);
		QuestionDetailDto dto = QuestionDetailDto.fromEntity(entity);

		User user = userRepository.selectUserById(dto.getU_id());
		dto.setLogin_id(user.getLogin_id());

		Product product = questionRepository.selectProductById(entity.getP_id());
		dto.setProduct(product);

		return dto;
	}

	// 상품문의 총 개수
	public int getTotalProductQuestion(Criteria cri) {
		return questionRepository.totalSelectQuestionTypeProduct(cri);
	}

	// 고객문의 총 개수
	public int getTotalQnaQuestion(Criteria cri) {
		return questionRepository.totalSelectWhereTypeQnA(cri);
	}

	// 상품 문의 전체보기
	public List<QuestionsListDto> readAll() {
		log.info("readAll() ");
		List<Question> list = questionRepository.selectOrderByDesc();
		List<QuestionsListDto> result = new ArrayList<>();
		for(Question q: list) {
			result.add(QuestionsListDto.fromEntity(q));
		}
		return result;
	}

	// 상품 문의 작성
	public int create(QuestionCreateDto dto) {
		log.info("create(question)", dto);

		return questionRepository.insert(dto.toEntity());
	}

	// 상품 문의 수정
	public int update(QuestionUpdateDto dto, Long id) {
		log.info("update(question)", dto, id);

		return questionRepository.updateTitleAndContent(dto.toEntity());
	}

	// 상품 문의 삭제
	public int delete(long id) {
		log.info("delete(id)", id);

		return questionRepository.deleteById(id);

	}

	// QNA service

	// Qna 목록
	public List<QuestionsListDto> readQna() {
		log.info("read()");

		List<Question> list = questionRepository.selectWhereTypeQnA();
		List<QuestionsListDto> questions = new ArrayList<>();

		for (Question q : list) {
			long userId = q.getU_id();
			User user = userRepository.selectUserById(userId);
			String login_id = user.getLogin_id();

			QuestionsListDto dto = QuestionsListDto.fromEntity(q);
			dto.setLogin_id(login_id);
			questions.add(dto);

		}
		return questions;
	}

	// 고객 문의 상세보기
	public QuestionDetailDto readQna(long id) {
		log.info("read(id)");

		Question entity = questionRepository.selectById(id);
		QuestionDetailDto dto = QuestionDetailDto.fromEntity(entity);

		User user = userRepository.selectUserById(dto.getU_id());
		dto.setLogin_id(user.getLogin_id());

		Product product = questionRepository.selectProductById(entity.getP_id());
		dto.setProduct(product);

		return dto;
	}

	// 고객 문의 작성
	public int createQna(QuestionCreateDto dto) {
		log.info("createQna(question)", dto);

		return questionRepository.insert(dto.toEntity());
	}

	// 고객 문의 수정
	public int updateQna(QuestionUpdateDto dto) {
		log.info("updateQna(question)", dto);

		return questionRepository.updateTitleAndContent(dto.toEntity());
	}

	// 고객 문의 삭제
	public int deleteQna(long id) {
		log.info("deleteQna(id)", id);

		return questionRepository.deleteById(id);

	}

	public List<Product> getProductList() {
		log.info("getProductList()");
		return questionRepository.selectAllProducts();
	}

	public Product getProduct(Long id) {
		log.info("getProduct({})", id);
		return questionRepository.selectProductById(id);
	}


	// 세엽
	// 유저 아이디 대신 이름으로 검색
	public List<QuestionAdminListDto> readWithUsersName() {
		return questionRepository.selectWithUsersNameList();
	}

	// 유저 아이디 대신 이름으로 검색
	public List<QuestionAdminListDto> selectNoAnsweredFirst() {
		return questionRepository.selectNoAnsweredFirst();
	}
	
	public QuestionAdminListDto readWithName(long id) {
		return questionRepository.selectWithUsersNameOne(id);
	}

	public int answere(QuestionAnsweredUpdateDto dto) {

		return questionRepository.updateAnswered(dto.toEntity());
	}

}
