/**
 * pointAndStock.js
 * 주문 취소 / 구매 확정 시 포인트, 재고, 판매량 변화 업데이트.
 * orderHistory.jsp에 포함.
 */ 
 
/* 
    $(document).ready(function() {
      // 결제완료 버튼 클릭 시 이벤트 핸들러 등록
      $("#confirmCancel").click(function() {
        submitOrder();
      });
    });
    
    function submitOrder() {
      // ...
    
      $.ajax({
        url: "/joo/api/order/order",
        method: "POST",
        contentType: "application/json",
        data: JSON.stringify({
          p_id: pId,
          o_id: oId,
          pcount: pCount,
          pprice: price
        }),
        success: function(response) {
          // 성공적으로 데이터를 전송한 경우에 실행할 동작을 여기에 작성
          orderId = response;
          console.log("Order data inserted successfully.");
          
        },
        error: function(error) {
          // ...
        }
      });
    }*/