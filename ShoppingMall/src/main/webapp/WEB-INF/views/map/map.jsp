<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>map</title>
			
            <link
    			href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
    			rel="stylesheet"
    			integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
    			crossorigin="anonymous">
            <link href="${pageContext.request.contextPath}/static/css/map/map.css" rel="stylesheet">

	</head>
	<body>
	    <!--채한별 : 바디 시작하고 해더 넣어주세요 --> 
    <div>
        <header>
           <jsp:include page="../common/header.jsp"></jsp:include>
        </header>
        
        <main>
        
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.391413055593!2d127.02932487609479!3d37.49868552801561!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca157b757b7c5%3A0x168510caec9b0fa2!2z7JWE7J207Yuw7JyM!5e0!3m2!1sko!2skr!4v1687278649795!5m2!1sko!2skr" 
            width="600" height="450" style="border:0;" 
            allowfullscreen="" loading="lazy" 
            referrerpolicy="no-referrer-when-downgrade">
            </iframe>
        </main>
        
        
        
            <script
                src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
                crossorigin="anonymous"></script>
    </div>
    </body>
</html>

<!--채한별 : html 끝나고 푸터 넣어주세요 --> 
<jsp:include page="../common/footer.jsp"></jsp:include>
