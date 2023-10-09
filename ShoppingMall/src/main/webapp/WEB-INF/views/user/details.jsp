<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>회원 정보</title>
</head>
<body>
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
    </header>

	<div style="width: 60%; margin: 0 auto; padding: 20px 5px;">
		<div id="title-area" style="margin: 0 auto; padding: 20px 5px;">
			<h2 style="text-align: center;">"${ user.uname }"님의 회원정보</h2>
			<hr />
		</div>
		<form id="update-form" >
			<table class="table">
				<tr>
					<th class="table-secondary w-25">
						<label for="loginId" class="form-label">아이디</label>
					</th>
					<td class="w-75">
						<input type="text" class="form-control" id="loginId" name="loginId" value="${ user.login_id }" readonly>
					</td>
					<td></td>
				</tr>
				<tr>
					<th class="table-secondary w-25">
						<label for="name" class="form-label">이름</label>
					</th>
					<td class="w-75">
						<input type="text" class="form-control" id="name" name="name" value="${ user.uname }">
					</td>
					<td></td>
				</tr>
				<tr>
					<th class="table-secondary w-25">
						<label for="phone" class="form-label">전화번호</label>
					</th>
					<td class="w-75">
						<input type="text" class="form-control" id="phone" name="phone" value="${ user.uphone }" maxlength="13" oninput="autoHyphen2(this)">
					</td>
					<td></td>
				</tr>
				<tr>
					<th class="table-secondary w-25">
						<label for="email" class="form-label">이메일</label>
					</th>
					<td class="w-75">
						<input type="email" class="form-control" id="email" name="email" value="${ user.uemail }" readonly>
					</td>
					<td></td>
				</tr>
				<tr>
					<th class="table-secondary w-25">
						<label for="password" class="form-label">비밀번호</label>
					</th>
					<td class="w-75">
						<input type="password" class="form-control" id="password" name="password">
					</td>
					<td></td>
				</tr>
				<tr>
					<th class="table-secondary w-25">
						<label for="passwordConfirm" class="form-label">비밀번호 확인</label>
					</th>
					<td class="w-75">
						<input type="password" class="form-control" id="passwordConfirm" name="passwordConfirm">
					</td>
					<td></td>
				</tr>
				<tr>
					<th class="table-secondary w-25" rowspan="3">
						<span id="guide" style="color:#999;display:none"></span>
						<label for="postcode" class="form-label">주소</label>
					</th>
					<td class="w-75">
						<input type="text" class="form-control" id="postcode" name="postcode" value="${ user.upostcode }">
					</td>
					<td>
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="btn btn-outline-primary w-100">
					</td>
				</tr>
				<tr>
					<td class="w-75">
						<input type="text" class="form-control" id="street" name="street" value="${ user.ustreet }">
					</td>
					<td></td>
				</tr>
				<tr>
					<td class="w-75">
						<input type="text" class="form-control" id="detailAddress" name="detailAddress" value="${ user.udetail_address}">
					</td>
					<td></td>
				</tr>
			</table>
			<div id="btn-section py-3">
				<button type="button" id="modifyBtn" class="btn btn-outline-dark w-100 my-1">회원정보 수정</button>
			  	<a href="/joo" class="btn btn-outline-primary w-100 my-1">메인으로 이동</a>
			  	<a href="/joo/user/withdrawal" class="btn btn-outline-danger w-100 my-1">회원 탈퇴</a>
			</div>
		</form>
	</div>
	
	<footer>
       <jsp:include page="../common/footer.jsp"></jsp:include>
    </footer>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script>
		const autoHyphen2 = (target) => {
 			target.value = target.value
			.replace(/[^0-9]/g, '')
	  		.replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
		}
	</script>
	<script>
		$(function() {
			$('#modifyBtn').click(function() {
				const phoneformat = /^\d{3}-\d{3,4}-\d{4}$/;
				const pwdformat = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
				
				const name = $('#name').val();
				const phone = $('#phone').val();
				const password = $('#password').val();
				const passwordConfirm = $('#passwordConfirm').val();
				const street = $('#street').val();
				const detailAddress = $('#detailAddress').val();
				const postcode = $('#postcode').val();
				
				if(name === '') {
					alert('이름을 입력해주세요.');
					return false;
				}
				if(!phone.match(phoneformat)) {
					alert('전화번호를 형식에 맞게 입력해주세요.');
					return false;
				}
				if(!password.match(pwdformat)) {
					alert('비밀번호는 문자, 숫자, 특수문자를 포함하여 8~15자리로 입력해주세요.');
					return false;
				}
				if(passwordConfirm === '') {
					alert('비밀번호 확인을 입력해주세요.');
					return false;
				}
				if(password !== passwordConfirm) {
					alert('비밀번호가 일치하지 않습니다.');
					return false;
				}
				if(street.trim().length == 0) {
					alert('도로명주소를 입력해주세요.');
					return;
				}
				if(detailAddress.trim().length == 0) {
					alert('상세주소를 입력해주세요.');
					return;
				}
				if(postcode.trim().length == 0) {
					alert('우편번호를 입력해주세요.');
					return;
				}
				
				const param = {
					'name': name,
					'phone': phone,
					'street': street,
					'detailAddress': detailAddress,
					'postcode': postcode,
					'password': password
				};
				
				$.ajax({
					type: 'POST',
					url: '/joo/user/modify',
					data: JSON.stringify(param),
					contentType: 'application/json',
					success: function(res) {
						alert('회원정보 업데이트 성공');
						window.location.href='/joo';
					}, error: function(error) {
						console.log(error);
					}
				});
			});
		});
	</script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	    function sample4_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수
	
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById("street").value = roadAddr;
	
	                var guideTextBox = document.getElementById("guide");
	                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	                if(data.autoRoadAddress) {
	                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                    guideTextBox.style.display = 'block';
	
	                } else {
	                    guideTextBox.innerHTML = '';
	                    guideTextBox.style.display = 'none';
	                }
	            }
	        }).open();
	    }
	</script>
</body>
</html>