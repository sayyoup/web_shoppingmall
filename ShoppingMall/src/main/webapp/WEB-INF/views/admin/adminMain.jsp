<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1"> <!-- 부트스트랩 -->
		<title>JOO</title>

	</head>
          <jsp:include page="../common/adminHeader.jsp"></jsp:include>    
	<body>
		<div>
			<h1>관리자 페이지</h1>
            <hr/>
                <select id="menu" class="form-select form-select-lg mb-3"
                    aria-label=".form-select-lg example">
                    <option selected>관리자 기능을 선택하시오</option>
                    <option value="product">상품관리</option>
                    <option value="user">유저관리</option>
                    <option value="quseries">문의관리</option>
                    <option value="review">리뷰관리</option>
                    <option value="post">게시글 관리</option>
                </select>
                
                <!-- 선택지에 따라서 하단에 리스트 표시 -->
                <!-- 클릭이 되었을때, 레스트컨트롤러로 해당 db에서 값을 읽어온다. -->
                <!-- div를 하나만 설정하고, 그 id를 받아서 해당값 innerhtml을 변경시킨다. -->
                
                <div id ="selectedContens"></div>
                
                <!-- 상품 수정위한 모달 -->
                <div class="modal fade" id="productUpdateModal" 
                    data-bs-backdrop="static" data-bs-keyboard="false"
                    tabindex="-1" >
                    <div class="modal-dialog">
                        <div class="modal-content">
                        
                            <div class="modal-header">
                                <h1 class="modal-title fs-5"
                                    id="staticBackdropLabel">수정하기</h1>
                                <button type="button" class="btn-close"
                                    data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                
                                    <input id="PUMp_id" class="d-none"/>
                                <!-- 내용 체울 부분 -->
                                <div class="mb-3" >                                
                                    <label for="PUMpname" class="form-label">
                                    상품이름 : 
                                    </label>
                                    <input type="text" id="PUMpname" class="form-control" autofocus required placeholder="수정할 상품 이름을 입력하세요"/>
                                </div>
                                
                                <div class="mb-3" >                                
                                    <label for="PUMpprice" class="form-label">
                                        상품 가격 : 
                                    </label>
                                    <input type="number" id="PUMpprice" class="form-control" required placeholder="수정할 상품 가격을 입력하세요"/>
                                </div>
                                
                                <div class="mb-3" >                                
                                    <label for="PUMpdiscound" class="form-label">
                                        상품 할인율 : 
                                    </label>
                                    <input type="number" id="PUMpdiscound" class="form-control" required placeholder="수정할 상품 할인율 입력하세요"/>
                                </div>
                                
                                <div class="mb-3" >                                
                                    <label for="PUMpstock" class="form-label">
                                        상품 제고수 : 
                                    </label>
                                    <input type="number" id="PUMpstock" class="form-control" required placeholder="수정할 상품 제고수를 입력하세요"/>
                                </div>
                            
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary"
                                    data-bs-dismiss="modal">취소</button>
                                <button type="button" class="btn btn-primary" id="btnProductUpdate">수정완료</button>
                            </div>
                            
                        </div>
                    </div>
                </div>
                
                <!-- 문의 수정(답변)위한 모달 -->
                <div class="modal fade" id="questionUpdateModal" 
                    data-bs-backdrop="static" data-bs-keyboard="false"
                    tabindex="-1" >
                    <div class="modal-dialog">
                        <div class="modal-content">
                        
                            <div class="modal-header">
                                <h1 class="modal-title fs-5"
                                    id="staticBackdropLabel">답변하기</h1>
                                <button type="button" class="btn-close"
                                    data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <input id="QUMq_id" type="number" class="d-none"/>
                                
                                <!-- 내용 체울 부분 -->
                                <div class="row">
                                    <div class="col">
                                        작성자 : <input type="text" readonly id="QUMqname" class="form-control"/>
                                    </div>
                                    <div class="col">
                                    타입 : <input type="text" readonly id="QUMtype" class="form-control"/>
                                    </div>
                                </div>
                                
                                <div class="mb-3" >                                
                                    <label for="QUMqtitle" class="form-label">
                                    제목 : 
                                    </label>
                                    <input type="text" id="QUMqtitle" class="form-control" required readonly />
                                </div>
                                
                                <div class="mb-3" >                                
                                    <label for="QUMqcontent" class="form-label">
                                    문의내용 : 
                                    </label>
                                    <input type="text" id="QUMqcontent" class="form-control" required readonly />
                                </div>
                                
                                <div class="mb-3" >                                
                                    <label for="QUMis_answered" class="form-label">
                                        답변 : 
                                    </label>
                                    <input type="text" id="QUMis_answered" class="form-control" autofocus required placeholder="문의 내용에 관한 답변을 해주세요"/>
                                </div>
                            
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary"
                                    data-bs-dismiss="modal">취소</button>
                                <button type="button" class="btn btn-primary" id="btnQuestionUpdate">답변완료</button>
                            </div>
                            
                        </div>
                    </div>
                </div>
                
                <!-- 리뷰 문의 -->
                <div class="modal fade" id="reviewUpdateModal" 
                    data-bs-backdrop="static" data-bs-keyboard="false"
                    tabindex="-1" >
                    <div class="modal-dialog">
                        <div class="modal-content">
                        
                            <div class="modal-header">
                                <h1 class="modal-title fs-5"
                                    id="staticBackdropLabel">답변하기</h1>
                                <button type="button" class="btn-close"
                                    data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <input id="reviewr_id" type="number" class="d-none"/>
                                
                                <!-- 내용 체울 부분 -->
                                <div class="row">
                                    <div class="col">
                                        작성자 아이디 : <input type="text" readonly id="reviewrname" class="form-control"/>
                                    </div>
                                </div>
                                
                                <div class="mb-3" >                                
                                    <label for="reviewrcontent" class="form-label">
                                    문의내용 : 
                                    </label>
                                    <input type="text" id="reviewrcontent" class="form-control" required readonly />
                                </div>
                                
                                <div class="mb-3" >                                
                                    <label for="reviewis_answered" class="form-label">
                                        답변 : 
                                    </label>
                                    <input type="text" id="reviewis_answered" class="form-control" autofocus required placeholder="문의 내용에 관한 답변을 해주세요"/>
                                </div>
                            
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary"
                                    data-bs-dismiss="modal">취소</button>
                                <button type="button" class="btn btn-primary" id="btnReviewUpdate">답변완료</button>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- 게시판 -->
                <div class="modal fade" id="postUpdateModal" 
                    data-bs-backdrop="static" data-bs-keyboard="false"
                    tabindex="-1" >
                    <div class="modal-dialog">
                        <div class="modal-content">
                        
                            <div class="modal-header">
                                <h1 class="modal-title fs-5"
                                    id="staticBackdropLabel">수정하기</h1>
                                <button type="button" class="btn-close"
                                    data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                
                                    <input id="post_id" class="d-none"/>
                                <!-- 내용 체울 부분 -->
                                <div class="mb-3" >                                
                                    <label for="postTitle" class="form-label">
                                    제목 : 
                                    </label>
                                    <input type="text" id="postTitle" class="form-control" autofocus required placeholder="수정할 상품 이름을 입력하세요"/>
                                </div>
                                
                                <div class="mb-3" >                                
                                    <label for="postType" class="form-label">
                                        타입 : 
                                    </label>
                                    <input type="text" id="postType" class="form-control"  readonly/>
                                </div>
                                
                                <div class="mb-3" >                                
                                    <label for="postContent" class="form-label">
                                        내용 : 
                                    </label>
                                    <input type="text" id="postContent" class="form-control" required placeholder="수정할 내용 입력하세요"/>
                                </div>
                            
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary"
                                    data-bs-dismiss="modal">취소</button>
                                <button type="button" class="btn btn-primary" id="btnPostUpdate">수정완료</button>
                            </div>
                            
                        </div>
                    </div>
                </div>
                
            
            <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
 
    		<script src="../static/js/adminPage/productModify.js"></script>
		</div>
	</body>
</html>