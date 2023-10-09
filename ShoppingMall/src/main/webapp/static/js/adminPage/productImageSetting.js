/**
 * 상품등록 이미지설정 js 페이지
 */

document.addEventListener('DOMContentLoaded', function() {

    // 파일인풋 찾기
    const title_image = document.querySelector('input#title_image');
    const detail_image = document.querySelector('input#detail_image');
    
    //상품이름 가져오기
    const pname = document.querySelector('input#pname').value;

    // 버튼
    const btnCreate = document.querySelector('input#btnCreate');
    const btnPrevious = document.querySelector('input#btnPrevious');
    const btnSkip = document.querySelector('input#btnSkip');

    // 폼
    const formSettingImage = document.querySelector('form#formSettingImage');

    // 완료버튼
   btnCreate.addEventListener('click', function() {

        //빈값 확인(둘다 차있으면 넘어갈 수 있도록 한다.)
        if (title_image.value == "" || detail_image.value == "") {
            alert('값이 비어있습니다.')
            return;
        }
        
        document.querySelector('input#ptitle_image').value =`C:/jooImage/products/${pname}/Title_Image/ptitle_image.jpg`;
        document.querySelector('input#pdetail_image').value =`C:/jooImage/products/${pname}/Detail_Image/pdetail_image.jpg`;

        formSettingImage.submit();
    });

   
    
    // 이전버튼
    btnPrevious.addEventListener('click', function() {

        history.back();

    });

    // 스킵버튼 (상품의 이미지기본값인 이미지준비중입니다. 사진을 보여준다.)
    btnSkip.addEventListener('click', function() {

        formSettingImage.submit();

    });




//---------------------------------------------------------------------------------------------


    // 파일인풋값이 변화할때, (해당 파일값을 다른 컨트롤러로 전송한다.)
    title_image.addEventListener('change', function() {
        // 파일이 추가되었을때, 이벤트 처리
        // 1. 이미지로 파일 가져오기
        let ptitle_image = title_image.files[0];
        const url= '/joo/api/AdminProductImage/ProductTitleImage';
        const delurl= '/joo/api/AdminProductImage/ProductTitleImageDelete';
        
        console.log(ptitle_image);
        
        // 파일이 존재하는지 체크
        if(ptitle_image){
            // 존제한다!
            let formData = new FormData();
            formData.append('ptitle_image', ptitle_image);
            formData.append('pname', pname);
                        
            // axios 요청 전송
            axios.post(url, formData)
              .then(function(response) {
                // 성공적으로 서버로부터 응답을 받았을 때의 처리 로직
                alert('파일 업로드 완료');
              })
              .catch(function(error) {
                // 오류가 발생했을 때의 처리 로직
                alert('파일 업로드 실패');
                console.log(error);
              });
        }else{
            // 존제하지 않는다. = 파일이 지워졌다.(db에서 해당 파일 경로를 가진 제품 삭제하는 요청 처리)
            let formData = new FormData();
            formData.append('pname', pname);
            axios.post(delurl, formData)
              .then(function(response) {
                // 성공적으로 서버로부터 응답을 받았을 때의 처리 로직
                alert('빈파일로 수정 완료');
              })
              .catch(function(error) {
                // 오류가 발생했을 때의 처리 로직
                alert('빈파일로 수정 실패');
                console.log(error);
              });
        }            
     
    });
    
    detail_image.addEventListener('change', function() {
        // 파일이 추가되었을때, 이벤트 처리
        // 1. 이미지로 파일 가져오기
        let pdetail_image = detail_image.files[0];
        const url= '/joo/api/AdminProductImage/ProductDetailImage';
        const delurl= '/joo/api/AdminProductImage/ProductDetailImageDelete';
        
        console.log(pdetail_image);
        
        // 파일이 존재하는지 체크
        if(pdetail_image){
            // 존제한다!
            let formData = new FormData();
            formData.append('pdetail_image', pdetail_image);
            formData.append('pname', pname);
                        
            // axios 요청 전송
            axios.post(url, formData)
              .then(function(response) {
                // 성공적으로 서버로부터 응답을 받았을 때의 처리 로직
                alert('파일 업로드 완료');
              })
              .catch(function(error) {
                // 오류가 발생했을 때의 처리 로직
                alert('파일 업로드 실패');
                console.log(error);
              });
        }else{
            // 존제하지 않는다. = 파일이 지워졌다.(db에서 해당 파일 경로를 가진 제품 삭제하는 요청 처리)
            let formData = new FormData();
            formData.append('pname', pname);
            axios.post(delurl, formData)
              .then(function(response) {
                // 성공적으로 서버로부터 응답을 받았을 때의 처리 로직
                alert('빈파일로 수정 완료');
              })
              .catch(function(error) {
                // 오류가 발생했을 때의 처리 로직
                alert('빈파일로 수정 실패');
                console.log(error);
              });
        }
    });


}); 