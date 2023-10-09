<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>비밀번호 재인증</title>
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
		crossorigin="anonymous">
</head>
<body>	
	<div id="container" style="margin: 0 auto; width: 30%;">
		<form id="find-id">
			<div style="width: 100%; margin-top: 200px;">
				<input type="hidden" id="loginId" name="loginId" value="${ loginId }">
				<div id="password-panel" style="width: 100%" class="p-2">
					<input type="password" id="upassword" class="form-control" name="upassword" placeholder="PW" />
				</div>
				<div id="find-btn-panel" class="p-2" style="width: 100%;">
					<button type="button" id="findIdBtn" class="btn btn-dark w-100">회원정보 수정</button>
				</div>
				<div id="main-btn-panel" class="p-2" style="width: 100%;">
					<a href="/joo" class="btn btn-outline-dark w-100">메인으로 이동</a>
				</div>
			</div>
		</form>
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script>
		$(function() {
			$('#findIdBtn').click(function() {				
				const loginId = $('#loginId').val(); 
				const password = $('#upassword').val();
				alert(loginId + " " + password);
				
				if(password === '') {
					alert('비밀번호를 입력해주세요.');
					return;
				}
				
				$.ajax({
					type: 'POST',
					url: '/joo/user/passwordAuthentication',
					data: JSON.stringify(
							{"loginId": loginId, "password": password}
					),
					dataType: 'json',
//					contentType: 'application/json',
					success: function(res) {
						if(res === 1) {
							alert('비밀번호 인증 성공');
							window.location.href='/joo/user/myDetails';
						}
						if(res === 0) {
							alert('비밀번호가 틀렸습니다');
							$('#upassword').val('');
						}
					}, error: function(error) {
						console.log(error);
					}
				});
			});
		});
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>