<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
    uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩 -->
<title>joo</title>

</head>
<body>
    
    <!--채한별: 바디 시작하고 해더 넣어주세요 -->  
        <header>
           <jsp:include page="../views/common/header.jsp"></jsp:include>
        </header>

        <main class="my-1 p-5 text-bg-dark">

        <!-- 반복문으로 이벤트 자동으로 만들기 -->
        <div id="carouselExampleIndicators" class="carousel slide"
            data-b s-ride="true">
            <div class="carousel-indicators">
                <button type="button"
                    data-bs-target="#carouselExampleIndicators"
                    data-bs-slide-to="0" class="active"
                    aria-current="true" aria-label="Slide 1"></button>
                <button type="button"
                    data-bs-target="#carouselExampleIndicators"
                    data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button"
                    data-bs-target="#carouselExampleIndicators"
                    data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            
            <!-- justify-content: center; align-items: center; -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <a href="/joo/user/join"> <img
                        src="./static/assets/bannerImages/001.jpg"
                        class="d-block w-100" alt="bannerImege01">
                    </a>
                </div>
                <div class="carousel-item">
                    <a href="/joo/post/postDetail?id=2"> <img
                        src="./static/assets/bannerImages/002.jpg"
                        class="d-block w-100" alt="bannerImege02">
                    </a>
                </div>
                <div class="carousel-item">
                    <a href="/joo/post/postDetail?id=3"> <img
                        src="./static/assets/bannerImages/003.jpg"
                        class="d-block w-100" alt="bannerImege03">
                    </a>
                </div>
                <!--채한별 : 이거 참조용. 해볼게여 -->
                <%-- <div class="carousel-item">
                    <a href="/joo/post/postDetail"> 
                    <video src="${pageContext.request.contextPath}/static/video/logoMainVideo.mp4" controls muted autoplay loop alt="메인영상"  style="width: 70%; height: auto;">
                    </a>
                </div> --%>
            </div>
            <button class="carousel-control-prev" type="button"
                data-bs-target="#carouselExampleIndicators"
                data-bs-slide="prev">
                <span class="carousel-control-prev-icon"
                    aria-hidden="true"></span> <span
                    class="visually-hidden">Previous</span>
                    
            </button>
            <button class="carousel-control-next" type="button"
                data-bs-target="#carouselExampleIndicators"
                data-bs-slide="next">
                <span class="carousel-control-next-icon"
                    aria-hidden="true"></span> <span
                    class="visually-hidden">Next</span>
            </button>
        </div>

    </main>

    </div>
</body>
</html>

 <!--채한별 :  html 끝나고 나서 푸터 넣어주세요  --> 
    <footer>
       <jsp:include page="../views/common/footer.jsp"></jsp:include>
    </footer>
