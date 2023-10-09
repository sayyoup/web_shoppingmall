<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>로그인 페이지</title>
	<link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>

	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
    </header>
	<div id="container" style="margin: 0 auto; width: 30%;" class="py-5">
		<form action="/joo/user/loginPro" method="post">
			<div class="w-100 py-5">
				<div id="id-panel" class="p-2">
					<input type="text" id="login_id" name="login_id" class="form-control" placeholder="ID" />
				</div>
				<div id="password-panel" style="width: 100%" class="p-2">
					<input type="password" id="upassword" class="password form-control" name="upassword" placeholder="PW" />
						<!--  
					<div class="p-2">
						<i class="bx bx-hide eye-icon"></i>
					</div>-->
				</div>
				
				<c:if test="${ errorMessage.length() > 0 }">
					<div id="error-message" class="w-100 px-2 text-danger">
						<c:out value="${ errorMessage }" />
					</div>
				</c:if>
				
				<a href="/joo/user/findId" class="p-2 link-secondary" style="float:right">아이디 찾기</a>
				<a href="/joo/user/findPassword" class="p-2 link-secondary" style="float:right">비밀번호 찾기</a>

				<div id="login-btn-panel" class="p-2" style="width: 100%;">
					<button type="submit" class="btn btn-outline-dark w-100">로그인</button>
				</div>
				<div id="signup-btn-panel" class="p-2" style="width: 100%;">
					<a href="/joo/user/join" class="btn btn-dark w-100">회원가입</a>
				</div>
			</div>
		</form>
	</div>
	
	<footer>
       <jsp:include page="../common/footer.jsp"></jsp:include>
    </footer>
	
	<script src="../static/js/userPage/password-masking.js"></script>
</body>
</html>