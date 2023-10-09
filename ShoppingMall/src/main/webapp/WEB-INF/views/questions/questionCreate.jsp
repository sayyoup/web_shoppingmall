<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>상품 문의</title>
    <link href="${pageContext.request.contextPath}/static/css/questions/questionQna.css" rel="stylesheet"> 
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  
</head>
    
    <body>
            <jsp:include page="../common/header.jsp"></jsp:include>
    
        <div class="container-fluid">
            <div class="my-2 p-1 text-center">
                <h2 style="color: #343A40;">< ${product.pname } > 문의 작성</h2>
             </div>

            <nav class="navbar navbar-expand-lg">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <c:url var="mainPage" value="/" /> 
                        <a class="nav-link" href="${ mainPage }">메인 페이지</a>
                    </li>
                    <li class="nav-item">
                            <a class="nav-link" 
                            href="/joo/questions/questionsList?p_id=${product.id}" >${product.pname } 문의목록</a>
                    </li>
                </ul>
            </nav>
    
    
        <main class="my-2">
            <div class="card">
                <form method="post">
                    <div class="card-body">
                        <div class="my-2">
                            <label class="form-label" for="panme">상품이름</label>
                           <input class="form-control"
                                type="text" id="pname" name="pname" value="${product.pname }"  readonly />
                        </div>
                        <div class="my-2">
                            <label type = "hidden" class="form-label" for="userId"><!--  유저 번호 --></label>
                            <input class="form-control" 
                                type="hidden" id="userId" name="u_id" value="${userid }" required readonly />
                        </div> 
                        <div class="my-2">
                            <label class="form-label" for="productId"><!-- 상품 번호 --></label>
                            <input class="forn-control"
                                type="hidden" id="productId" name="p_id" value="${product.id }" readonly />
                        </div>
                        <div class="my-2">
                            <label class="form-label" for="questionType">문의 유형</label>
                            <select class="form-select" id="questionType" name="qtype"  >
                                    <option>배송</option>
                                    <option >재입고</option>
                                    <option >기타 상품문의</option>
                           </select>
                        </div>
                    
                        <div class="my-2">
                            <label class="form-label" for="questionTitle">문의 제목</label> 
                            <input class="form-control"
                                type="text" id="questionTitle" name="qtitle" value="${ product.pname } " required readonly  />
                        </div>
                        <div class="my-2">
                            <label class="form-label" for="questionContent">문의 내용</label>
                            <textarea class="form-control" 
                                id="questionContent" name="qcontent" rows="5" required></textarea>
                        </div>
                         <div class="my-2">
                            <label class="form-label" for="login_id">작성자 아이디</label>
                            <input class="form-control" 
                                type="text" id="login_id" name="login_id" value="${login_id }" required readonly />
                        </div> 
                         </div>
                    
                        <div class="card-footer my-2">
                        <input class="form-control btn btn-secondary" type="submit" value="문의 작성" />
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