<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>회원가입 페이지</title>
</head>
<body>
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
    </header>
	<div style="width: 50%; margin: 0 auto;" class="py-3">
		<div id="title-area" style="margin: 0 auto; padding: 20px 5px;">
			<h2 style="text-align: center;">회원가입</h2>
			<hr />
		</div>
		<form id="join-form" action="/joo/user/join" method="post" onsubmit="return formCheck()">
			<table class="table">
				<tr>
					<th class="table-secondary w-25">
						<label for="loginId" class="form-label">아이디</label>
					</th>
					<td class="w-75">
						<input type="text" class="form-control" id="loginId" name="loginId" autofocus>
					</td>
					<td>
						<input type="button" id="id-validate-btn" class="btn btn-outline-primary w-100" value="중복 확인">
		    			<input type="hidden" id="is-id-validated" value="no" />
					</td>
				</tr>
				<tr>
					<th class="table-secondary w-25">
						<label for="password" class="form-label">비밀번호</label>
					</th>
					<td class="w-75">
						<input type="password" class="form-control" id="password" name="password">
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<th class="table-secondary w-25">
						<label for="passwordConfirm" class="form-label">비밀번호 확인</label>
					</th>
					<td class="w-75">
						<input type="password" class="form-control" id="passwordConfirm">
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<th class="table-secondary w-25">
						<label for="name" class="form-label">이름</label>
					</th>
					<td class="w-75">
						<input type="text" class="form-control" id="name" name="name">
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<th class="table-secondary w-25">
						<label for="phone" class="form-label">전화번호</label>
					</th>
					<td class="w-75">
						<input type="text" class="form-control" id="phone" name="phone" maxlength="13" oninput="autoHyphen2(this)" placeholder="ex) 010-1234-5678">
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<th class="table-secondary w-25">
						<label for="email" class="form-label">이메일</label>
					</th>
					<td class="w-75">
						<input type="text" class="form-control" id="email" name="email">
					</td>
					<td>
						<input type="button" id="generate-num-btn" class="btn btn-outline-primary w-100" value="인증번호 받기">
					</td>
				</tr>
				<tr>
					<th class="table-secondary w-25">
						<input type="hidden" id="email-verification-code" value="" />
		    			<label for="emailConfirm" class="form-label">이메일 인증</label>
					</th>
					<td class="w-75">
						<input type="text" class="form-control" id="emailConfirm" />
					</td>
					<td>
						<input type="hidden" id="is-email-validated" value="no" />
		    			<input type="button" id="num-check-btn" class="btn btn-outline-primary w-100" value="인증번호 확인">
					</td>
				</tr>
				<tr>
					<th class="table-secondary w-25" rowspan="3">
						<span id="guide" style="color:#999;display:none"></span>
						<label for="postcode" class="form-label">주소</label>
					</th>
					<td class="w-75">
						<input type="text" class="form-control" id="postcode" name="postcode">
					</td>
					<td>
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="btn btn-outline-primary w-100">
					</td>
				</tr>
				<tr>
					
					<td class="w-75">
						<input type="text" class="form-control" id="street" name="street">
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td class="w-75">
						<input type="text" class="form-control" id="detailAddress" name="detailAddress">
					</td>
					<td>
					</td>
				</tr>
			</table>
			<div class="w-100">
				<button type="submit" id="joinBtn" class="btn btn-dark w-100 my-1">가입</button>
			</div>
			<div class="w-100">
				<a href="/joo" class="btn btn-outline-dark w-100 my-1">취소</a>
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
	<script type="text/javascript">
		function formCheck() {
			const idformat = /^[A-Za-z0-9+]*$/;
			const mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
			const phoneformat = /^\d{3}-\d{3,4}-\d{4}$/;
			const pwdformat = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
			
			const loginId = document.querySelector('input#loginId').value;
			const name = document.querySelector('input#name').value;
			const phone = document.querySelector('input#phone').value;
			const email = document.querySelector('input#email').value;
			const emailConfirm = document.querySelector('input#emailConfirm').value;
			const password = document.querySelector('input#password').value;
			const passwordConfirm = document.querySelector('input#passwordConfirm').value;
			const street = document.querySelector('input#street').value;
			const detailAddress = document.querySelector('input#detailAddress').value;
			const postcode = document.querySelector('input#postcode').value;
			
			// validation check
			const isIdValidated = document.querySelector('input#is-id-validated').value; // 아이디 중복 확인 여부 체크
			const isEmailValidated = document.querySelector('input#is-email-validated').value; // 이메일 인증 여부 체크
					
			if(loginId === '') {
				alert('아이디를 입력해주세요.');
				return false;
			}
			if(!loginId.match(idformat)) {
				alert('아이디는 숫자와 영문으로만 작성해주세요.')
				return false;
			}
			if(isIdValidated === 'no') {
				alert('아이디 중복 확인을 해주세요.');
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
			if(name === '') {
				alert('이름을 입력해주세요.');
				return false;
			}
			if(!phone.match(phoneformat)) {
				alert('전화번호를 형식에 맞게 입력해주세요.');
				return false;
			}
			if(!email.match(mailformat)) {
				alert('이메일 형식에 맞게 입력해주세요.');
				return false;
			}
			if(emailConfirm === '') {
				alert('이메일 인증번호를 입력해주세요.');
				return false;
			}
			if(isEmailValidated === 'no') {
				alert('이메일 인증을 완료해주세요.');
				return false;
			}
			if(street === '') {
				alert('도로명 주소를 입력해주세요.');
				return false;
			}
			if(detailAddress === '') {
				alert('상세 주소를 입력해주세요.');
				return false;
			}
			if(postcode === '') {
				alert('우편번호를 입력해주세요.');
				return false;
			}
			
			return true;
		}
	</script>
	<script>
		$(document).ready(function() {
			const emailConfirm = $('#emailConfirm');
			emailConfirm.attr('disabled', true);
		});
	</script>
	<script>
		$(function() {
			$('#id-validate-btn').click(function() {
				const idformat = /^[A-Za-z0-9+]*$/;
				const loginId = $('#loginId').val();
				const isIdValidated = $('#is-id-validated');
				if(loginId === '') {
					alert('아이디를 입력해주세요.');
					return false;
				}
				if(!loginId.match(idformat)) {
					alert('아이디는 숫자와 영문으로만 작성해주세요.')
					return false;
				}
				
				$.ajax({
					type: 'POST',
					url: "/joo/api/validate/loginId",
					data: {"loginId": loginId},
					success: function(res) {
						if(res === 1) {
							alert('사용 가능한 아이디입니다.');
							isIdValidated.val('yes');
						} else {
							alert('이미 사용중인 아이디입니다.');
						}
					}, error: function(error) {
						console.log(error);
					}
				});
			});
		});
	</script>
	<script>
    	const mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	
		$(function() {
			$('#generate-num-btn').click(function(){
				sendEmail();
			});
		});
		
		function sendEmail() {
			const email = $('#email').val();
			const code = $('#email-verification-code');
			
			const emailConfirm = $('#emailConfirm');
			
			if(!email.match(mailformat)) {
				alert('이메일 형식에 맞게 입력해주세요.');
				return;
			}
			
			$.ajax({
				type: 'POST',
				url: '/joo/api/validate/emailCheck',
				data: {
					'email': email
				}, success: function(res) {
					if(res === 0) {
						alert('이미 사용중인 이메일 입니다.');
						$('#email').val('');
					} else {
						$.ajax({
							type: 'POST',
							url: '/joo/api/validate/sendCode',
							data: {
								'email': email
							}, success: function(res) {
								code.val(res);
								emailConfirm.attr("disabled", false);
								emailConfirm.val('');
								alert('인증번호가 전송되었습니다.');
							}, error: function(error) {
								console.log(error);
							}
			            });
					}
				}, error: function(error) {
					console.log(error);
				}
			});
		}
	</script>
	<script>
		$(function() {
			$('#num-check-btn').click(function(){
				const code = $('#email-verification-code').val();
				const emailConfirm = $('#emailConfirm');
				
				if(code === "") {
					alert('인증번호 받기를 클릭해주세요.');
					return;
				}
				
				if(code !== emailConfirm.val()) {
					alert('인증번호가 일치하지 않습니다.');
					emailConfirm.val('');
					return;
				}
				
				alert('인증번호가 일치합니다.');
				$('#is-email-validated').val('yes');
				emailConfirm.attr("disabled", true);
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