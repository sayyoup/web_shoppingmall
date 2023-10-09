<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩 -->
<title>JOO</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="../static/css/myOrder.css">
<style>
.container {
    display: flex;
    justify-content: center;
    align-items: center;
}

.order-history, .cancel-history {
    margin: 0 10px; /* 일정한 간격을 조정할 수 있는 여백을 지정합니다. */
}
</style>
</head>
<body>
    <div>
        <header>
            <jsp:include page="../common/header.jsp"></jsp:include>
        </header>

        <div class="container">
            <h3 class="order-history">
                <button id="btnOrder" class="btn btn-outline-primary col-12 mx-auto">주문 내역 조회</button>
            </h3>
            <h3 class="cancel-history">
                <button id="btnCancel" class="btn btn-outline-primary col-12 mx-auto">취소 내역 조회</button>
            </h3>
        </div>

        <div class="order-filter">
            <div class="order-filter-period">
                <div class="order-filter-period__button">
                    <button type="button" class="order-filter-period__tab__button">1주일</button>
                    <button type="button" class="order-filter-period__tab__button">1개월</button>
                    <button type="button" class="order-filter-period__tab__button">3개월</button>
                    <button type="button" class="order-filter-period__tab__button">6개월</button>
                </div>
                <div class="order-filter-period__date">
                    <div class="order-filter-period__input-wrap">
                        <input type="date" class="order-filter-period__input" name="dt_fr_input" value="" placeholder="-">
                    </div>
                    <div class="order-filter-period__input-wrap">
                        <input type="date" class="order-filter-period__input" name="dt_to_input" value="" placeholder="-">
                    </div>
                </div>
                <button type="button" class="order-filter-confirm">조회하기</button>
            </div>
        </div>

        <!-- 주문 내역 조회 테이블 -->
        <table id="order-table" class="n-table table-col n-order-view" width="100%">
            <colgroup>

                <col style="width: 14.2%">
                <col style="width: 14.2%">
                <col style="width: 14.2%">
                <col style="width: 10.2%">
                <col style="width: 11%">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col" data-column="상품정보">상품정보 <i class="fas fa-sort"></i></th>
                    <th scope="col" data-column="수량">주문번호 <i class="fas fa-sort"></i></th>
                    <th scope="col" data-column="금액">주문금액(수량) <i class="fas fa-sort"></i></th>
                    <th scope="col" data-column="주문일자">주문일자 <i class="fas fa-sort"></i></th>
                    <th scope="col" colspan="2" data-column="주문 상태">&nbsp;&nbsp;주문상태 <i class="fas fa-sort"></i></th>
                </tr>
            </thead>
            
            <tbody>
                
                <c:forEach items="${ orders }" var="order">
                
                    <!-- 주문 날짜 가져오기 -->
                    <fmt:formatDate value="${ order.dcreated_time }" pattern="yyyyMMdd" var="orderDate" />                 
                    <!-- 주문번호 생성 (날짜 + 고유 아이디번호) -->
                    <c:set var="orderNumber" value="${orderDate}${String.format('%010d', order.id)}" />
                    
                    <c:set var="cancelComple" value="취소완료" />
                    <c:set var="payComple" value="결제완료" />
                    <c:set var="deliveryReady" value="배송준비중" />
                    <c:set var="deliverying" value="배송중" />
                    <c:set var="deliveryComple" value="배송완료" />
                    <c:set var="buyComple" value="구매확정" />
                    <c:if test="${ order.dstatus ne cancelComple }">
                        <tr>
                            <td>
                                <div class="n-prd-row">
                                    <a href="/joo/product/productDetail?pid=${ order.pid }" class="img-block"> <img src="${ order.ptitle_image }" alt="전통주" width="100">
                                    </a> 
                                        <ul class="info">
                                            <li class="brand">${ order.palc }%</li>
                                            <li class="name">${ order.pname }</li>
                                            <li class="option">원산지: ${ order.pregion }</li>
                                       </ul>
                                </div>
                            </td>
                            <td>
                                <c:url var="orderDetail" value="/order/orderDetail">
                                    <c:param name="id" value="${ order.id }" />
                                </c:url>
                                    <a href="${ orderDetail }" target="_blank" onclick="openWindowWithPosition2(event)">
                                        ${orderNumber}
                                    </a>
                            </td>
                            <td>
                                <span style="color: black; font-weight: bold;">KRW <fmt:formatNumber value="${order.pprice * order.pcount}" pattern="###,###" /></span>
                                <br>
                                <span class="txt-default">${ order.pcount }개</span>
                            </td>
                            <td>
                                <span style="color: black; font-weight: bold;"><fmt:formatDate value="${ order.dcreated_time }" pattern="yyyy.MM.dd" var="created" />
                                ${ created }
                                </span>
                            </td>
                            
                            <td class="txt-lighter">
                                <div class="btn-set btn-parents">
                                    <c:choose>
                                        <c:when test="${order.dstatus eq payComple }"> <!-- 결제완료 -->
                                             <div style="color: black; font-weight: bold;">
                                                &nbsp;&nbsp;&nbsp;${ order.dstatus }&nbsp;&nbsp;&nbsp;
                                             </div>
                                             <c:url var="deliveryCheck" value="/order/deliveryCheck">
                                                <c:param name="id" value="${ order.id }" />
                                             </c:url>
                                                <a href="${ deliveryCheck }" target="_blank" onclick="openWindowWithPosition(event)">
                                                    <button id="del1" type="button" class="btn btn-primary btn-sm float-right ml-2" >배송조회</button>
                                                </a>
                                                &nbsp;&nbsp;&nbsp;
                                             <button id="cancelOrderButton" type="button" class="btn btn-danger btn-sm float-right" 
                                                     data-orderid="${order.id}" data-userid="${order.uid}" data-discount="${order.odiscount_price}"
                                                     data-productid="${order.pid}" data-count="${order.pcount}" data-oid="${ order.oid }">
                                                     주문취소
                                            </button>

                                                <!-- 주문 취소 모달 -->
                                                <div id="cancelOrderModal" class="modal">
                                                    <div class="modal-content">
                                                        <span class="close">&times;</span>
                                                        <h2>주문 취소 확인</h2>
                                                        <p><h5>주문을 취소하시겠습니까?</h5></p>
                                                        <p><h6> (주문번호가 같은 상품들은 일괄 취소됩니다.)</h6></p>
                                                        <button id="confirmCancel">확인</button>
                                                    </div>
                                                </div>
                                        </c:when>
                                        <c:when test="${order.dstatus eq deliveryReady }"> <!-- 배송준비중 -->
                                             <div style="color: black; font-weight: bold;">
                                                ${ order.dstatus }&nbsp;&nbsp;&nbsp;
                                             </div> 
                                             <c:url var="deliveryCheck" value="/order/deliveryCheck">
                                                <c:param name="id" value="${ order.id }" />
                                             </c:url>
                                                <a href="${ deliveryCheck }" target="_blank" onclick="openWindowWithPosition(event)">
                                                    <button id="del2" type="button" class="btn btn-primary btn-sm float-right ml-2" >배송조회</button>
                                                </a>
                                                &nbsp;&nbsp;&nbsp;
                                             <div class="cancelBan">취소불가</div>
                                        </c:when>
                                        <c:when test="${order.dstatus eq deliverying }">  <!-- 배송중 -->
                                             <div style="color: black; font-weight: bold;">
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ order.dstatus }&nbsp;&nbsp;&nbsp;
                                             </div>
                                             <c:url var="deliveryCheck" value="/order/deliveryCheck">
                                                <c:param name="id" value="${ order.id }" />
                                             </c:url>
                                                <a href="${ deliveryCheck }" target="_blank" onclick="openWindowWithPosition(event)">
                                                    <button id="del3" type="button" class="btn btn-primary btn-sm float-right ml-2" >배송조회</button>
                                                </a>
                                                &nbsp;&nbsp;&nbsp;
                                              <div class="cancelBan">취소불가</div>
                                        </c:when>
                                        <c:when test="${order.dstatus eq deliveryComple }"> <!-- 배송완료 -->
                                             <div style="color: black; font-weight: bold;">
                                                &nbsp;&nbsp;&nbsp;${ order.dstatus }&nbsp;&nbsp;&nbsp;
                                             </div> 
                                             <c:url var="deliveryCheck" value="/order/deliveryCheck">
                                                <c:param name="id" value="${ order.id }" />
                                             </c:url>
                                                <a href="${ deliveryCheck }" target="_blank" onclick="openWindowWithPosition(event)">
                                                    <button id="del4" type="button" class="btn btn-primary btn-sm float-right ml-2" >배송조회</button>
                                                </a>
                                                &nbsp;&nbsp;&nbsp;
                                              <button id="confirmOrderButton" type="button" class="btn btn-danger btn-sm float-right" 
                                                      data-confirmid="${order.id}" data-point="${order.opoint}" data-userid2="${order.uid}">구매확정
                                              </button>
                                              
                                              <!-- 구매 확정 모달 -->
                                              <div id="confirmOrderModal" class="modal">
                                                <div class="modal-content">
                                                    <span class="closeOrder">&times;</span>
                                                        <h2>구매 확정 확인</h2>
                                                            <p><h5>구매를 확정하시겠습니까?</h5></p>
                                                            <p><h6>(주문번호가 같은 상품들은 일괄 구매확정됩니다.)</h6>
                                                                <button id="confirmOrder">확인</button>
                                                </div>
                                              </div>
                                        </c:when>
                                        <c:otherwise>
                                             <div style="color: black; font-weight: bold;">
                                                &nbsp;&nbsp;&nbsp;${ order.dstatus }&nbsp;&nbsp;&nbsp;
                                             </div> 
                                             <!-- <a href="/joo/order/deliveryCheck" target="_blank"> -->
                                             <c:url var="deliveryCheck" value="/order/deliveryCheck">
                                                <c:param name="id" value="${ order.id }" />
                                             </c:url>
                                                <a href="${ deliveryCheck }" target="_blank" onclick="openWindowWithPosition(event)">
                                                    <button id="del5" type="button" class="btn btn-primary btn-sm float-right ml-2" >배송조회</button>
                                                </a>
                                                &nbsp;&nbsp;&nbsp;
                                                <button id="writeReview" type="button" class="btn btn-danger btn-sm float-right"
                                                data-pid="${order.pid}" data-uid="${order.uid}" data-oid="${order.oid}">후기작성</button>
                                        </c:otherwise>
                                    </c:choose>
                                    
                                   <%--  ${ order.dstatus } <a href="https://tracker.delivery/#/kr.epost/6113101024721" target="_blank">
                                        <button type="button" class="btn btn-primary btn-sm float-right ml-2" onclick="openWindowWithPosition('https://tracker.delivery/#/kr.epost/6113101024721')">배송조회</button>
                                                       </a>
                                    <button id="cancelOrderButton" type="button" class="btn btn-danger btn-sm float-right">주문취소</button>

                                    <!-- 주문 취소 모달 -->
                                    <div id="cancelOrderModal" class="modal">
                                        <div class="modal-content">
                                            <span class="close">&times;</span>
                                            <h2>주문 취소 확인</h2>
                                            <p>주문을 취소하시겠습니까?</p>
                                            <button id="confirmCancel">확인</button>
                                        </div>
                                    </div> --%>

                                </div>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
            </tbody>
        </table>

        <!-- 취소 내역 조회 테이블 -->
        <table id="cancel-table" class="n-table table-col n-order-view" width="100%" style="display: none;">
            <colgroup>
                <col style="width: 14.2%">
                <col style="width: 14.2%">
                <col style="width: 14.2%">
                <col style="width: 10.2%">
                <col style="width: 11%">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col" data-column="상품정보">상품정보 <i class="fas fa-sort"></i></th>
                    <th scope="col" data-column="수량">주문번호 <i class="fas fa-sort"></i></th>
                    <th scope="col" data-column="금액">주문금액(수량) <i class="fas fa-sort"></i></th>
                    <th scope="col" data-column="취소일자">취소일자 <i class="fas fa-sort"></i></th>
                    <th scope="col" colspan="2" data-column="주문상태">&nbsp;&nbsp;주문상태 <i class="fas fa-sort"></i></th>
                </tr>
            </thead>
                
            <tbody>
                <c:forEach items="${ orders }" var="order">
                
                    <!-- 주문 날짜 가져오기 -->
                    <fmt:formatDate value="${ order.dcreated_time }" pattern="yyyyMMdd" var="orderDate" />                 
                    <!-- 주문번호 생성 (날짜 + 고유 아이디번호) -->
                    
                    <c:set var="orderNumber" value="${orderDate}${String.format('%010d', order.id)}" />
                
                    <c:if test="${order.dstatus eq cancelComple }">
                        <tr>
                            <td>
                                <div class="n-prd-row">
                                    <a href="/joo01/product/productDetail" class="img-block"> <img src="${ order.ptitle_image }" alt="전통주" width="100">
                                    </a>
                                    <ul class="info">
                                            <li class="brand">${ order.palc }%</li>
                                            <li class="name">${ order.pname }</li>
                                            <li class="option">원산지: ${ order.pregion }</li>
                                       </ul>
                                </div>
                            </td>
                            <td>
                                <c:url var="orderDetail" value="/order/orderDetail">
                                    <c:param name="id" value="${ order.id }" />
                                </c:url>
                                    <a href="${ orderDetail }" target="_blank" onclick="openWindowWithPosition2(event)">
                                        ${orderNumber}
                                    </a>
                            </td>
                            <td>
                                <span style="color: black; font-weight: bold;">KRW <fmt:formatNumber value="${order.pprice * order.pcount}" pattern="###,###" /></span>
                                <br>
                                <span class="txt-default">${ order.pcount }개</span>
                            </td>
                            <td>
                                <%-- <fmt:formatDate value="${ order.dcreated_time }" pattern="yyyy.MM.dd" var="created" />
                                ${ created }
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --%>
                                <span style="color: black; font-weight: bold;"><fmt:formatDate value="${order.dmodified_time}" pattern="yyyy.MM.dd" var="cancelDate" />
                                    ${cancelDate}
                                </span>
                            </td>
                            <td class="txt-lighter" style="text-align: center;">
                                <div class="btn-set btn-parents">${ order.dstatus }</div>
                            </td>
                        </tr>
                    </c:if>

                </c:forEach>
            </tbody>
        </table>

        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>        
            // 테이블 정렬을 위한 변수 설정
            let sortOrder = {
              '상품정보': null,
              '수량': null,
              '금액': null,
              '주문일자': null,
              '주문상태': null
            };
            let cancelSortOrder = {
            		  '상품정보': null,
            		  '수량': null,
            		  '금액': null,
            		  '취소일자': null,
            		  '주문상태': null
            		};
        </script>
        <script src="../static/js/orderPage/myOrder.js"></script>
        <script>  // 후기 작성 버튼 클릭 요소
        const writeReviewButtons = document.querySelectorAll('[data-pid]'); // 후기작성 버튼
        const btnReview = document.querySelector('button#writeReview');
           
        // 모든 후기 작성  버튼에 대해 이벤트 리스너를 등록.
        writeReviewButtons.forEach(function(button) {
          button.addEventListener('click', function() {
            const pid = button.getAttribute('data-pid'); // 상품 아이디
            const uid = button.getAttribute('data-uid'); // 유저 아이디
            const oid = button.getAttribute('data-oid'); // 주문 아이디
            
            // 후기 작성 로직 작성
            // AJAX 요청 또는 페이지 이동 등 후기 작성 동작 수행
            
            console.log('후기작성');
            console.log('구매 확정시 누적, 현재 포인트 적립 시작');
            const reqUrl = `/joo/review/api/create`;
            const data = { pid, uid, oid };
            axios.post(reqUrl, data)
              .then((response) => {
                console.log(response);
                console.log(uid + "후기 작성버튼 작동!");
                window.location.href = `/joo/review/create`;
              })
              .catch((error) => {
                console.log(uid + "후기 작성버튼 안눌림");
                console.log(error);
              });
          });
        });
        </script>
    


    </div>
</body>
</html>
<jsp:include page="../common/footer.jsp"></jsp:include>