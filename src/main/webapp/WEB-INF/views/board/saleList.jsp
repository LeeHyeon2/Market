<%--
  Created by IntelliJ IDEA.
  User: GRAM
  Date: 2022-06-03
  Time: 오후 2:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <style>
        tr.colored:hover td{
            background-color:#f3e9e9 !important;
            color:#303f39 !important;
        }
    </style>
    <title>Title</title>
</head>
<body>
<c:if test="${sessionScope.loginMemberId ne null}">
    <c:if test="${sessionScope.loginMemberId eq 'admin'}">
        <jsp:include page="../layout/adminHeader.jsp" flush="false"></jsp:include>
    </c:if>
    <c:if test="${sessionScope.loginMemberId ne 'admin'}">
        <jsp:include page="../layout/loginHeader.jsp" flush="false"></jsp:include>
    </c:if>
</c:if>
<div class="container mt-3">
    <table class="table">
        <c:if test="${id eq 1}">
            <tr>
                <th>판매중인 물건</th>
                <th></th><th></th><th></th>
            </tr>
            <tr>
                <th>글번호</th>
                <th>대표사진</th>
                <th>제목</th>
                <th>카테고리</th>
                <th>작성일자</th>
                <th>조회수</th>
            </tr>
            <c:forEach items="${boardDTO}" var="board">
                <c:if test="${board.boardStatus eq '판매중'}">
                    <tr class="colored" onclick="location.href='/board/detail?id=${board.id}'">
                        <td>${board.id}</td>
                        <td><img src="${pageContext.request.contextPath}/upload/${board.boardProfile}" alt="" height="100" width="100"></td>
                        <td>${board.boardTitle}</td>
                        <td>${board.boardCategory}</td>
                        <td>${board.boardDate}</td>
                        <td>${board.boardHits}</td>
                    </tr>
                </c:if>
            </c:forEach>
        </c:if>

        <c:if test="${id eq 2}">
            <tr>
                <th>판매완료</th>
                <th></th><th></th><th></th>
            </tr>
            <tr>
                <th>글번호</th>
                <th>대표사진</th>
                <th>제목</th>
                <th>카테고리</th>
                <th>작성일자</th>
                <th>조회수</th>
            </tr>
            <c:forEach items="${boardDTO}" var="board">
                <c:if test="${board.boardStatus eq '판매완료'}">
                    <tr class="colored" onclick="location.href='/board/detail?id=${board.id}'">
                        <td>${board.id}</td>
                        <td><img src="${pageContext.request.contextPath}/upload/${board.boardProfile}" alt="" height="100" width="100"></td>
                        <td>${board.boardTitle}</td>
                        <td>${board.boardCategory}</td>
                        <td>${board.boardDate}</td>
                        <td>${board.boardHits}</td>
                    </tr>
                </c:if>
            </c:forEach>
        </c:if>
    </table>
</div>
</body>
</html>
