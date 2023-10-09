<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>문의 상세보기</title>
            <link href="${pageContext.request.contextPath}/static/css/questions/questionQna.css" rel="stylesheet"> 
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  
    </head>
    <body>
        <jsp:include page="../common/header.jsp"></jsp:include>    
    
    <div class="container-fluid">
        <div class="my-2 p-1 text-center">
            <h2 style="color: #343A40;"><${ question.qtitle }> 상세보기</h2>
        </div>
        
        <nav class="navbar navbar-expand-lg">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <c:url var="mainPage" value="/" />
                    <a class="nav-link" href="${ mainPage }">메인 페이지</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/joo/questions/questionCreate?pid=${question.p_id }"><${ question.qtitle }> 문의하기</a>
                    </li>
            </ul>
        </nav>
        
        <main class="my-2">
            <div class="card">
                <form class="card-body">
                     <div class="my-2">
                        <label class="form-label" for="id">번호</label>
                        <input class="form-control" id="id" value="${question.id }" readonly />
                    </div>
                    <div class="my-2">
                        <label class="form-label" for="p_id">상품번호</label>
                        <input class="form-control" id="p_id" value="${question.p_id }" readonly />
                    </div> 
                    <div class="my-2">
                        <label class="form-label" for="qtype">문의 유형</label>
                        <input class="form-control" id="qtype" value="${ question.qtype }" readonly />
                    </div>
                    <div class="my-2">
                        <label class="form-label" for="qtitle">문의 제목</label>
                        <input class="form-control" id="qtitle" value="${ question.qtitle }" readonly />
                    </div>
                    <div class="my-2">
                        <label class="form-label" for="qcontent">문의 내용</label>
                        <textarea class="form-control" id="qcontent" readonly >${ question.qcontent }</textarea>
                    </div>
                    <div class="my-2">
                        <label class="form-label" for="qcreated_time">작성시간</label>
                        <fmt:formatDate value="${ question.qcreated_time }"
                            pattern="yyyy-MM-dd HH:mm:ss" var="qcreated_time" />
                        <input class="form-control" id="qcreated_time" value="${ question.qcreated_time }" readonly />    
                    </div>
                    <div class="my-2">
                        <label class="form-label" for="qmodified_time">수정시간</label>
                        <fmt:formatDate value="${ question.qmodified_time }"
                            pattern="yyyy-MM-dd HH:mm:ss" var="qmodified_time" />
                        <input class="form-control" id="qmodified_time" value="${ question.qmodified_time }" readonly />                        
                    </div>
                <div class="my-2">
                        <label class="form-label" for="login_id"> 작성자 아이디</label>
                        <input class="form-control" id="login_id" value="${ question.login_id }" readonly />                        
                    </div>
                </form>
            
            

<div class="card-footer">
    <c:url var="questionModifyPage" value="/questions/questionModify">
        <c:param name="id" value="${ question.id }"></c:param>
    </c:url>
    
    <sec:authentication property="principal" var="pinfo" />
    <sec:authorize access="isAuthenticated()" >
    <c:if test="${ loginId eq question.login_id }">
        <a class="btn btn-outline-secondary form-control" href="${ questionModifyPage }">수정하기</a>
      </c:if>
     </sec:authorize>
</div>
                
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