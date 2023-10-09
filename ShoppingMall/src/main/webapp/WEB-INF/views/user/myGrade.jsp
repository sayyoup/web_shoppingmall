<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>회원 등급</title>
</head>
<body>
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
    </header>
	<div style="width: 60%; margin: 0 auto; padding: 20px 5px;">
		<div id="title-area" style="margin: 0 auto; padding: 20px 5px;">
			<h2 style="text-align: center;">"${ user.uname }"님의 회원 등급</h2>
			<hr />
		</div>
		<div id="info-section">
			<c:set var="grade" value="${ user.ugrade }" />
			
			<c:if test="${ grade eq 'BRONZE' }">
				<div class="text-center">
					<img src="../static/assets/user/bronze.png">
				</div>	
			</c:if>
			<c:if test="${ grade eq 'SILVER' }">
				<div class="text-center">
					<img src="../static/assets/user/silver.png">
				</div>
			</c:if>
			<c:if test="${ grade eq 'GOLD' }">
				<div class="text-center">
					<img src="../static/assets/user/gold.png">
				</div>
			</c:if>
			<c:if test="${ grade eq 'DIAMOND' }">
				<div class="text-center">
					<img src="../static/assets/user/diamond.png">
				</div>
			</c:if>
			
			<div class="text-center py-3">
				<h4>${ user.uname }님의 현재 등급은 ${ grade } 입니다.</h4>
			</div>
			
			<div class="text-center">
				<c:set var="current_point" value="${ user.ucurrent_point }" />
				<p>누적 포인트: <fmt:formatNumber type="number" maxFractionDigits="3" value="${current_point}" /></p>
			</div>
			
			<div class="text-center">
				<c:set var="total_point" value="${ user.utotal_point }" />
				<p>현재 포인트: <fmt:formatNumber type="number" maxFractionDigits="3" value="${total_point}" /></p>
			</div>
		</div>
		<div id="btn-section" class="text-center py-3">
			<button type="button" class="btn btn-dark w-50 my-1" data-bs-toggle="modal" data-bs-target="#membershipInfoModal">멤버십 정보 보기</button>
			<a href="/joo" class="btn btn-outline-dark w-50 my-1">메인으로 이동</a>
		</div>
	</div>
	
	<footer>
       <jsp:include page="../common/footer.jsp"></jsp:include>
    </footer>
	
	<div class="modal fade" id="membershipInfoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">회원 등급 안내</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <table class="table">
			  <thead>
			    <tr>
			      <th scope="col" class="text-center align-middle">회원 등급</th>
			      <th scope="col" class="text-center">
			      	<img src="../static/assets/user/bronze.png" class="img-fluid" alt="">
			      	<p class="text-center py-2">브론즈</p>
			      </th>
			      <th scope="col" class="text-center">
			      	<img src="../static/assets/user/silver.png" class="img-fluid" alt="">
			      	<p class="text-center py-2">실버</p>
		      	  </th>
			      <th scope="col" class="text-center">
			      	<img src="../static/assets/user/gold.png" class="img-fluid" alt="">
			      	<p class="text-center py-2">골드</p>
			      </th>
			      <th scope="col" class="text-center">
			      	<img src="../static/assets/user/diamond.png" class="img-fluid" alt="">
			      	<p class="text-center py-2">다이아몬드</p>
			      	
			      </th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <th scope="row" class="text-center align-middle">등급 조건</th>
			      <td class="text-center">일반 가입 회원</td>
			      <td class="text-center">10만 포인트 이상</td>
			      <td class="text-center">20만 포인트 이상</td>
			      <td class="text-center">50만 포인트 이상</td>
			    </tr>
			    <tr>
			      <th scope="row" class="text-center align-middle">할인 혜택</th>
			      <td class="text-center">3% 할인</td>
			      <td class="text-center">5% 할인</td>
			      <td class="text-center">7% 할인</td>
			      <td class="text-center">10% 할인</td>
			    </tr>
			  </tbody>
			</table>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>