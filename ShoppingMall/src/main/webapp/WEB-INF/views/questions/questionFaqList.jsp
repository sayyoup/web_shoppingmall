<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>파AQ</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
      .list-group-item h4 {
            color: #ffffff;
        }
        .list-group-item p {
            color: #e0e0e0;
        }
    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp"></jsp:include>
                <nav class="navbar navbar-expand-lg">
                     <ul class="navbar-nav">
                    <li class="nav-item">
                    <c:url var="questionQnaListPage" value="/questions/questionQnaList" /> 
                    <a class="nav-link" href="${questionQnaListPage}">QNA 문의 목록</a>
                        </li>
                 </ul>
                </nav>
        <nav class="navbar navbar-expand-lg"style="background-color: #343A40;">
    
    
    <div class="card-body">
        <form >
       <div class="container mt-3" style="color: #343A40;" >
        
        <ul class="list-group mt-1" style="text-align: center; color:white;">
                <h1> FAQ</h1>
            <li class="list-group-item"style="background-color: #343A40;">
                <h4>주류를 구매하려면 어떻게 해야 하나요?</h4>
                <p> 구매하시면 됩니다.</p>
            </li>
            <li class="list-group-item"style="background-color: #343A40;">
                <h4> 배송은 어떻게 이루어지나요?</h4>
                 <p> 주문하시면 됩니다.</p>
            </li>
            <li class="list-group-item"style="background-color: #343A40;">
                <h4>주류의 취소, 교환 또는 환불은 가능한가요?</h4>
                <p>제 맘입니다.</p>
            </li>
            <li class="list-group-item"style="background-color: #343A40;">
                <h4>주류의 유통기한은 어떻게 확인하나요?</h4>
                <p>검색하세요.</p>
            </li>
            <li class="list-group-item"style="background-color: #343A40;">
                <h4>문의사항은 어디서 남겨야 하나요?</h4>
                <p>🙏🙏🙏DM으로 부탁드려요🙏🙏🙏</p>
            </li>
        </ul>
        </div>
        </form>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                      <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
       </div>
       </nav>
</body>
</html>
<jsp:include page="../common/footer.jsp"></jsp:include>
