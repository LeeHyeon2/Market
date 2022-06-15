<%--
  Created by IntelliJ IDEA.
  User: GRAM
  Date: 2022-06-02
  Time: 오전 9:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<head>
    <title>Title</title>

<!-- Bootstrap core CSS -->
<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">


<style>
    .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
    }

    @media (min-width: 768px) {
        .bd-placeholder-img-lg {
            font-size: 3.5rem;
        }
    }
</style>


<!-- Custom styles for this template -->
<link href="pricing.css" rel="stylesheet">
</head>

<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
    <symbol id="check" viewBox="0 0 16 16">
        <title>Check</title>
        <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"></path>
    </symbol>
</svg>
<body>
<c:if test="${sessionScope.loginMemberId ne null}">
    <c:if test="${sessionScope.loginMemberId eq 'admin'}">
        <jsp:include page="layout/adminHeader.jsp" flush="false"></jsp:include>
    </c:if>
    <c:if test="${sessionScope.loginMemberId ne 'admin'}">
        <jsp:include page="layout/loginHeader.jsp" flush="false"></jsp:include>
    </c:if>
</c:if>
<c:if test="${sessionScope.loginMemberId eq null}">
    <jsp:include page="layout/header.jsp" flush="false"></jsp:include>
</c:if>
<link rel="canonical" href="https://getbootstrap.kr/docs/5.1/examples/pricing/">

<div class="container py-3">
    <header>
        <div class="pricing-header p-3 pb-md-4 mx-auto text-center">
            <h1 class="display-4 fw-normal">인기상품</h1>
            <p class="fs-5 text-muted">판매중인 상품중 가장 조회수가 높은 물품입니다 빠르게 확인해보세요!</p>
        </div>
    </header>

    <main>
        <div class="row row-cols-1 row-cols-md-3 mb-3 text-center">
            <div class="col">
                <div class="card mb-4 rounded-3 shadow-sm">
                    <div class="card-header py-3">
                        <h4 class="my-0 fw-normal">1st</h4>
                    </div>
                    <div class="card-body">
                        <h1 class="card-title pricing-card-title"><img src="${pageContext.request.contextPath}/upload/${boardDTO.get(0).boardProfile}" alt="" height="100" width="100"></h1>
                        <ul class="list-unstyled mt-3 mb-4">
                            <li>${boardDTO.get(0).boardTitle}</li>
                            <li>${boardDTO.get(0).boardCategory}</li>
                            <li>${boardDTO.get(0).boardPrice}(원)</li>
                            <li>조회수 : ${boardDTO.get(0).boardHits}</li>
                        </ul>
                        <button type="button" class="w-100 btn btn-lg btn-primary" onclick="location.href = '/board/detail?id=${boardDTO.get(0).id}'">보러가기</button>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card mb-4 rounded-3 shadow-sm">
                    <div class="card-header py-3">
                        <h4 class="my-0 fw-normal">2nd</h4>
                    </div>
                    <div class="card-body">
                        <h1 class="card-title pricing-card-title"><img src="${pageContext.request.contextPath}/upload/${boardDTO.get(1).boardProfile}" alt="" height="100" width="100"></h1>
                        <ul class="list-unstyled mt-3 mb-4">
                            <li>${boardDTO.get(1).boardTitle}</li>
                            <li>${boardDTO.get(1).boardCategory}</li>
                            <li>${boardDTO.get(1).boardPrice}(원)</li>
                            <li>조회수 : ${boardDTO.get(1).boardHits}</li>
                        </ul>
                        <button type="button" class="w-100 btn btn-lg btn-primary" onclick="location.href = '/board/detail?id=${boardDTO.get(1).id}'">보러가기</button>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card mb-4 rounded-3 shadow-sm">
                    <div class="card-header py-3">
                        <h4 class="my-0 fw-normal">3rd</h4>
                    </div>
                    <div class="card-body">
                        <h1 class="card-title pricing-card-title"><img src="${pageContext.request.contextPath}/upload/${boardDTO.get(2).boardProfile}" alt="" height="100" width="100"></h1>
                        <ul class="list-unstyled mt-3 mb-4">
                            <li>${boardDTO.get(2).boardTitle}</li>
                            <li>${boardDTO.get(2).boardCategory}</li>
                            <li>${boardDTO.get(2).boardPrice}(원)</li>
                            <li>조회수 : ${boardDTO.get(2).boardHits}</li>
                        </ul>
                        <button type="button" class="w-100 btn btn-lg btn-primary" onclick="location.href = '/board/detail?id=${boardDTO.get(2).id}'">보러가기</button>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <footer class="pt-4 my-md-5 pt-md-5 border-top">
        <div class="row">
            <div class="col-12 col-md">
                <small class="d-block mb-3 text-muted">LeeHyeon</small>
            </div>
        </div>
    </footer>
</div>
</body>
</html>
