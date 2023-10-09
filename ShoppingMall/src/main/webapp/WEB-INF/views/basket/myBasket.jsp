<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		 <meta name="viewport" content="width=device-width, initial-scale=1" />
		<title>basket</title>
      <link rel="stylesheet" href="../static/css/basket.css">
		<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
    crossorigin="anonymous">
<style>
   
   #basketProductList {
    width: 58%;
    height: 150px;
  }
 #priceTable {
    width: 60%;
    height: 100px;
  }
 .btnPlus{
    background-color: #cccccc;
    font-weight:bold;
    color: black; 
    border: none; /* 테두리 없앰 */
    font-size: 13px;
    border-radius: 5px; /* 모서리 둥글게 */
  }
  .btnMinus{
    background-color: #cccccc;
    font-weight:bold;
    color: black; 
    border: none; /* 테두리 없앰 */
    font-size: 13px;
    border-radius: 5px; /* 모서리 둥글게 */
  }
 .orderAll {
    background-color: #b3b3b3;
    color: black;        
    border: none;         /* 테두리 없앰 */
    padding: 5px 10px;
    font-size: 14px;
    border-radius: 5px;   /* 모서리 둥글게 */
    width: 150px;         /* 가로 크기 150px로 조정 */
     
  
  }
 
 #btnDelete{
    background-color: #cccccc;
    color: white; /* 흰색 글씨 */
    border: none; /* 테두리 없앰 */
    padding: 5px 10px;
    font-size: 14px;
    border-radius: 5px; /* 모서리 둥글게 */
  }
 
 #btndeleteAll{
    background-color: #cccccc;
    color: white;         /* 흰색 글씨 */
    border: none;         /* 테두리 없앰 */
    padding: 5px 10px;
    font-size: 14px;
    border-radius: 5px;   /* 모서리 둥글게 */
    width: 150px;         /* 가로 크기 150px로 조정 */
    
  }
.userBasket {
     display: flex;
  justify-content: center;
  }
.find-btn{
 text-align: center;
}
.find-btn1{
 display :inline-block;
}
 
</style>
	</head>
	<body>
        <header>
           <jsp:include page="../common/header.jsp"></jsp:include>
        </header>
        <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
        
        <div class="py-3">
<c:choose>
    <c:when test="${empty basketproducts}">
        <div style="text-align:center; margin-top: 80px" class="basketProductNull">
            <p>장바구니에 담긴 상품이 없습니다.</p>
        </div>
        <div style="text-align:center; margin-bottom: 80px">
            <a class="btn btn-outline-primary" href="/joo/product/productsList">상품 보러가기</a>
        </div>
    </c:when>
    <c:otherwise>
    <div class="main1">
         <div class="userBasket">
             <h1>
                <sec:authorize access="isAuthenticated()">
                   <p><sec:authentication property="principal.username"/>의 장바구니</p>
                </sec:authorize>
             </h1>
         </div>
     </div>
     <main class="${empty basketproducts ? 'hidden' : ''}" id="main2">		
		 <input type="hidden" id="basketId" name="basketId" value="${ basketId }">
			<form id="deleteForm">
				<table id="basketProductList" class="table table-hover" style="margin-left: auto; margin-right: auto;">
					<thead  style="text-align:center" class="thead">
						<tr>
                            <th>사진</th>
							<th>상품이름</th>
							<th>가격</th>
							<th>수량</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody  style="text-align:center">
                        <c:set var="totalPrice" value="0" />
						<c:forEach items="${basketproducts }" var="basketproduct">	
                        			
								<tr class="text-center align-middle">
                                    <input type="hidden" value="${ basketproduct.p_id }" class="p_id" data-id="${ basketproduct.p_id }" />  
               						<td class="thumb" style="width: 135px;">
                                       <img src="${ basketproduct.ptitle_image  }" alt=""
                                    width="100">
                                   </td>			
									<td>${ basketproduct.pname }</td>
									<td>
                                       <fmt:formatNumber value="${ basketproduct.pprice }" pattern="###,###" />원
                                    </td>
         
									<td>
                                        <button class="btnMinus" data-id="${ basketproduct.p_id }">-</button>
                                          <span class="count">${ basketproduct.pcount }</span>
                                          <input type="hidden" class="pcount" value="${ basketproduct.pcount }"/>
                                        <button class="btnPlus"  data-id="${ basketproduct.p_id }">+</button>
                                    </td>
									<td><button id="btnDelete" class="btnDelete" data-id="${ basketproduct.id }">삭제하기</button></td>
								</tr>
                       <c:set var="totalPrice" value="${totalPrice + (basketproduct.pprice * basketproduct.pcount)}" />		
						</c:forEach>	
                      				
					</tbody>
				</table>
			</form>	
                
                <table id="priceTable" class="table table-hover" style="margin-left: auto; margin-right: auto;">
                 <c:set var="totalPriceOrderPrice" value="0" />
                   <thead style="text-align:center ">
                       <tr>
                          <th>총 제품 가격</th>
                          <th>+</th>
                          <th>배송비</th>
                          <th>=</th>
                          <th>총 예상 금액</th>
                       </tr>
                    </thead>
                    <tbody style="text-align:center">
                        <tr ><c:set var="totalPriceOrderPrice" value="${totalPrice + (3000)}" />
                           <td><fmt:formatNumber value="${ totalPrice }" pattern="###,###" /> 원 </td>
                           <td>+</td>
                           <td>3,000 원</td>
                           <td>=</td>
                           <td><fmt:formatNumber value="${ totalPriceOrderPrice}" pattern="###,###" />원 </td>
                        </tr>
                    </tbody>
                </table>
    
       <div class="find-btn">
          <a href="/joo/order/orderPage2"><button class="orderAll" type="button">전체 주문</button></a>
          <button type="button" id="btndeleteAll" class="btndeleteAll"  >전체 삭제</button>
       </div>
    
 
  </main>
    </c:otherwise>
</c:choose>
        </div>
	
                
	    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
 <script>
 // 버튼과 수량 요소 선택
 var btnPlus = document.querySelectorAll('.btnPlus');
 var btnMinus = document.querySelectorAll('.btnMinus');
 var count = document.querySelectorAll('.count');

 // 버튼 클릭 이벤트 처리
 for (var i = 0; i < btnPlus.length; i++) {
   btnPlus[i].addEventListener('click', function() {
	   event.preventDefault();
     var currentCount = parseInt(this.parentNode.querySelector('.count').innerHTML);
     if (currentCount < 5) {
       var newCount = currentCount + 1;
       this.parentNode.querySelector('.count').innerHTML = newCount;
     } else {
       alert('최대 수량은 5입니다.');
     }

     const b_id = document.querySelector('#basketId').value;
     console.log('b_id = ' + b_id);
     const p_id = this.getAttribute('data-id');
     console.log('p_id = ' + p_id);
     const pcount = this.parentNode.querySelector('.count').innerHTML;
     console.log('pcount = ' + pcount);
     
     axios
     	.post('/joo/user/updateQuantity', {b_id, p_id, pcount})
     	.then(resp => {
     		console.log(resp.data);
     		location.reload();
     	})
     	.catch(e => {
     		alert(e);
     		console.log(e);
     	});
     
   });
 }

 for (var i = 0; i < btnMinus.length; i++) {
	  btnMinus[i].addEventListener('click', function(event) {
	    event.preventDefault(); // 폼 제출 기본 동작 막기
	    var currentCount = parseInt(this.parentNode.querySelector('.count').innerHTML);
	    if (currentCount > 1) {
	      var newCount = currentCount - 1;
	      this.parentNode.querySelector('.count').innerHTML = newCount;
	    } else {
	      alert('최소 수량은 1입니다.');
	    }
	    
	    const b_id = document.querySelector('#basketId').value;
	     console.log('b_id = ' + b_id);
	     const p_id = this.getAttribute('data-id');
	     console.log('p_id = ' + p_id);
	     const pcount = this.parentNode.querySelector('.count').innerHTML;
	     console.log('pcount = ' + pcount);
	     
	     axios
	     	.post('/joo/user/updateQuantity', {b_id, p_id, pcount})
	     	.then(resp => {
	     		console.log(resp.data);
	     		location.reload();
	     	})
	     	.catch(e => {
	     		alert(e);
	     		console.log(e);
	     	});
	  });
	}
 </script>

   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script>
    $(document).ready(function() {
        $("#btndeleteAll").click(function() {
            // 삭제 여부 확인 대화상자 표시
            if (confirm("정말 전체 삭제하시겠습니까?")) {
                // 사용자가 "예" 버튼을 클릭한 경우
                $.ajax({
                    url: "/joo/user/deleteAll",
                    type: "POST",
                    success: function(result) {
                        // 삭제 후 처리할 내용
                        alert('전체 삭제 완료');
                        window.location.href = "/joo/user/myBasket"; // 장바구니 리스트 페이지로 리다이렉트
                    },
                    error: function(xhr, status, error) {
                        alert(error);
                    }
                });
            } else {
                // 사용자가 "아니오" 버튼을 클릭한 경우
                // 아무 동작도 수행하지 않음
            }
        });
    });

    </script>
    	 <script src="../static/js/basketPage/basketproduct-delete.js"></script>
      
       <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>	
        
 </body>
</html>
  <footer>
       <jsp:include page="../common/footer.jsp"></jsp:include>
    </footer>
