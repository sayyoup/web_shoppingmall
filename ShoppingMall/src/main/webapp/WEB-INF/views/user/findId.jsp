<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>아이디 찾기</title>
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
				<div id="id-panel" class="p-2">
					<input type="text" id="name" name="name" class="form-control" placeholder="NAME" />
				</div>
				<div id="password-panel" style="width: 100%" class="p-2">
					<input type="text" id="email" class="form-control" name="email" placeholder="EMAIL" />
				</div>
	
				<div id="login-btn-panel" class="p-2" style="width: 100%;">
					<button type="button" id="findIdBtn" class="btn btn-dark w-100">아이디 찾기</button>
				</div>
				<div id="signup-btn-panel" class="p-2" style="width: 100%;">
					<a href="/joo/user/login" class="btn btn-outline-dark w-100">취소</a>
				</div>
			</div>
		</form>
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script>
		$(function() {
			$('#findIdBtn').click(function() {
				const mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
				
				const name = $('#name').val();
				const email = $('#email').val();
				
				if(name === '') {
					alert('이름을 입력해주세요.');
					return;
				}
				if(email === '') {
					alert('이메일을 입력해주세요.');
					return;
				}
				if(!email.match(mailformat)) {
					alert('이메일 형식에 맞게 입력해주세요.');
					return;
				}
				
				$.ajax({
					type: 'POST',
					url: '/joo/user/findId',
					data: JSON.stringify(
							{"name": name, "email": email}
					),
					contentType: 'application/json',
					success: function(res) {
						if(res.trim().length > 0) {
							alert('아이디: ' + res);
							window.location.href='/joo/user/login';
						}
						else {
							alert('해당 정보로 가입된 사용자가 없습니다.');
							$('#name').val('');
							$('#email').val('');
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