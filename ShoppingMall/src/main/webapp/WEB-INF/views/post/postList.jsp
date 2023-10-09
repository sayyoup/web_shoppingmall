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
<style>
    .pagination-container {
        display: flex;
        justify-content: center;
        background-color: #f4f4f4;
        padding: 10px;
    }
    
    .pagination {
        list-style-type: none;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center; /* 페이지 번호를 가운데 정렬합니다. */
        align-items: center; /* 페이지 번호를 수직 가운데 정렬합니다. */
    }
    
    .pagination li {
        display: inline-block;
        margin-right: 0; /* 간격 없이 붙어있도록 오른쪽 마진을 제거합니다. */
    }
    
    .pagination li a {
        display: inline-block;
        padding: 8px 12px;
        background-color: #fff;
        color: #333;
        border: 1px solid #ccc;
        text-decoration: none;
        border-radius: 3px;
    }
    
    .pagination li a:hover {
        background-color: #eaeaea;
    }
    
    .pagination li.active a,
    .pagination li a:active {
        background-color: #ccc;
        color: #fff;
        border-color: #ccc;
        cursor: default;
    }
    
    .pagination li a:focus {
        outline: none; /* 기본 포커스 효과를 제거합니다. */
    }
</style>

            
    </head>
    <body>
        <div>
        <header>
           <jsp:include page="../common/header.jsp"></jsp:include>
        </header>

           <ul class="nav nav-tabs">
                <!-- <li class="nav-item"><a class="nav-link" href="/joo/post/postList">공지사항/이벤트</a></li> -->
                <li class="nav-item"><a class="nav-link" href="/joo/post/postList">전체보기</a></li>
                <li class="nav-item"><a class="nav-link" href="/joo/post/postNotice">공지사항</a></li>
                <li class="nav-item"><a class="nav-link" href="/joo/post/postEvent">이벤트</a></li>
            </ul>
        <main>
            
            <div class="card text-center text-bg-light mb-3"">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <!-- <th scope="col">번호</th> -->
                                <th scope="col">타입</th>
                                <th scope="col">제목</th>
                                <th scope="col">내용</th>
                                <th scope="col">등록 일자</th>
                                <th scope="col">종료 일자</th>
                                <th scope="col">조회수</th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach items="${ boards }" var="board">
                                <tr class="odd gradex">
                                    <%-- <td>${ board.id }</td> --%>
                                    <td>${ board.btype }</td>
                                    <td><c:url var="postDetailPage" value="/post/postDetail">
                                            <c:param name="id" value="${ board.id }" />
                                        </c:url> <a class="link-secondary" href="${ postDetailPage }">${ board.btitle }</a></td>
                                    <td>${ board.bcontent }</td>
                                    <%-- <td>${ board.bcreated_time }</td> --%>
                                    
                                    <td>
                                    <fmt:parseDate value="${ board.bcreated_time }"
                                            pattern="yyyy-MM-dd'T'HH:mm" var="parsedCreTime" type="both"/>
                                    <fmt:formatDate value="${ parsedCreTime }" pattern="yyyy-MM-dd" />
                                    </td>
                                    
                                    <td>
                                    <fmt:parseDate value="${ board.bmodified_time }"
                                            pattern="yyyy-MM-dd'T'HH:mm" var="parsedModiTime" type="both"/>
                                    <fmt:formatDate value="${ parsedModiTime }" pattern="yyyy-MM-dd" />
                                    </td>
                                    <%-- <td><fmt:formatDate value="${ board.bmodified_time }"
                                            pattern="yyyy-MM-dd HH:mm:ss" /></td> --%>
                                    <td>${ board.bviewed }</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <c:if test="${ loginId eq 'admin' }">
                        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                            <a href="/joo/admin/postCreate" class="btn btn-outline-secondary me-md-2">등록</a>
                        </div>
                    </c:if>
                    <%-- <h3>${ pageMaker }</h3> --%>
                    <form id="searchForm" action="/joo/post/postList" method="get">
                        <select name="category">
                            <option value="" ${ pageMaker.cri.category == null ? "selected" : "" }>전체</option>
                            <option value="T" ${ pageMaker.cri.category eq 'T' ? "selected" : "" }>제목</option>
                            <option value="C" ${ pageMaker.cri.category eq 'C' ? "selected" : "" }>내용</option>
                            <option value="TC" ${ pageMaker.cri.category eq 'TC' ? "selected" : "" }>제목+내용</option>

                        </select> 
                            <input type="text" name="keyword" value="${ pageMaker.cri.keyword }"> 
                            <input type="hidden" name="pageNum" value="${ pageMaker.cri.pageNum }"> 
                            <input type="hidden" name="amount" value="${ pageMaker.cri.amount }">
                        <button class="btn btn-outline-secondary">검색</button>
                    </form>

                    <h3></h3>

                    <div class="pull-right">
                        <ul class="pagination">
                            <c:if test="${ pageMaker.prev }">
                                <li class="page-item"><a class="page-link"
                                    href="${ pageMaker.startPage -1 }"> 이전 </a>
                                </li>
                            </c:if>
                            <c:forEach begin="${ pageMaker.startPage }"
                                end="${ pageMaker.endPage }" var="num">
                                <li class="page-item ${ pageMaker.cri.pageNum == num ? "active" : "" } ">
                                    <a class="page-link" href="${ num }">${ num }</a>
                                </li>
                            </c:forEach>
                            <c:if test="${ pageMaker.next }">
                                <li class="page-item"><a class="page-link"
                                    href="${ pageMaker.endPage +1 }"> 다음 </a></li>
                            </c:if>
                        </ul>
                    </div>
                    <form id="actionForm" action="/joo/post/postList" method="get">
                        <input type="hidden" name="pageNum" value="${ pageMaker.cri.pageNum }" /> 
                        <input type="hidden" name="amount" value="${ pageMaker.cri.amount }" /> 
                        <input type="hidden" name="category" value="${ pageMaker.cri.category }" />
                        <input type="hidden" name="keyword" value="${ pageMaker.cri.keyword }" />
                    </form>
                </div>
            </div>
        </main>
            
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" ></script>
            
            <script type="text/javascript">
            $(document).ready(function() {
                var actionForm = $("#actionForm");
                
                $(".page-link").on("click", function(e){
                    e.preventDefault();
                    
                    var targetPage = $(this).attr("href");
                    console.log(targetPage);
                    
                    actionForm.find("input[name='pageNum']").val(targetPage);
                    actionForm.submit();
                    
                });
            
                var searchForm = $("#searchForm");
                
                $("#searchForm button").on("click", function (e) {
                    
                    e.preventDefault();
                    console.log("click");
                    searchForm.find("input[name='pageNum']").val(1);
                    searchForm.submit();
                });
            });
            
            </script>
        </div>
    </body>
</html>
<jsp:include page="../common/footer.jsp"></jsp:include>