<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>상품문의</title>
    <link href="${pageContext.request.contextPath}/static/css/questions/questionQna.css" rel="stylesheet"> 
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
     
     
     </head>
        <body>
            <header>
                <jsp:include page="../common/header.jsp"></jsp:include>
            </header>
        
        
            <div class="container-fluid">
            <div class="my-2 p-1 text-center">
                <h2>${ product.pname }  문의 (총 ${questionsList.size()}건)</h2>
            </div>

        <nav class="navbar navbar-expand-lg">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <c:url var="mainPage" value="/" /> 
                    <a class="nav-link" href="${ mainPage }">메인 페이지</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/joo/product/productsList">뒤로 가기</a>
                </li>
         </ul>
    </nav>

    <main class="my-2">
        <div class="card">
        <form>
            <div class="card-body">
            <table class ="card-body table table-hover">
                <thead>
                  
                    <tr>
                        <th>번호</th>
                        <th>문의 유형</th>
                        <th>답변여부</th>
                        <th>제품명</th>
                        <th>작성자 아이디</th>
                        <th>작성시간</th>
                    </tr>
               
                </thead>
                <tbody>
                   <!-- var는 도메인 모델 이름! -->
                    <c:forEach items="${questionsList }" var="question">
                        <tr>
                            <td>${ question.id }</td>
                            <td>${ question.qtype }</td>
                            <td>${ question.is_answered }</td>
                            <td> 
                                <sec:authorize access="isAuthenticated()">
                                                        <sec:authentication property="principal.username" var="login_id" />
                                                    </sec:authorize>
                                                        <c:set value="${question.login_id}" var="qlogin_id" />
                                                        <c:url var="QuestionDetailPage" value="/questions/questionDetail">
                                                            <c:param name="p_id" value="${question.id}" />
                                                        </c:url>
                                                        <c:choose>
                                                            <c:when test="${login_id == qlogin_id}">
                                                                <a href="${QuestionDetailPage}" style="color: #a43c0c; font-weight: bold;">${question.qtitle}</a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                ${question.qtitle}
                                                            </c:otherwise>
                                                        </c:choose>
                                                     </td>
                                <td>${question.login_id}
                                </td>
                            <td>
                                    <fmt:formatDate
                                        value="${ question.qcreated_time }"
                                        pattern="yyyy-MM-dd HH:MM:mm" />
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
               </div>
            </form>
           </div>
       </main>
       
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
               <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
       </div>
</body>
</html>
<jsp:include page="../common/footer.jsp"></jsp:include>