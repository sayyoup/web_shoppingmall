<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <title>배송 조회</title>
    <link rel="stylesheet" href="../static/css/delivery.css">
</head>
<body>
    <div class="container">
        <h1>배송 조회</h1><!--
        <form>
            <label for="tracking_number">송장 번호:</label>
            <input type="text" id="tracking_number" name="tracking_number">
            <button type="submit">조회</button>
        </form>-->
        
        <c:set var="addr1" value="${ info.dstreet }" />
        <c:set var="addr2" value="${ info.ddetail_address }" />
        
        <div class="tracking_result">
            <h2>조회 결과</h2>
            <p>현재 상태: ${ info.dstatus }</p>
            <p>송장 번호: ${ info.dcode }</p>
            <p>주문 일자: <fmt:formatDate value="${ info.dcreated_time }" pattern="yyyy-MM-dd HH:mm"/></p>
            <p>예상 배송일: <fmt:formatDate value="${threeDaysLater}" pattern="yyyy-MM-dd"/></p>
            <p>받는 사람: ${ info.rname }</p>
            <p>배송 주소: ${ addr1 }&nbsp;${ addr2 }</p>
        </div>
    </div>
</body>
</html>