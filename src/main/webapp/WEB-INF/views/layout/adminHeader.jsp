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
            <li class="nav-item"><a href="#" class="nav-link link-dark px-2">구매</a></li>
            <li class="nav-item"><a href="#" class="nav-link link-dark px-2">판매</a></li>
            <li class="nav-item"><a href="/member/findAll" class="nav-link link-dark px-2">회원목록</a></li>
            <li class="nav-item"><a href="#" class="nav-link link-dark px-2">x</a></li>
        </ul>
        <ul class="nav">
            <li class="nav-item"><div class="nav-link link-dark px-2">${sessionScope.loginMemberName}(님)</div></li>
            <li class="nav-item"><a href="/member/myPage" class="nav-link link-dark px-2">마이페이지</a></li>
            <li class="nav-item"><a href="#" class="nav-link link-dark px-2">장바구니</a></li>
            <li class="nav-item"><a href="/member/logout" class="nav-link link-dark px-2">로그아웃</a></li>
        </ul>
    </div>
</nav>


<header class="py-3 mb-4 border-bottom">
    <div class="container d-flex flex-wrap justify-content-center">
        <a href="/" class="d-flex align-items-center mb-3 mb-lg-0 me-lg-auto text-dark text-decoration-none">
            <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
            <span class="fs-4">Market</span>
        </a>
        <form class="col-12 col-lg-auto mb-3 mb-lg-0" role="search">
            <input type="search" class="form-control" placeholder="Search..." aria-label="Search">
        </form>
    </div>
</header>
</body>
</html>
