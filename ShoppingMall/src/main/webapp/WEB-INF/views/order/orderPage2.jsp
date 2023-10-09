<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> <!-- 소수점 제거 함수를 사용하기 위해 선언한 네임스페이스 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩 -->
<title>JOO</title>

<link rel="stylesheet" href="../static/css/orderPage.css">
</head>
<body style="background-color: black; color: white;">
     <header>
            <jsp:include page="../common/header.jsp"></jsp:include>
     </header>
    <div>        
        <h3 class="text-center">주문서 작성</h3>
        
        <c:set var="count" value="10" />
        <div class="orderListArea ">
            <div class="title">
                <h4 class="body1" style="letter-spacing: 0px;">상품 정보</h4>
                <hr />
            </div>

            <div class="boardList ">
                <table border="1" summary="">
                    <thead>
                        <tr>
                            <th scope="col" class="thumb"
                                style="text-indent: -9999px;">이미지</th>
                            <th scope="col" class="product"
                                style="text-indent: -9999px;">상품정보</th>
                            <th scope="col" class="price"
                                style="text-indent: -9999px;">판매가</th>
                            <th scope="col" class="quantity"
                                style="text-indent: -9999px;">수량</th>
                        </tr>
                    </thead>
                    <tbody
                        class="xans-element- xans-order xans-order-normallist">
                        <c:forEach items="${ infos }" var="info">
                        <tr class="xans-record-">
                            <td class="thumb" style="width: 135px;">
                                <a href="/joo/product/productDetail?pid=${ info.pid }">
                                    <img src="${ info.ptitle_image }" alt=""
                                    width="100">
                            </a>
                            </td>
                            <td class="product">
                                <div class="prd-name">
                                    <a href="/joo/product/productDetail?pid=${ info.pid }"
                                        class="title5"><strong>${ info.pname }</strong></a>
                                    <div class="price"
                                        style="font-family: Pretendard, serif; margin-bottom: 10px;">
                                        <div class="discount">
                                            <strong
                                                class="body2 color-white"
                                                style="font-family: Pretendard, serif;">KRW <fmt:formatNumber value="${ info.pprice }" pattern="###,###" /></strong>
                                        </div>
                                    </div>
                                    <p class="quantity body2">수량 :
                                        ${ info.pcount }</p>
                                </div>
                            </td>

                        </tr>
                        <tr>
                            <td colspan="4">
                                <hr class="custom-hr"> <!-- hr 요소를 추가하여 내용을 구분 -->
                            </td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <main class="my-2">
                <section class="card">
                    <div data-text-content="true"
                        style="font-size: 16px;" class="">
                        <h4 class="body1" style="letter-spacing: 0px;">주문자 정보</h4>
                    </div>
                    <form class="card-body">
                        <div class="my-2">
                            <input class="form-control" id="name"
                                value="${ infos[0].uname }"
                                placeholder="주문자 성함" readonly />
                        </div>
                        <div class="my-2">
                            <input class="form-control" id="postCode"
                                value="${ infos[0].upostcode }"
                                placeholder="우편번호" readonly />
                        </div>
                        <div class="my-2">
                            <input class="form-control" id="addr"
                                value="${ infos[0].ustreet }" placeholder="주소" readonly />
                        </div>
                        <div class="my-2">
                            <input class="form-control" id="detailAddr"
                                value="${ infos[0].udetail_address }"
                                placeholder="상세주소" readonly />
                        </div>
                        <div class="my-2">
                            <input class="form-control" id="phone"
                                value="${ infos[0].uphone }"
                                placeholder="휴대폰 번호" readonly />
                        </div>
                        <div class="my-2">
                            <input class="form-control" id="email"
                                value="${ infos[0].uemail }"
                                placeholder="이메일" readonly />
                        </div>

                        <!--  <input type="text" data-min-width="60" data-min-height="30" data-text-content="true" value="010 (콤보박스)" style="color: rgb(94, 94, 94);" class=""> 
                        <input type="text" data-min-width="60" data-min-height="30" data-text-content="true" value="1234" style="color: rgb(94, 94, 94);" class="">
                        <input type="text" data-min-width="60" data-min-height="30" data-text-content="true" value="5678" style="color: rgb(94, 94, 94);" class="">
                        <br><br>
                        <input type="text" data-min-width="60" data-min-height="30" data-text-content="true" value="010 (콤보박스)" style="color: rgb(94, 94, 94);" class=""> 
                        <input type="text" data-min-width="60" data-min-height="30" data-text-content="true" value="1234" style="color: rgb(94, 94, 94);" class="">
                        <input type="text" data-min-width="60" data-min-height="30" data-text-content="true" value="5678" style="color: rgb(94, 94, 94);" class="">
                    -->

                    </form>
                </section>

                <hr />
                <section class="card">
                    <div data-text-content="true"
                        style="font-size: 16px;" class="">
                        <h4 class="body1" style="letter-spacing: 0px;">배송지 정보</h4>
                    </div>
                    <br> 
                    
                    <span class="form-check"> 
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" checked >
                            <label class="form-check-label" for="flexRadioDefault1"> 주문자 정보와 동일 </label>
                    </span> 
                    <span class="form-check"> 
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" > 
                            <label class="form-check-label" for="flexRadioDefault2"> 새로 입력 </label>
                    </span>
                    
                    <form id="recipientInfo" class="card-body">
                        <div class="my-2">
                            <input class="form-control" id="name2"
                                value="${ infos[0].uname }"
                                placeholder="수취인 성함" readonly/>
                        </div>
                        <input type="button" onclick="searchPostCode()" value="우편번호 찾기" id="searchCode" disabled /><br>
                        <div class="my-2">
                            <input class="form-control" id="postCode2"
                                value="${ infos[0].upostcode }"
                                placeholder="우편번호" readonly/>
                        </div>                        
                        <div class="my-2">
                            <input class="form-control" id="addr2"
                                value="${ infos[0].ustreet }" placeholder="주소" readonly/>
                        </div>
                        <div class="my-2">
                            <input class="form-control" id="detailAddr2"
                                value="${ infos[0].udetail_address }"
                                placeholder="상세주소" readonly/>
                        </div>
                        <div class="my-2">
                            <input class="form-control" id="phone2"
                                value="${ infos[0].uphone }"
                                placeholder="휴대폰 번호" readonly/>
                        </div>
                        <div class="my-2">
                            <textarea class="form-control" id="message"
                                placeholder="배송메시지"></textarea>
                        </div>
                        <div data-text-content="true"
                            style="font-size: 16px;" class="">사용할
                            포인트 (10,000 포인트 이상부터 사용 할 수 있습니다)</div>
                        <c:choose>
                            <c:when test="${infos[0].ucurrent_point >= 10000}">
                                <div class="my-2">
                                    <input class="form-control"
                                        id="currentPoint"
                                        value="${ infos[0].ucurrent_point }" 
                                        oninput="displayInput(); updateTotalPayment(); validateInput(this);" />
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="my-2">
                                    <input class="form-control"
                                        id="currentPoint" value="0"
                                        readonly />
                                </div>
                            </c:otherwise>
                        </c:choose>                        

                        <div data-text-content="true"
                            style="font-size: 16px;" class="">
                            (보유중인 포인트: KRW <fmt:formatNumber value="${ infos[0].ucurrent_point }" pattern="###,###" /> 원)</div>
                            
                         <fieldset>
						    <div data-text-content="true"
			                         	style="font-size: 16px;" class="">결제수단</div>
						    <div>
						      <input
						        type="radio"
						        id="payByCard"
						        name="paymentMethod"
						        value="card"
						        checked />
						      <label for="payByCard">카드결제</label>
						
						      <input type="radio" id="payByKakao" name="paymentMethod" value="kakao" />
						      <label for="payByKakao">카카오페이</label>
						    </div>
					  </fieldset>
                    </form>
                </section>
                
                <c:set var="totalPrice" value="0" />
                    <c:forEach var="info" items="${infos}">
                      <c:set var="subtotal" value="${info.pprice * info.pcount}" />
                      <c:set var="totalPrice" value="${totalPrice + subtotal}" />
                    </c:forEach>
                     
                      
                <hr />
                <div class="total">
                    <h4>
                        <strong id="current_pay_name">최종결제 금액</strong>
                    </h4>
                    <!--<div class="price"><div class="price-name">총 주문금액</div><div class="box"><strong id="total_order_price_view">18,900</strong>원 <span class="tail displaynone"><span id="total_order_price_ref_view" class="tail"></span></span></div></div>-->
                    <div>
                        <div class="price-name">상품금액</div>
                        <div class="box"
                            style="font-family: Pretendard, serif;">KRW
                            <span><fmt:formatNumber value="${ totalPrice }" pattern="###,###" /></span>
                        </div>
                    </div>
                    <div>
                        <div class="price-name">배송비</div>
                        <div class="box">
                            <span>+</span><span
                                style="font-family: Pretendard, serif;">KRW
                                <fmt:formatNumber value="3000" pattern="###,###" /></span>
                        </div>
                    </div>
                    <div class="option "
                        style="margin-bottom: 0 !important;">
                        <div class="price-name">총 할인</div>
                        <div class="box">
                            <strong
                                style="font-family: Pretendard, serif;">-</strong><strong
                                style="font-family: Pretendard, serif;">KRW
                                <c:choose>
                                    <c:when
                                        test="${infos[0].ucurrent_point >= 10000}">
                                            <span id="output"></span>
                                    </c:when>
                                    <c:otherwise>
                                            0
                                    </c:otherwise>
                                </c:choose>
                            </strong> <span class="tail displaynone"> <span
                                id="total_sale_price_ref_view"
                                class="tail"> </span>
                            </span>
                        </div>
                    </div>
                    
                    <c:set var="productPrice" value="${totalPrice}" />
                    <c:set var="shippingFee" value="3000" />
                    <c:set var="totalDiscount" value="${infos[0].ucurrent_point >= 10000 ? infos[0].ucurrent_point : 0}" />
                    
                    <div class="total-price"
                        style="margin-top: 15px !important; margin-bottom: 5px !important;">
                        <div class="price-name">최종 결제 금액</div>
                        <div class="box"
                            style="font-family: Pretendard, serif;">
                            <strong>= </strong>KRW 
                            <strong id="total_order_sale_price_view">${productPrice + shippingFee - totalDiscount}</strong>
                            <span class="tail displaynone"><span
                                id="total_order_sale_price_ref_view"
                                class="tail"></span></span>
                        </div>
                    </div>

                    <div>
                        <p>
                            ( <strong> 총 적립예정금액 </strong><span
                                id="mAllMileageSum"></span>)
                        </p>
                    </div>

                </div>
        </div>
        
        <!-- 사용자가 포인트 잘못 입력한 상태로 결제하기 버튼을 클릭했을때 보여질 모달 -->
        <div id="myModal" class="modal">
          <div class="modal-content">
            <span class="close">&times;</span>
            <h2>포인트를 잘못 입력하셨습니다.</h2>
          </div>
        </div>
        
        <!-- 사용자가 결제하기 버튼을 클릭했을때 재고가 구매수량보다 적을 때 보여질 모달 -->
        <div id="myModalStock" class="modal">
          <div class="modal-content">
            <span class="closeStock">&times;</span>
            <h2>재고가 부족합니다.</h2>
          </div>
        </div>
        
                <div class="container">
                    <div class="payment-button">
                        <button id="paymentButton" class="btn">결제하기</button>
                    </div>
                </div>
        </main>
        <br>

        </script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script> 
            const uId = ${ infos[0].uid };
            const currentPoint = parseInt("${infos[0].ucurrent_point}");
            const productPrice = ${ productPrice };
            const productShipPrice = ${productPrice + 3000};
            const point = parseInt("${productPrice * 0.05}");
            const pId = ${ infos[0].pid };
            const price = ${ infos[0].pprice };
            // const stock = ${ info.pstock };     // 장바구니 리스트 개별 재고 처리
            // const count = ${ info.pcount };     // 장바구니 리스트 개별 수량 처리
        </script>
        <script>
            var infos = [ // 주문 상품 정보 리스트
              <c:forEach var="info" items="${infos}" varStatus="status">
                { pcount: ${info.pcount}, pprice: ${info.pprice}, p_id: ${info.pid} }<c:if test="${!status.last}">,</c:if>
              </c:forEach>
              ];
            
            var stocks = [ // 재고, 판매량 업데이트 리스트
                <c:forEach var="stock" items="${infos}" varStatus="status">
                  { pcount: ${stock.pcount}, p_id: ${stock.pid} }<c:if test="${!status.last}">,</c:if>
                </c:forEach>
                ];
            
            var products = [ // 재고량 부족 모달에 사용
                <c:forEach var="product" items="${infos}" varStatus="status">
                  { pcount: ${product.pcount}, pstock: ${product.pstock}, pid: ${product.pid}, pname: "${product.pname}" }<c:if test="${!status.last}">,</c:if>
                </c:forEach>
                ];
            
        </script>
        
        <script>
          const mAllMileageSumElement = document.getElementById("mAllMileageSum");
          const mAllMileageSum = productPrice * 0.05;
          const formattedMileageSum = addCommasToNumber(mAllMileageSum);
        
          mAllMileageSumElement.textContent = formattedMileageSum + "원";
        
          function addCommasToNumber(number) {
            var parts = number.toString().split(".");
            parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            return parts.join(".");
          }
        </script>
        <script src="../static/js/orderPage/productOrder2.js"></script>
        <script src="../static/js/orderPage/searchPostCode.js"></script>
        <script src="../static/js/orderPage/payment2.js"></script>

    </div>
</body>
</html>
<jsp:include page="../common/footer.jsp"></jsp:include>