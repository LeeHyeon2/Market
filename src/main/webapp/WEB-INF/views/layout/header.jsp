<%--
  Created by IntelliJ IDEA.
  User: GRAM
  Date: 2022-06-02
  Time: 오전 9:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<html>
<head>
    <link href="/resources/css/headers.css" rel="stylesheet">
</head>
<body>
<nav class="py-2 bg-light border-bottom">
    <div class="container d-flex flex-wrap">
        <ul class="nav me-auto">
            <li class="nav-item"><a href="/" class="nav-link link-dark px-2 active" aria-current="page">Home</a></li>
            <li class="nav-item"><a href="/board/item" class="nav-link link-dark px-2">구매하기</a></li>
        </ul>
        <ul class="nav">
            <li class="nav-item"><a href="/member/login" class="nav-link link-dark px-2">로그인</a></li>
            <li class="nav-item"><a href="/member/save" class="nav-link link-dark px-2">회원가입</a></li>
        </ul>
    </div>
</nav>
<header class="py-3 mb-4 border-bottom">
    <div class="container d-flex flex-wrap justify-content-center">
        <a href="/" class="d-flex align-items-center mb-3 mb-lg-0 me-lg-auto text-dark text-decoration-none">
            <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
            <span class="fs-4">Market</span>
        </a>
        <form action="/board/search" method="get" class="col-12 col-lg-auto mb-3 mb-lg-0" role="search">
            <input type="search" class="form-control" name="search" id="search" placeholder="물품 검색" aria-label="Search">
            <input type="hidden" name="type" id="type" value="전체">
        </form>
    </div>
</header>
</body>
</html>
