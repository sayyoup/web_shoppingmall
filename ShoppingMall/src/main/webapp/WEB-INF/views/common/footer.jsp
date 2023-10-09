<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>footer</title>
			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
            <link
    			href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
    			rel="stylesheet"
    			integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
    			crossorigin="anonymous">
            <link href="${pageContext.request.contextPath}/static/css/common/footer.css" rel="stylesheet">
	</head>
	<body>
        
<footer style="background-color: #343A40; color: white;"class="fixed-down">
            <a href="/joo/"> 
        <img src="${pageContext.request.contextPath}/static/images/logoJooMain.png" alt="로고" style="width: 5%; height: auto">
            </a>    

  <div class="container">
    <div class="row">
      <div class="col-lg-4">
        <h4 class="footer-heading">Info</h4>
        <p>주랑주랑</p>
        <p>📇 주소: 서울특별시 강남구 아이티윌</p>
        <p>📞전화번호: 012-345-6789</p>
        <p>📠 팩스번호: 123-456-7890</p>
        <p>📜 사업자 등록번호: 987-65432-10</p>
        <p>👨‍👩‍👦‍👦 대표이사: 김세엽 김선아 김우현 서원준 이준혁 채한별 최태욱 </p>
      </div>
      <div class="col-lg-4">
        <h4 class="footer-heading"><img src="${pageContext.request.contextPath}/static/images/logoJooMain.png" alt="로고" style="width: 5%; height: auto">
            </h4>
        <ul class="list-unstyled">
          <li><a class="footer-link" href="/joo/product/productsList">상품</a></li>
          <br>
          <li><a class="footer-link" href="/joo/post/postList">이벤트</a></li>
          <br>
          <li><a class="footer-link" href="/joo/map/map">매장 찾기</a></li>
          <br>
          <li><a class="footer-link" href="/joo/questions/questionQnaList">문의하기</a></li>
        </ul>
      </div>
      <div class="col-lg-4">
        <h4 class="footer-heading">Follow</h4>
        <ul class="footer-social-icons">
          <li><a href="https://www.facebook.com/"><i class="fab fa-facebook-f"></i></a></li>
          <li><a href="https://twitter.com/?lang=ko"><i class="fab fa-twitter"></i></a></li>
          <li><a href="https://www.instagram.com/"><i class="fab fa-instagram"></i></a></li>
          <li><a href="https://www.youtube.com/"><i class="fab fa-youtube"></i></a></li>
        </ul>
      </div>
    </div>
  </div>

  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center">
        <p class="footer-copyright">
          &copy; 2023 주랑주랑. All Rights Reserved.
        </p>
      </div>
    </div>
  </div>
</footer>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
    
	</body>
</html>