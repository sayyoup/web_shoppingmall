/**
 * myOrder.js
 * 주문 내역 조회 / 취소 내역 조회
 * orderHistory.jsp에 포함.
 */

document.addEventListener('DOMContentLoaded', () => {

    // 주문 내역 조회 / 취소 내역 조회 버튼을 찾음.
    const btnOrder = document.querySelector('button#btnOrder');
    const btnCancel = document.querySelector('button#btnCancel');

    // 주문 내역 조회 버튼 클릭 시
    btnOrder.addEventListener('click', () => {

        console.log('주문 내역 조회 버튼 클릭')

        resetFilters();
        showAllRows();
        document.getElementById("order-table").style.display = "table";
        document.getElementById("cancel-table").style.display = "none";
    })

    // 취소 내역 조회 버튼 클릭 시
    btnCancel.addEventListener('click', () => {

        console.log('취소 내역 조회 버튼 클릭')

        resetFilters();
        showAllRows();
        document.getElementById("order-table").style.display = "none";
        document.getElementById("cancel-table").style.display = "table";
    })

    // 조회하기 버튼 클릭 시 이벤트 핸들러
    document.querySelector('.order-filter-confirm').addEventListener('click', function() {
        // 선택한 기간에 해당하는 주문일자 필터링
        var startDate = document.querySelector('input[name="dt_fr_input"]').value;
        var endDate = document.querySelector('input[name="dt_to_input"]').value;
        var orders = document.querySelectorAll('#order-table tbody tr');
        var cancels = document.querySelectorAll('#cancel-table tbody tr');

        orders.forEach(function(order) {
            var orderDate = order.querySelector('td:nth-child(4)').textContent;
            order.style.display = isOrderDateInRange(orderDate, startDate, endDate) ? 'table-row' : 'none';
        });

        cancels.forEach(function(cancel) {
            var cancelDate = cancel.querySelector('td:nth-child(4)').textContent;
            cancel.style.display = isCancelDateInRange(cancelDate, startDate, endDate) ? 'table-row' : 'none';
        });

    });

    // 주문일자가 선택한 기간 내에 있는지 확인하는 함수
    function isOrderDateInRange(orderDate, startDate, endDate) {
        var orderTimestamp = new Date(orderDate).getTime();
        var startTimestamp = new Date(startDate).getTime();
        var endTimestamp = new Date(endDate).getTime();

        return orderTimestamp >= startTimestamp && orderTimestamp <= endTimestamp;
    }

    // 취소일자가 선택한 기간 내에 있는지 확인하는 함수
    function isCancelDateInRange(cancelDate, startDate, endDate) {
        var cancelTimestamp = new Date(cancelDate).getTime();
        var startTimestamp = new Date(startDate).getTime();
        var endTimestamp = new Date(endDate).getTime();

        return cancelTimestamp >= startTimestamp && cancelTimestamp <= endTimestamp;
    }

    // ----------- 조회하기 / 기간 구분 -----------------------

    // 기간 버튼 클릭 시 이벤트 핸들러
    document.querySelectorAll('.order-filter-period__tab__button').forEach(function(button) {
        button.addEventListener('click', function() {
            var period = this.textContent;
            var startDate = calculateStartDate(period);
            var endDate = getCurrentDate();
            filterOrdersByDate(startDate, endDate);
            filterCancelsByDate(startDate, endDate);
        });
    });


    // 선택한 기간에 해당하는 주문일자 필터링 함수
    function filterOrdersByDate(startDate, endDate) {
        var orders = document.querySelectorAll('#order-table tbody tr');

        orders.forEach(function(order) {
            var orderDate = order.querySelector('td:nth-child(4)').textContent;
            order.style.display = isOrderDateInRange(orderDate, startDate, endDate) ? 'table-row' : 'none';
        });
    }

    // 선택한 기간에 해당하는 취소일자 필터링 함수
    function filterCancelsByDate(startDate, endDate) {
        var cancels = document.querySelectorAll('#cancel-table tbody tr');

        cancels.forEach(function(cancel) {
            var cancelDate = cancel.querySelector('td:nth-child(4)').textContent;
            cancel.style.display = isCancelDateInRange(cancelDate, startDate, endDate) ? 'table-row' : 'none';
        });
    }

    // 오늘 날짜를 YYYY-MM-DD 형식으로 반환하는 함수
    function getCurrentDate() {
        var today = new Date();
        var year = today.getFullYear();
        var month = String(today.getMonth() + 1).padStart(2, '0');
        var day = String(today.getDate()).padStart(2, '0');
        return year + '-' + month + '-' + day;
    }

    // 선택한 기간에 해당하는 시작 날짜를 계산하는 함수
    function calculateStartDate(period) {
        var startDate = new Date();

        if (period === '1주일') {
            startDate.setDate(startDate.getDate() - 7);
        } else if (period === '1개월') {
            startDate.setMonth(startDate.getMonth() - 1);
        } else if (period === '3개월') {
            startDate.setMonth(startDate.getMonth() - 3);
        } else if (period === '6개월') {
            startDate.setMonth(startDate.getMonth() - 6);
        }

        var year = startDate.getFullYear();
        var month = String(startDate.getMonth() + 1).padStart(2, '0');
        var day = String(startDate.getDate()).padStart(2, '0');
        return year + '-' + month + '-' + day;
    }

    // -------------- 주문 내역 조회 / 취소 내역 조회 버튼을 클릭했을 때 필터링된 테이블의 값이 원래 값으로 초기화 되도록

    // 필터 초기화 함수
    function resetFilters() {
        
        console.log('필터 초기화')
        const fromDateInput = document.querySelector('input[name="dt_fr_input"]');
        const toDateInput = document.querySelector('input[name="dt_to_input"]');
        fromDateInput.value = '';
        toDateInput.value = '';
    }

    // 모든 행 보이기 함수
    function showAllRows() {
        
        console.log('모든 행 보이기')
        const orderTable = document.getElementById('order-table');
        const cancelTable = document.getElementById('cancel-table');

        const orderRows = orderTable.querySelectorAll('tbody tr');
        orderRows.forEach(row => {
            row.style.display = ''; // 행을 보이도록 표시
        });

        const cancelRows = cancelTable.querySelectorAll('tbody tr');
        cancelRows.forEach(row => {
            row.style.display = ''; // 행을 보이도록 표시
        });
    }

    // -------------- 주문 취소 모달 구현

    // 주문 취소 버튼 클릭 시 모달 창 열기
    const cancelOrderButtons = document.querySelectorAll('[data-orderid]');
    const cancelOrderModal = document.getElementById('cancelOrderModal');
    const confirmCancel = document.getElementById('confirmCancel');
    const closeModal = document.getElementsByClassName('close')[0];

    // 모든 주문 취소 버튼에 대해 이벤트 리스너를 등록.
    cancelOrderButtons.forEach(function(button) {
    button.addEventListener('click', function() {
    cancelOrderModal.style.display = 'block';
    const id = button.getAttribute('data-orderid');
    const oid = button.getAttribute('data-oid'); // 주문 아이디 (결제 환불에 필요)
    const uid = button.getAttribute('data-userid'); // 포인트 반환
    const odiscount_price = button.getAttribute('data-discount'); // 포인트 반환
    const pid = button.getAttribute('data-productid'); // 재고, 판매량 반환
    const pcount = button.getAttribute('data-count'); // 재고, 판매량 반환
    confirmCancel.setAttribute('data-orderid', id); // 확인 버튼에도 ID 속성 추가
    confirmCancel.setAttribute('data-oid', oid); // 확인 버튼에도 OID 속성 추가
    confirmCancel.setAttribute('data-userid', uid); // 확인 버튼에도 UID 속성 추가
    confirmCancel.setAttribute('data-discount', odiscount_price); // 확인 버튼에도 할인액 속성 추가
    confirmCancel.setAttribute('data-productid', pid); // 확인 버튼에도 PID 속성 추가
    confirmCancel.setAttribute('data-count', pcount); // 확인 버튼에도 수량 속성 추가
  });
});

    // 모달 창 닫기
    closeModal.addEventListener('click', function() {
        cancelOrderModal.style.display = 'none';
    });

    // 주문 취소 확인 버튼 클릭 시 실제 주문 취소 동작 수행
    confirmCancel.addEventListener('click', function() {
        // 주문 취소 로직 작성
        // AJAX 요청을 사용하여 서버로 주문 취소 요청을 보냄.
        console.log('주문 취소');
        /*        
                if(!confirm('정말 삭제하시겠습니까?')) {
                    return;
                }*/
        // 삭제할 아이디:
        // const id = e.target.getAttribute('data-id');
        const id = this.getAttribute('data-orderid');
        console.log(id);
        // 삭제 요청 URL
        const reqUrl = `/joo/api/order/cancel/${id}`;
        // 삭제 요청을 Ajax 방식으로 보냄.
        axios.put(reqUrl)
            .then((response) => {
                console.log(response);
                alert('주문 취소가 완료되었습니다.');
                console.log(id + "주문취소 완료");
                
            })
            .catch((error) => {
                console.log('주문취소 에러');
                console.log(error);
            });
            
            alert(id);
            
            const oid = this.getAttribute('data-oid');
        	const refundUrl = `/joo/api/payment/cancel/${oid}`;
        	console.log(oid);
            axios.put(refundUrl)
            	.then((response) => {
					alert('결제 환불 완료');
					console.log(response);
					console.log(id + " 결제 환불");
				})
				.catch((error) => {
					console.log('결제 환불 에러');
					console.log(error);
				});
            
        
        // 주문 취소시 유저 현재 포인트 + 사용 포인트 (차감 포인트 반납)
        console.log('차감 포인트 반납 시작');    
        const uid = this.getAttribute('data-userid');
        console.log(uid);
        const odiscount_price = this.getAttribute('data-discount');
        console.log(odiscount_price);
        const reqUrl2 = `/joo/api/order/point`;
        const data = { uid ,odiscount_price };
        axios.put(reqUrl2, data)
            .then((response) => {
                console.log(response);
                console.log(uid + "차감 포인트 반납");
                
            })
            .catch((error) => {
                console.log('포인트반납 에러');
                console.log(error);
            });
            
            
        // 주문 취소시 재고수 + 수량 / 판매량 - 수량
        console.log('재고, 판매량 반납 시작');    
        const pid = this.getAttribute('data-productid');
        console.log(pid);
        const pcount = this.getAttribute('data-count');
        console.log(pcount);
        const reqUrl3 = `/joo/api/order/stock`;
        const data2 = { pid ,pcount };
        axios.put(reqUrl3, data2)
            .then((response) => {
                console.log(response);
                console.log(uid + "재고, 판매량 반납 성공!");
                location.reload(); // 현재 페이지를 새로고침하여 화면을 갱신
            })
            .catch((error) => {
                console.log('재고, 판매량 반납 실패');
                console.log(error);
            });
        
        
        // 주문 취소 후 모달 닫기
        cancelOrderModal.style.display = 'none';
    });
    
    
    
     // -------------- 구매 확정 모달 구현

    // 구매 확정 버튼 클릭 시 모달 창 열기
    const confirmOrderButtons = document.querySelectorAll('[data-confirmid]'); // 구매확정 버튼
    const confirmOrderModal = document.getElementById('confirmOrderModal');
    const confirmOrder = document.getElementById('confirmOrder'); // 구매확정 뒤 '예' 버튼
    const closeOrderModal = document.getElementsByClassName('closeOrder')[0];
    
    // 모든 구매 확정 버튼에 대해 이벤트 리스너를 등록.
  confirmOrderButtons.forEach(function(button) {
    button.addEventListener('click', function() {
    confirmOrderModal.style.display = 'block';
    const id = button.getAttribute('data-confirmid');
    const opoint = button.getAttribute('data-point'); // 누적, 현재 포인트에 적립 포인트 추가
    const uid = button.getAttribute('data-userid2'); // 유저 아이디
    confirmOrder.setAttribute('data-confirmid', id); // 확인 버튼에도 ID 속성 추가
    confirmOrder.setAttribute('data-point', opoint); // 확인 버튼에도 누적 포인트, 현재 포인트 속성 추가
    confirmOrder.setAttribute('data-userid2', uid); // 유저 아이디 속성 추가
  });
});
    
    // 모달 창 닫기
    closeOrderModal.addEventListener('click', function() {
        confirmOrderModal.style.display = 'none';
    });

    // 구매 확정 버튼 클릭 시 실제 구매 확정 동작 수행
    confirmOrder.addEventListener('click', function() {
        // 구매확정 로직 작성
        // AJAX 요청.
        console.log('구매 확정');
        /*        
                if(!confirm('정말 삭제하시겠습니까?')) {
                    return;
                }*/
        // 삭제할 아이디:
        // const id = e.target.getAttribute('data-id');
        const id = confirmOrder.getAttribute('data-confirmid');
        console.log(id);
        // 삭제 요청 URL    
        const reqUrl = `/joo/api/order/buy/${id}`;
        // 삭제 요청을 Ajax 방식으로 보냄.
        axios.put(reqUrl)
            .then((response) => {
                console.log(response);
                alert('구매확정이 완료되었습니다.');
                console.log(id + "구매확정 완료");

            })
            .catch((error) => {
                console.log('구매확정 에러');
                console.log(error);
            });
       
       
        // 구매 확정시 유저 누적 포인트 + 적립 포인트 / 유저 현재 포인트 + 적립 포인트
        console.log('구매 확정시 누적, 현재 포인트 적립 시작');    
        const opoint = this.getAttribute('data-point');
        console.log('opoint = '+ opoint);
        const uid = this.getAttribute('data-userid2');
        console.log('uid = '+ uid);
        const reqUrl2 = `/joo/api/order/finalPoint`;
        const data = { uid , opoint };
        axios.put(reqUrl2, data)
            .then((response) => {
                console.log(response);
                console.log(uid + "최종 누적, 현재 포인트 적립 성공!");
                location.reload(); // 현재 페이지를 새로고침하여 화면을 갱신
            })
            .catch((error) => {
                console.log("최종 누적, 현재 포인트 적립 실패");
                console.log(error);
            });
    
    // 구매 확정 후 모달 닫기
    confirmOrderModal.style.display = 'none';
    });
    
    
    // 버튼 클릭 시 active 클래스 토글
    const buttons = document.querySelectorAll('.order-filter-period__tab__button');
    buttons.forEach((button) => {
      button.addEventListener('click', () => {
        buttons.forEach((btn) => btn.classList.remove('active'));
        button.classList.add('active');
      });
    });
    
      
      // 1주일 ~ 6개월 버튼과 조회하기 버튼의 요소를 가지고 옴.
      // 주문내역조회, 취소내역조회 버튼의 요소를 가지고 옴.
      var buttons2 = document.getElementsByClassName('order-filter-period__tab__button');
      var confirmButton = document.querySelector('.order-filter-confirm');
      var orderHistory = document.querySelector('#btnOrder');
      var cancelHistory = document.querySelector('#btnCancel');

      // 1주일 ~ 6개월 버튼들에 클릭 이벤트 리스너 등록
      for (var i = 0; i < buttons2.length; i++) {
        buttons2[i].addEventListener('click', function() {
          var activeButton = this;

          // 1주일 ~ 6개월 버튼들의 스타일 초기화
          for (var j = 0; j < buttons2.length; j++) {
            buttons2[j].classList.remove('active');
          }

          // 선택된 버튼에 스타일 추가
          activeButton.classList.add('active');
        });
      }

      // 조회하기 버튼에 클릭 이벤트 리스너 등록
      confirmButton.addEventListener('click', function() {
        // 모든 버튼의 스타일 초기화
        for (var j = 0; j < buttons2.length; j++) {
          buttons2[j].classList.remove('active');
        }
      });
      
      // 주문내역조회 버튼에 클릭 이벤트 리스너 등록
      orderHistory.addEventListener('click', function() {
        // 모든 버튼의 스타일 초기화
        for (var j = 0; j < buttons2.length; j++) {
          buttons2[j].classList.remove('active');
        }
      });
      
      // 취소내역조회 버튼에 클릭 이벤트 리스너 등록
      cancelHistory.addEventListener('click', function() {
        // 모든 버튼의 스타일 초기화
        for (var j = 0; j < buttons2.length; j++) {
          buttons2[j].classList.remove('active');
        }
      });
      
      
    

    
   /*  // 후기 작성 버튼 클릭 요소
    //const writeReviewButtons = document.querySelectorAll('[data-pid]'); // 후기작성 버튼
    const btnReview = document.querySelector('button#writeReview');
       
    // 모든 후기 작성  버튼에 대해 이벤트 리스너를 등록.
  /*writeReviewButtons.forEach(function(button) {
    button.addEventListener('click', function() {
    const pid = button.getAttribute('data-pid'); // 상품 아이디
    const uid = button.getAttribute('data-uid'); // 유저 아이디
    const oid = button.getAttribute('data-oid'); // 주문 아이디

  });
});*/

    // 후기작성 버튼 클릭 시 실제 구매 확정 동작 수행
    /*btnReview.addEventListener('click', function() {
        // 후기작성 로직 작성
        // AJAX 요청.
        console.log('후기작성');

        // 구매 확정시 유저 누적 포인트 + 적립 포인트 / 유저 현재 포인트 + 적립 포인트
        console.log('구매 확정시 누적, 현재 포인트 적립 시작');    
        const pid = this.getAttribute('data-pid');
        console.log('pid = '+ pid);
        const uid = this.getAttribute('data-uid');
        console.log('uid = '+ uid);
        const oid = this.getAttribute('data-oid');
        console.log('oid = '+ oid);
        const reqUrl = `/joo/review/create`;
        const data = { pid, uid , oid };
        axios.get(reqUrl, data)
            .then((response) => {
                console.log(response);
                console.log(uid + "후기 작성버튼 작동!");
                window.location.href = reqUrl;
            })
            .catch((error) => {
                console.log(uid + "후기 작성버튼 안눌림");
                console.log(error);
            });
    
    
    });*/
    
    

})

    // 배송조회 새 창 설정하는 함수
    function openWindowWithPosition(event) {
      event.preventDefault(); // 기본 동작인 링크 이동을 방지
    
      var width = 550; // 창의 너비
      var height = 400; // 창의 높이
      var left = (window.innerWidth - width) / 2; // 화면 가로 중앙에 위치
      var top = (window.innerHeight - height) / 2; // 화면 세로 중앙에 위치
      var options = 'width=' + width + ',height=' + height + ',left=' + left + ',top=' + top;
    
      window.open(event.currentTarget.href, '_blank', options);
    }
    
    
    // 주문번호 상세 조회 새 창 설정하는 함수
    function openWindowWithPosition2(event) {
      event.preventDefault(); // 기본 동작인 링크 이동을 방지
    
      var width = 1000; // 창의 너비
      var height = 550; // 창의 높이
      var left = (window.innerWidth - width) / 2; // 화면 가로 중앙에 위치
      var top = (window.innerHeight - height) / 2; // 화면 세로 중앙에 위치
      var options = 'width=' + width + ',height=' + height + ',left=' + left + ',top=' + top;
    
      window.open(event.currentTarget.href, '_blank', options);
    }

    
    //------------------------ 주문 조회 테이블 정렬 기능 추가 --------------------------
    const orderTableHeaders = document.querySelectorAll('#order-table th');
    orderTableHeaders.forEach((header) => {
      header.addEventListener('click', () => {
        const columnName = header.textContent.trim();
        sortTable(columnName, '#order-table');
        updateSortIcons(header, columnName);
      });
    });
    
    //------------------------ 취소 조회 테이블 정렬 기능 추가 --------------------------
    const cancelTableHeaders = document.querySelectorAll('#cancel-table th');
    cancelTableHeaders.forEach((header) => {
      header.addEventListener('click', () => {
        const columnName = header.textContent.trim();
        sortTable(columnName, '#cancel-table');
        updateSortIcons(header, columnName);
      });
    });
    
    // 테이블 정렬 함수
    function sortTable(columnName, tableId) {
      const tableBody = document.querySelector(`${tableId} tbody`);
      const rows = Array.from(tableBody.querySelectorAll('tr'));
    
      // 해당 열의 값을 기준으로 정렬
      rows.sort((rowA, rowB) => {
        const valueA = getCellValue(rowA, columnName, tableId);
        const valueB = getCellValue(rowB, columnName, tableId);
    
        if (sortOrder[columnName] === 'desc') {
          return compareValues(valueB, valueA);
        } else {
          return compareValues(valueA, valueB);
        }
      });
    
      // 정렬된 행들을 테이블에 다시 추가
      while (tableBody.firstChild) {
        tableBody.removeChild(tableBody.firstChild);
      }
    
      rows.forEach((row) => {
        tableBody.appendChild(row);
      });
    
      // 정렬 상태 업데이트
      if (sortOrder[columnName] === 'desc') {
        sortOrder[columnName] = 'asc';
      } else {
        sortOrder[columnName] = 'desc';
      }
    }
    
    // 셀의 값을 가져오는 함수
    function getCellValue(row, columnName, tableId) {
      const cell = row.querySelector(`td:nth-child(${getColumnIndex(columnName, tableId)})`);
      const rawValue = cell ? cell.textContent.trim() : '';
      
      // 총 수량과 총 금액에 해당하는 열만 숫자 부분 추출
      if (columnName === '수량' || columnName === '금액') {
        const numericValue = rawValue.match(/\d+(\.\d+)?/);
        return numericValue ? parseFloat(numericValue[0]) : NaN;
      }
      
      return rawValue;
    }
    
    // 값 비교 함수
    function compareValues(valueA, valueB) {
      if (isNumeric(valueA) && isNumeric(valueB)) {
        return Number(valueA) - Number(valueB);
      } else {
        return valueA.localeCompare(valueB);
      }
    }
    
    // 숫자 여부 확인 함수
    function isNumeric(value) {
      return /^\d+(\.\d+)?$/.test(value);
    }
    
    // 열 인덱스 가져오는 함수
    function getColumnIndex(columnName, tableId) {
      const headers = Array.from(document.querySelectorAll(`${tableId} th`));
      return headers.findIndex((header) => header.textContent.trim() === columnName) + 1;
    }

    // 정렬 아이콘 업데이트 함수
    function updateSortIcons(clickedHeader, columnName) {
      cancelTableHeaders.forEach(header => {
        const icon = header.querySelector('i');
        if (header === clickedHeader) {
          // 클릭한 헤더의 아이콘 상태 업데이트
          if (cancelSortOrder[columnName] === 'asc') {
            icon.classList.remove('fa-sort', 'fa-sort-down');
            icon.classList.add('fa-sort-up');
          } else {
            icon.classList.remove('fa-sort', 'fa-sort-up');
            icon.classList.add('fa-sort-down');
          }
        } else {
          // 클릭하지 않은 헤더의 아이콘 초기화
          icon.classList.remove('fa-sort-up', 'fa-sort-down');
          icon.classList.add('fa-sort');
        }
      });
    }