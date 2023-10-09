/**
 * productOrder.js
 * 배송지 정보 처리(주문자 정보와 같게, 새로 입력)
 * productOrder.jsp에 포함
 */


document.addEventListener('DOMContentLoaded', function () {
        
    const inputName = document.querySelector('input#name2').value;
    const inputPostCode = document.querySelector('input#postCode2').value;
    const inputAddr = document.querySelector('input#addr2').value;
    const inputDetailAddr = document.querySelector('input#detailAddr2').value;
    const inputPhone = document.querySelector('input#phone2').value;
    
    const sameOrderer = document.querySelector('input#flexRadioDefault1'); // 주문자 정보와 동일 라디오 버튼의 요소를 가져옴.
    const newInput = document.querySelector('input#flexRadioDefault2'); // 새로 입력 라디오 버튼의 요소를 가져옴.
    
    sameOrderer.addEventListener('click', () => {
        
        document.getElementById("name2").value = inputName; // 인풋의 값을 주문자 정보와 같게 입력
        document.getElementById("postCode2").value = inputPostCode;
        document.getElementById("addr2").value = inputAddr;
        document.getElementById("detailAddr2").value = inputDetailAddr;
        document.getElementById("phone2").value = inputPhone;
        
        document.getElementById("searchCode").disabled = true;  // 우편번호 찾기 비활성화
        document.getElementById("name2").readOnly = true;   // readonly 활성화
        document.getElementById("postCode2").readOnly = true;
        document.getElementById("addr2").readOnly = true;
        document.getElementById("detailAddr2").readOnly = true;
        document.getElementById("phone2").readOnly = true;
    });
    
    newInput.addEventListener('click', () => {
       
        document.getElementById("name2").value = ""; // 인풋의 값을 빈문자열로 초기화
        document.getElementById("postCode2").value = "";
        document.getElementById("addr2").value = "";
        document.getElementById("detailAddr2").value = "";
        document.getElementById("phone2").value = "";
        
        console.log('readOnly false');
        
        document.getElementById("searchCode").disabled = false; // 우편번호 찾기 활성화
        document.getElementById("name2").readOnly = false;  // readonly 비활성화, input에 입력 가능
        document.getElementById("detailAddr2").readOnly = false;
        document.getElementById("phone2").readOnly = false;
    });
    
      /*const myModal = document.getElementById("myModal"); // 포인트 모달창 요소를 가져옴.
      const closeBtn = document.getElementsByClassName("close")[0]; // 포인트 모달 창을 닫는 요소를 가져옴.
      
      const myModalStock = document.getElementById("myModalStock"); // 포인트 모달창 요소를 가져옴.
      const closeBtnStock = document.getElementsByClassName("closeStock")[0]; // 포인트 모달 창을 닫는 요소를 가져옴.
      
      const paymentButton = document.getElementById("paymentButton"); // 결제하기 버튼 요소를 가져옴.
      // 결제하기 버튼 클릭 이벤트 핸들러
      paymentButton.addEventListener("click", function() {
        console.log('결제하기 버튼 클릭');
        const inputPoint = parseInt(document.getElementById("currentPoint").value);
        // const currentPoint = parseInt("<%= user.ucurrent_point %>");
        // 포인트 유효성 검사
        if (inputPoint != 0) {
            if (isNaN(inputPoint) || inputPoint < 10000 || inputPoint > currentPoint) { // 숫자가 아니거나 10000포인트 미만이거나 현재 포인트보다 클 때
              console.log(inputPoint);
              console.log(currentPoint);
              console.log('포인트 잘못 입력');
              
              myModal.style.display = "block";
            } else {
              console.log('포인트 정상 입력');
              // 여기에 결제 처리 코드를 작성.
              // 포인트가 유효한 경우 결제 로직을 수행.
              // 예: form submit 등
            } 
        } 
      });*/
    
      // 모달 창 닫기 버튼 클릭 이벤트 핸들러
      closeBtn.addEventListener("click", function() {
      // 모달 창을 닫음.
      console.log('포인트 모달 닫기');
      myModal.style.display = "none";
      });
      
      // 모달 창 닫기 버튼 클릭 이벤트 핸들러
      closeBtnStock.addEventListener("click", function() {
      // 모달 창을 닫음.
      console.log('모달 닫기');
      myModalStock.style.display = "none";
      });
    
});
    
    function addCommasToNumber(number) {
      var parts = number.toString().split(".");
      parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
      return parts.join(".");
    }
    
    // 최종결제 금액의 총 할인에서 내가 사용할 포인트가 즉시 적용돼서 보이게하는 함수.
    function displayInput() {
      var currentPoint = document.getElementById("currentPoint").value;
      document.getElementById("output").textContent = addCommasToNumber(currentPoint);
    }
  
    // 처음 orderPage.jsp가 로드될 때부터 총 할인이 즉시 보이게 함. 
    window.onload = function () {
        var currentPoint = document.getElementById("currentPoint").value;
        document.getElementById("output").textContent = currentPoint;
    };
    
    // 최종결제 금액: 입력한 포인트를 계산해서 즉시 반영.
    function updateTotalPayment() {
      const shippingFee = 3000;
      const currentPoint = parseInt(document.getElementById("currentPoint").value);
      const totalDiscount = currentPoint >= 10000 ? currentPoint : 0;
      const finalPayment = productPrice + shippingFee - totalDiscount;
    
      document.getElementById("total_order_sale_price_view").textContent = addCommasToNumber(finalPayment);
    }
   
   // 사용할 포인트 input에 숫자 이외에 문자는 받지 않음.
   function validateInput(input) {
   // 숫자 이외의 값 제거
   input.value = input.value.replace(/[^0-9]/g, '');
  }
  
  window.onload = function () {
      var currentPoint = document.getElementById("currentPoint").value;
      document.getElementById("output").textContent = addCommasToNumber(currentPoint);
    };
      
