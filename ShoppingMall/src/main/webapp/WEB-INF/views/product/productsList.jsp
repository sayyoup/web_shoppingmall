<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩 -->
<title>JOO</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
     
     
     </head>
        <body>
            <header>
                <jsp:include page="../common/header.jsp"></jsp:include>
            </header>

        <main class="my-1 p-5 text-bg-dark">

            <!-- 검색 기능 -->
            <div class="input-group mb-3">

                <span class="input-group-text">JOO</span>
                <div class="form-floating">
                    <input type="text" class="form-control"
                        id="inputSearchWord" placeholder="search" /> <label
                        for="inputSearchWord">제품 이름으로 검색</label>
                </div>

                <input type="submit" class="btn btn-outline-primary"
                    value="검색" id="btnSearch" />

                <button class="btn btn-primary" type="button"
                    id="btnDetailSearch" data-bs-toggle="collapse"
                    data-bs-target="#collapseDetailSearch"
                    aria-expanded="false"
                    aria-controls="collapseDetailSearch">상세검색</button>

            </div>

            <div class="collapse" id="collapseDetailSearch">
                <div class="card card-body">

                    <div class="container text-center">
                        <div class="row" style="color: black;">
                            <!-- 1열 -->
                            <!-- 지역 -->
                            <div
                                class="col order-first col-3 bg-light p-3 border">
                                <div>지역검색</div>
                                <div class="form-check form-switch">
                                    <input class="form-check-input"
                                        type="checkbox" role="switch"
                                        id="flexSwitchAllRegion" checked>

                                    <label class="form-check-label"
                                        for="flexSwitchAllRegion"
                                        style="color: black;">전체지역</label>
                                </div>

                                <span class="form-check"> <input
                                    class="form-check-input"
                                    type="checkbox" value="서울"
                                    id="CheckSeoul" checked> <label
                                    class="form-check-label"
                                    for="CheckSeoul"
                                    style="color: black;">서울</label>

                                </span> <span class="form-check"> <input
                                    class="form-check-input"
                                    type="checkbox" value=""
                                    id="CheckGyeonggi" checked>
                                    <label class="form-check-label"
                                    for="CheckGyeonggi"
                                    style="color: black;">경기</label>
                                </span>
                                <div class="form-check">
                                    <input class="form-check-input"
                                        type="checkbox" value=""
                                        id="CheckGangwon" checked>
                                    <label class="form-check-label"
                                        for="CheckGangwon"
                                        style="color: black;">강원</label>
                                </div>

                                <div class="form-check">
                                    <input class="form-check-input"
                                        type="checkbox" value=""
                                        id="CheckChungcheong" checked>
                                    <label class="form-check-label"
                                        for="CheckChungcheong"
                                        style="color: black;">충청</label>
                                </div>

                                <div class="form-check">
                                    <input class="form-check-input"
                                        type="checkbox" value=""
                                        id="CheckJeolla" checked>
                                    <label class="form-check-label"
                                        for="CheckJeolla"
                                        style="color: black;">전라</label>
                                </div>

                                <div class="form-check">
                                    <input class="form-check-input"
                                        type="checkbox" value=""
                                        id="CheckGyeongsang" checked>
                                    <label class="form-check-label"
                                        for="CheckGyeongsang"
                                        style="color: black;">경상</label>
                                </div>

                                <div class="form-check">
                                    <input class="form-check-input"
                                        type="checkbox" value=""
                                        id="CheckJejoo" checked>
                                    <label class="form-check-label"
                                        for="CheckJejoo"
                                        style="color: black;">제주</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input"
                                        type="checkbox" value=""
                                        id="CheckOther" checked>
                                    <label class="form-check-label"
                                        for="CheckOther"
                                        style="color: black;">기타</label>
                                </div>
                            </div>

                            <!-- 2열 -->
                            <div
                                class="col order-last col-sm-9 bg-light p-1 border row row-cols-2"
                                style="color: white;">
                                <!-- 1행 -->
                                <div  style="color: black;">
                                    도수범위
                                    <br/>
                                    
                                    <label for="minPalc">
                                        최소값 : 
                                    </label>
                                    <input class="form-control" id="minPalc" type="number" placeholder="도수 최소값을 입력해 주세요" value="0"/>
                                    
                                    <label for="maxPalc" >
                                        최대값 : 
                                    </label>
                                    <input class="form-control" id="maxPalc" type="number" placeholder="도수 최소값을 입력해 주세요" value="100"/>
                                </div>
                                    
                                    
                                <!-- 2행 -->
                                <div
                                    class="col-sm-12 bg-dark p-3 border">
                                    <div>카테고리 검색</div>
                                    <div class="btn-group" role="group"
                                        aria-label="Basic checkbox toggle button group">

                                        <input type="checkbox"
                                            class="btn-check"
                                            id="categoryOld"
                                            autocomplete="off" checked>
                                        <label
                                            class="btn btn-outline-primary"
                                            for="categoryOld">전통주</label>

                                        <input type="checkbox"
                                            class="btn-check"
                                            id="categorSojo"
                                            autocomplete="off" checked>
                                        <label
                                            class="btn btn-outline-primary"
                                            for="categorSojo">소주</label>

                                        <input type="checkbox"
                                            class="btn-check"
                                            id="categoryBear"
                                            autocomplete="off" checked>
                                        <label
                                            class="btn btn-outline-primary"
                                            for="categoryBear">맥주</label>

                                        <input type="checkbox"
                                            class="btn-check"
                                            id="categoryWine"
                                            autocomplete="off" checked>
                                        <label
                                            class="btn btn-outline-primary"
                                            for="categoryWine">와인</label>

                                        <input type="checkbox"
                                            class="btn-check"
                                            id="categoryOther"
                                            autocomplete="off" checked>
                                        <label
                                            class="btn btn-outline-primary"
                                            for="categoryOther">기타</label>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
            <br />

            <nav class="nav nav-pills nav-justified">
                <a id="aNewList" class="nav-link active">신상</a> 
                <a id="aHotist" class="nav-link" href="#">인기</a> 
                <a id="aOldList" class="nav-link" href="#">전통주</a> 
                <a id="aSojuList" class="nav-link" href="#">소주</a> 
                <a id="aBearList" class="nav-link" href="#">맥주</a> 
                <a id="aWineList" class="nav-link" href="#">와인</a>
                <a id="aAnotherList" class="nav-link" href="#">기타</a>
            </nav>

            <!-- 버튼이 눌렸을때 하단의 selectedCategory 초기화, 해당하는 리스트 보여주기 -->
            <hr />
            <div class="d-none" id="divSearchWord" >
                검색어 : <span id="spanSearchWord" ></span>
            </div>
            <br/>
            <div id="selectedCategory"
                class="row row-cols-1 row-cols-md-5 g-4"></div>

        </main>

        <script
            src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
        <script src="../static/js/productPage/ProductListPage.js"></script>
    </div>
</body>
</html>

            <jsp:include page="../common/footer.jsp"></jsp:include>