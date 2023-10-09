<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1"> <!-- 부트스트랩 -->
        <title>JOO</title>

    </head>
    <body>
        <div>
            <header>
               <jsp:include page="../common/header.jsp"></jsp:include>
            </header>
           
        <main class="my-2">
            <div>
                <img src="../static/assets/bannerImages/002.jpg" class="rounded mx-auto d-block" id="image" width="100%" height="500"></img>
            </div>
        
            <section class="card">
                <form class="card-body">
                    <div class="my-2">
                        <label class="form-label" for="id">번호</label> 
                        <input class="form-control" id="id" name="id" value="${ board.id }" readonly />
                    </div>
                    <div class="my-2">
                        <label class="form-label" for="btype">타입</label> 
                        <input class="form-control" id="btype" name="btype" value="${ board.btype }" readonly/>
                    </div>
                    <div class="my-2">
                        <label class="form-label" for="btitle">제목</label> 
                        <input class="form-control" id="btitle" value="${ board.btitle }" readonly/>
                    </div>
                    <div class="my-2">
                        <label class="form-label" for="bcontent">내용</label>
                        <textarea class="form-control" id="bcontent" readonly>${ board.bcontent }</textarea>
                    </div>
                    <div class="my-2">
                        <label class="form-label" for="bcreated_time">등록 일자</label>
                            <fmt:parseDate value="${ board.bcreated_time }"
                                            pattern="yyyy-MM-dd'T'HH:mm" var="parsedCreTime" type="both"/>
                            <fmt:formatDate value="${ parsedCreTime }" pattern="yyyy-MM-dd" var="parsedCreTime2" />
                        <input class="form-control" id="bcreated_time" value="${ parsedCreTime2 }"  readonly />
                    </div>
                    <div class="my-2">
                        <label class="form-label" for="update_date">종료 일자</label>
                            <fmt:parseDate value="${ board.bcreated_time }"
                                            pattern="yyyy-MM-dd'T'HH:mm" var="parsedModiTime" type="both"/>
                            <fmt:formatDate value="${ parsedModiTime }" pattern="yyyy-MM-dd" var="parsedModiTime2" />
                        <input class="form-control" id="bmodified_time" value="${ parsedModiTime2 }" readonly />
                    </div>
                    <%-- <div class="my-2">
                        <label class="form-label" for="image">이미지</label>
                        <c:url value="/static/assets/bannerImages/001.jpg" var="im"> </c:url>
                        <img src="${im}" class="rounded mx-auto d-block" id="image" width="100%" height="500" readonly></img>
                    </div> --%>
                </form>
                
                <div class="card-footer">
                    <c:if test="${ loginId eq 'admin' }">
                        <c:url var="boardModifyPage" value="/admin/postModify">
                            <c:param name="id" value="${ board.id }"></c:param>
                        </c:url>
                        <a class="btn btn-outline-secondary me-md-2"
                            href="${ boardModifyPage }">수정하기</a>
                    </c:if>
                </div>
            </section>
            <br/>
                <div>
                <a href="/joo/post/postList" class="btn btn-outline-secondary me-md-2">목록</a>
                </div>
        </main>
            
        </div>
    </body>
</html>
<jsp:include page="../common/footer.jsp"></jsp:include>