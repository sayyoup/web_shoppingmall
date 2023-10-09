<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
    uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>header</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
    crossorigin="anonymous">
     <link href="${pageContext.request.contextPath}/static/css/common/header.css" rel="stylesheet">
    </head>
<body>

        <header class="navbar navbar-dark fixed-top" style="background-color: #343A40;">
  <div class="container-fluid">
    <div class="row">
      <div class="col-2">
        <a class="navbar-brand" href="/joo/">
          <img src="${pageContext.request.contextPath}/static/images/logoJooMain.png" alt="로고" style="width: 40%; height: auto;">
        </a>
      </div>
      <div class="col-8 text-center">
        <a class="navbar-brand" href="/joo/">
          <img src="${pageContext.request.contextPath}/static/images/logoJooMainBanner.gif" alt="로고2" style="width: 86%; height: auto;">
        </a>
      </div>
      <div class="col-2 d-flex justify-content-end">
        <button class="navbar-toggler p-2" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar"
          aria-controls="offcanvasDarkNavbar" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon icon-green" style="color: green;"></span>
        </button>

                <div class="offcanvas offcanvas-end text-bg-dark"
                    tabindex="-1" id="offcanvasDarkNavbar"
                    aria-labelledby="offcanvasDarkNavbarLabel">
                    <div class="offcanvas-header">
                        <h5 class="offcanvas-title"
                            id="offcanvasDarkNavbarLabel">✋ Hello, Human</h5>
                        <button type="button"
                            class="btn-close btn-close-white"
                            data-bs-dismiss="offcanvas"
                            aria-label="Close"></button>
                    </div>
                    <div class="offcanvas-body">
                        <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                            <sec:authorize access="isAnonymous()">
                                <li class="nav-item"><a
                                    class="nav-link active"
                                    aria-current="page"
                                    href="/joo/user/login">로그인</a></li>
                                <li class="nav-item"><a
                                    class="nav-link active"
                                    aria-current="page"
                                    href="/joo/user/join">회원가입</a></li>
                            </sec:authorize>

                            <sec:authorize access="isAuthenticated()">
                                <li class="nav-item"><a
                                    class="nav-link active"
                                    aria-current="page"
                                    href="/joo/user/logout">👋 로그아웃</a></li>
                                <li class="nav-item"><a
                                    class="nav-link active"
                                    aria-current="page"
                                    href="/joo/user/myBasket">🛍 장바구니 
                                    <sec:authorize access="isAuthenticated()">
                                    	[${ basketCount }]
                                    </sec:authorize></a></li>
                                <li class="nav-item dropdown"><a
                                    class="nav-link dropdown-toggle"
                                    href="/joo/user/myBasket" role="button"
                                    data-bs-toggle="dropdown"
                                    aria-expanded="false">🙈 마이페이지 </a>
                                    <ul class="dropdown-menu dropdown-menu-dark">
                                        <li><a
                                            class="dropdown-item"
                                            href="/joo/user/myDetails">✍ 개인정보
                                                수정</a></li>
                                        <li><a
                                            class="dropdown-item"
                                            href="/joo/user/myGrade">😎 포인트/등급 확인</a></li>
                                        <li><a
                                            class="dropdown-item"
                                            href="/joo/order/orderHistory">🎵 주문내역</a></li>
                                        <li><a
                                            class="dropdown-item"
                                            href="/joo/questions/myQuestionsList">💬 내 문의내역</a></li>
                                        <li><a
                                            class="dropdown-item"
                                            href="/joo/user/myReviews">💬 내 리뷰내역</a></li>
                                    </ul>
                            </sec:authorize>
                            <sec:authorize access="isAuthenticated()">
                        
                        <li class="nav-item"><a
                                    class="nav-link active"
                                    aria-current="page"
                                    href="/joo/questions/questionQnaList">🙏QNA 문의하기</a>
                        </li>
                        </sec:authorize>
                        </ul>
                    </div>
                </div>
            </div>
 <ul class="nav nav-tabs" style="border-bottom: none;">
    <li class="nav-item">
        <a class="nav-link" style="color: #f5f5dc;" href="/joo/product/productsList">제품보기</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" style="color: #f5f5dc;" href="/joo/post/postList">공지사항/이벤트</a>
    </li>
</ul>
        </header>
        
        
                    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
</body>
</html>