<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>JOO</title>
</head>
<body>
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
    </header>
	<div style="width: 60%; margin: 0 auto; padding: 20px 5px;">
		<div id="title-area" style="margin: 0 auto; padding: 20px 5px;">
			<h2 style="text-align: center;">리뷰 작성내역</h2>
			<hr />
		</div>
		<div id="reviews">
			<table class="table table-striped table-hover table-center">
				<thead>
					<tr>
						<th scope="col">리뷰 아이디</th>
						<th scope="col">유저 아이디</th>
						<th scope="col">상품 아이디</th>
						<th scope="col">리뷰 내용</th>
						<th scope="col">별점</th>
						<th scope="col">작성일자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ reviews }" var="review">
						<tr>
							<td>${ review.id }</td>
							<td>${ review.u_id }</td>
							<td>${ review.p_id }</td>
							<td>${ review.rcontent }</td>
							<td>${ review.rratings }</td>
							<td>${ review.rcreated_time }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div id="btn-section" class="text-center py-3">
			<a href="/joo" class="btn btn-outline-dark w-50 my-1">메인으로 이동</a>
		</div>
	</div>
	
	<footer>
       <jsp:include page="../common/footer.jsp"></jsp:include>
    </footer>

</body>
</html>