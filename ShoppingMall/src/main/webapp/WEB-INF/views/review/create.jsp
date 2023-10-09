<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
    uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Review Page</title>
<link rel="stylesheet" type="text/css" href="../static/assets/css/star.css">
</head>
<body>
	<header>
            <jsp:include page="../common/header.jsp"></jsp:include>
        </header>

	<div class="container-fluid">
		<header class="my-2 p-5 text-center text-primary">
			<h1>후기 작성</h1>
			
			<c:set var="pid" value="${ data.pid }"></c:set>
			<c:set var="uid" value="${ data.uid }"></c:set>
			<c:set var="oid" value="${ data.oid }"></c:set>
			
			<input type="hidden" id="pid" value="${ data.pid }" />
			<input type="hidden" id="oid" value="${ data.oid }" />
			<input type="hidden" id="uid" value="${ data.uid }" />
		</header>
		<hr>
		
		<table width="100%" cellpadding='0' cellspacing='0'>
			<tr>
				<td align="left"><font size="2"> 
				<!-- <b>상품 이미지</b> 
				<img src="../static/images/a1.JPG" width="150" height="100" alt="a1">  -->
				<br /> 
				<br />
					<form name="rratings" id="myform" method="post" action="./create">
						<fieldset>
							<legend>별점 체크하기</legend>
					        <label for="rate1">⭐</label><input type="radio" name="rratings" value="5" id="rate1">
					        <label for="rate2">⭐</label><input type="radio" name="rratings" value="4" id="rate2">
					        <label for="rate3">⭐</label><input type="radio" name="rratings" value="3" id="rate3">
					        <label for="rate4">⭐</label><input type="radio" name="rratings" value="2" id="rate4">
					        <label for="rate5">⭐</label><input type="radio" name="rratings" value="1" id="rate5">
						</fieldset>
					</form>
				</td>
			</tr>
		</table>

		<hr/>
		<br />
		<main class="my-2">
			<div class="card">
				<div class="card-body">
					<div class="my-2">
					    <label class="form-label" for="rcontent">후기 내용</label>
					    <textarea class="form-control" id="rcontent" 
					    name="rcontent" rows="5" required></textarea>
					</div>

				</div>
				<div class="d-flex justify-content-center">
					<a class="mx-1 btn btn-outline-danger" id="btnCancel" href="javascript:history.go(-1)">취소</a>
					<button type="button" class="mx-1 btn btn-outline-success" id="btnRegister">등록</button>
				</div>
			</div>
		</main>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
		</script>
		<script>
        	$(function() {
        		$('#btnRegister').click(function() {
        			const pid = $('#pid').val();
        			const uid = $('#uid').val();
        			const oid = $('#oid').val();
        			/* const rratings = 4; */
        			const rratings = $('input[name="rratings"]:checked').val(); // 선택된 별점 가져오기
        			const rcontent = $('#rcontent').val();
        			const data = {"p_id": pid, "u_id": uid, "o_id": oid, "rratings": rratings, "rcontent": rcontent};

        			// 선택된 별점이 없다면 경고 메시지를 출력.
    		        if (!rratings) {
    		            alert("별점을 선택해주세요.");
    		            return;
    		        }
        			
    		     	// 내용이 없다면 경고 메시지를 출력.
    		        if (!rcontent) {
    		            alert("내용을 입력해주세요.");
    		            return;
    		        }
        			
        			$.ajax({
        				url: '/joo/review/create',
        				type: 'POST',
        				data: JSON.stringify(data),
        				contentType: 'application/json',
        				success: function(res) {
        					console.log(res);
        					alert('리뷰 작성 성공');
        					window.location.href='/joo';
        				}, error: function(error) {
        					console.log(error);
        				}
        			});
        		});
        	});
        </script>

</body>
</html>
<jsp:include page="../common/footer.jsp"></jsp:include>

