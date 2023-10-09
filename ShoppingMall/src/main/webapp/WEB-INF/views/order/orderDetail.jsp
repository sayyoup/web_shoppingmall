<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <title>주문 내역 상세 조회</title>
    <link rel="stylesheet" href="../static/css/myOrder.css">
</head>
<body>
    <table id="cancel-table" class="n-table table-col n-order-view" width="100%">
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
                    <th scope="col" data-column="수량">수량 <i class="fas fa-sort"></i></th>
                    <th scope="col" data-column="금액">금액 <i class="fas fa-sort"></i></th>
                    <th scope="col" data-column="취소일자">주문번호 <i class="fas fa-sort"></i></th>
                    <th scope="col" data-column="주문상태">주문일자 <i class="fas fa-sort"></i></th>
                </tr>
            </thead>
                
            <tbody>
                <c:forEach items="${ infos }" var="info">
                    <!-- 주문 날짜 가져오기 -->
                    <fmt:formatDate value="${ info.dcreated_time }" pattern="yyyyMMdd" var="orderDate" />                 
                    <!-- 주문번호 생성 (날짜 + 고유 아이디번호) -->
                    <c:set var="orderNumber" value="${orderDate}${String.format('%010d', info.id)}" />
                        <tr>
                            <td>
                                <div class="n-prd-row">
                                    <img src="${ info.ptitle_image }" alt="전통주" width="100">
                                    ${ info.pname }
                                </div>
                            </td>
                            <td>${ info.pcount }개</td>
                            <td>
                                KRW <fmt:formatNumber value="${ info.pprice }" pattern="###,###" />
                            </td>
                            <td>
                                ${ orderNumber }
                            </td>
                            <td>
                                <div class="btn-set btn-parents"><fmt:formatDate value="${ info.dcreated_time }" pattern="yyyy.MM.dd" var="created" />
                                    ${ created }
                                </div>
                            </td>
                        </tr>
                </c:forEach>
            </tbody>
        </table>
</body>
</html>