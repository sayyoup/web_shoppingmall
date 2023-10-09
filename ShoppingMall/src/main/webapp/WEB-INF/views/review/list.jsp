<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
 	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" 
    rel="stylesheet" 
    integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" 
    crossorigin="anonymous">
	<title>Review List page</title>
</head>
	<body>
	<header class="my-1 p-3 text-bg-dark">
		<h1>후기 페이지</h1>
	</header>	
<hr>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
            <ul class="navbar-nav bg-light">
                <li class="nav-item">
                    <c:url var="mainPage" value="/" />
                    <a class="mx-1 btn btn-outline-success" href="/joo">메인 페이지</a>
                </li>
                <li class="nav-item">
                    <c:url var="postCreatePage" value="/post/create" />
                    <a class="mx-1 btn btn-outline-success" href="/joo/review/create">후기 작성</a>
                </li>
            </ul>
</nav>
<hr>
<main class="my-2">
<div id="reviews" class="container mt-4">  
<%-- <h5>< ${product.pname} > 상품리뷰 (총 ${reviewList.size()}건)</h5> --%>                      
                        <table class="table table-dark text-center">
						  <thead>
						    <tr>
						      <th scope="col">#</th>
						      <th scope="col">유저 id</th>
						      <th scope="col">리뷰 내용</th>
						      <th scope="col">별점</th>
						      <th scope="col">작성일자</th>
						    </tr>
						  </thead>
						  <tbody>
						    <c:forEach items="${ reviewList }" var="review">
	                        	<tr>
	                        		<td>${ review.id }</td>
		                        	<td>${ review.u_id }</td>
		                        	<td>${ review.rcontent }</td>
		                        	<td>${ review.rratings }</td>
		                        	<td>${ review.rcreated_time }</td>
	                        	</tr>
	                        </c:forEach>
						  </tbody>
						</table>
                    </div>


 	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" 
            crossorigin="anonymous">
 	</script>
</body>
</html>














































