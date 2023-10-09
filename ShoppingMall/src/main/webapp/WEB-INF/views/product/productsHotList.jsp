<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1"> <!-- 부트스트랩 -->
		<title>JOO</title>
		<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
			crossorigin="anonymous">
	</head>
	<body>
		<div>
<header class="my-1 p-3 text-bg-dark">
            <div>
                <nav class="navbar navbar-expand-lg bg-secondary">
                    <div class="container-fluid">
                        <!-- 홈과 로고클릭시 메인페이지로 이동 -->
                        <a class="navbar-brand" href="/joo/">로고</a>
                        <button class="navbar-toggler" type="button"
                            data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent"
                            aria-expanded="false"
                            aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        
                        <div class="collapse navbar-collapse"
                            id="navbarSupportedContent">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                <li class="nav-item"><a
                                    class="nav-link active"
                                    aria-current="page" href="/joo/">Home</a>
                                </li>
                                
                                <!-- TODO : 로그인 회원가입 링크로 이동(로그인상태일때 비가시화) -->
                                <sec:authorize access="isAnonymous()">
                                    <li class="nav-item"><a
                                        class="nav-link" href="/joo/user/login">로그인</a></li>
                                    <li class="nav-item"><a
                                        class="nav-link" href="/joo/user/join">회원가입</a></li>
                                </sec:authorize>
                             
                                 <sec:authorize access="isAuthenticated()">
                                 <li class="nav-item"><a
                                        class="nav-link" href="/joo/user/logout">로그아웃</a></li>
                                 
                                 <li class="nav-item dropdown"><a
                                    class="nav-link dropdown-toggle"
                                    href="#" role="button"
                                    data-bs-toggle="dropdown"
                                    aria-expanded="false"> 마이페이지
                                </a>
                                    <ul class="dropdown-menu">
                                        <li><a
                                            class="dropdown-item"
                                            href="/joo/user/passwordAuthentication">개인정보 수정</a></li>
                                        <li><a
                                            class="dropdown-item"
                                            href="/joo/user/myGrade">적립금 확인</a></li>
                                        <li><a
                                            class="dropdown-item"
                                            href="/joo/user/myOrder">주문 내역</a></li>
                                        <li><a
                                            class="dropdown-item"
                                            href="/joo/questions/myQuestionsList">문의 내역</a></li>
                                        <hr class="dropdown-divider"></li>
                                        <li><a
                                            class="dropdown-item"
                                            href="/joo/user/myBasket">장바구니</a></li>
                                    </ul>
                                    </li>
                                 
                                
                                <!-- 최근본 상품은 모달로 처리 -->
                                
                                <li class="nav-item"><a class="nav-link" href="/joo/product/list">최근본상품</a></li>
                                <li class="nav-item"><a class="nav-link" href="/joo/questions/questionQnaList">문의하기</a></li>
                                </sec:authorize>
                            </ul>


  
                            <!-- 검색 페이지 -->
                            <form class="d-flex" role="search" action="/joo/product/productsList">
                                <input class="form-control me-2"
                                    type="search" placeholder="제품 검색"
                                    aria-label="Search" id="searchText">
                                <button class="btn btn-outline-success" type="submit">search</button>
                            </form>
                        </div>
                    </div>
                </nav>  
            </div>
            <h3 class="text-center">해더</h3>
            </header>
            <!-- 카테고리 네비 -->
            <ul class="nav nav-tabs">
    
                <li class="nav-item dropdown"><a
                    class="nav-link dropdown-toggle"
                    data-bs-toggle="dropdown" href="#" role="button"
                    aria-expanded="false">카테고리</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/joo/product/productsList">모아보기</a></li>
                        <li><a class="dropdown-item" href="/joo/product/productsList">소주</a></li>
                        <li><a class="dropdown-item" href="/joo/product/productsList">맥주</a></li>
                        <li><a class="dropdown-item" href="/joo/product/productsList">와인</a></li>
                        <li><a class="dropdown-item" href="/joo/product/productsList">양주</a></li>
                    </ul></li>
                <li class="nav-item"><a class="nav-link" href="/joo/product/productsNewList">신상</a>
                </li>
                <li class="nav-item"><a class="nav-link" href="/joo/product/productsHotList">랭킹</a></li>
                <li class="nav-item"><a class="nav-link" href="/joo/post/postList">공지사항/이벤트</a></li>
            </ul>
            
            <main  class="my-1 p-5 text-bg-dark">

                <div>
                    인기 순위 판매량/리뷰별점/리뷰갯수 버튼으로 구분
                </div>                

            <hr/>
                <div class="row row-cols-1 row-cols-md-5 g-4">
                
                    <c:forEach items="${ products }" var="p">
                        <div class="col">
                            <div class="card my-3 p-3"
                                style="width: 18rem; cursor: pointer;"
                                OnClick="location.href ='/joo/product/productDetail?p_id=${ p.p_id }'">
    
                                <img src="${ p.ptitle_image }"
                                    class="card-img-top" alt="oneProduct">
    
                                <div class="card-body">
                                    <h5 class="card-title">${ p.pname }</h5>
                                    <p class="card-text">
    
                                        <!-- 랜덤값 넣기 -->
                                        <del>${ p.pprice } 할인전 가격</del>
                                    </p>
                                    <p class="card-text">${ p.pprice }
                                        판매 가격</p>
    
                                    <!-- 제고수에 따라 sold out, order now 구분 -->
                                    <c:if test="${ p.pstock eq 0 }">
                                        <a
                                            href="/joo/product/productDetail?id=${ p.p_id }"
                                            class="btn btn-outline-danger col-12 mx-auto">sold
                                            out</a>
                                    </c:if>
    
                                    <c:if test="${ p.pstock ne 0 }">
                                        <a
                                            href="/joo/product/productDetail?id=${ p.p_id }"
                                            class="btn btn-outline-primary col-12 mx-auto">order
                                            now</a>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>


            
                <h1>메인</h1>
            </main>
            
            <footer class="my-1 p-3 text-bg-dark">
            <!-- 기업정보, 홈 인스타, 페이스북, 등등 필한거 -->
                <h1 class="text-center">풋터</h1>
            
                <a href="">home</a>
            </footer>
			
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
			crossorigin="anonymous"></script>
		</div>
	</body>
</html>