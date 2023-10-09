<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>나의 문의내역</title>
    <link href="${pageContext.request.contextPath}/static/css/questions/questionQna.css" rel="stylesheet">    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

</head>
<body>

           <jsp:include page="../common/header.jsp"></jsp:include>



    <div class="container-fluid">
        <div class="my-2 p-1 text-center">
            <div>
                <h2 style="color: #343A40;">나의 문의내역 (총 ${myQuestionsList.size()}건)</h2>
            </div>
        </div>

        <nav class="navbar navbar-expand-lg">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <c:url var="mainPage" value="/" /> 
                    <a class="nav-link" href="${mainPage}">메인 페이지</a>
                </li>
                <li class="nav-item">
                    <c:url var="questionQnaCreatePage" value="/questions/questionQnaCreate" /> 
                    <a class="nav-link" href="${questionQnaCreatePage}">새 QNA 작성</a>
                </li>
            </ul>
        </nav>

        <main class="my-2">
            <div class="card">
                <form>
                <table class="card-body table table-hover">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>답변여부</th>
                            <th>문의 유형</th>
                            <th class="table-title">제목</th>
                            <th>작성시간</th>
                            <th>제품 이름</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${myQuestionsList}" var="question">
                            <tr>
                                <td>${question.id}</td>
                                <td>${question.is_answered}</td>
                                <td>${question.qtype}</td>
                                <td class="table-title">
                                    <c:url var="QuestionDetailPage" value="/questions/questionDetail">
                                        <c:param name="p_id" value="${question.id}" />
                                    </c:url>
                                    <a href="${QuestionDetailPage}">${question.qtitle}</a>
                                </td>
                                <td>
                                    <fmt:formatDate value="${question.qcreated_time}" pattern="yyyy-MM-dd HH:mm:ss" />
                                </td>
                                <td>${question.product.pname}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
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
