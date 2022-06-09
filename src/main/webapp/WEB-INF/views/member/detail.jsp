<%--
  Created by IntelliJ IDEA.
  User: GRAM
  Date: 2022-05-27
  Time: 오후 1:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<html>
<head>
    <title>detail</title>
    <style>
        tr.colored:hover td{
            background-color:#f3e9e9 !important;
            color:#303f39 !important;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/adminHeader.jsp" flush="false"></jsp:include>
<div class="container">
    <table class="table">
        <tr>
            <th>ID</th>
            <th>이름</th>
            <th>이메일</th>
            <th>우편번호</th>
            <th>주소</th>
            <th>상세주소</th>
        </tr>
        <tr>
            <th>${member.memberId}</th>
            <th>${member.memberName}</th>
            <th>${member.memberEmail1}${member.memberEmail2}</th>
            <th>${member.memberPost}</th>
            <th>${member.memberAddress1}</th>
            <th>${member.memberAddress2}</th>
        </tr>
    </table>
    <table class="table">
        <tr>
            <th colspan="7">글 목록</th>
        </tr>
        <tr>
            <th>글번호</th>
            <th>대표사진</th>
            <th>제목</th>
            <th>카테고리</th>
            <th>작성일자</th>
            <th>거래상태</th>
            <th>조회수</th>
        </tr>
        <c:if test="${boardDTO.size() eq 0}">
            <tr><td>등록된 글이 없습니다.</td></tr>
        </c:if>
        <c:forEach items="${boardDTO}" var="board">
                <tr class="colored" onclick="location.href='/board/detail?id=${board.id}'">
                    <td>${board.id}</td>
                    <td><img src="${pageContext.request.contextPath}/upload/${board.boardProfile}" alt="" height="100" width="100"></td>
                    <td>${board.boardTitle}</td>
                    <td>${board.boardCategory}</td>
                    <td>${board.boardDate}</td>
                    <td>${board.boardStatus}</td>
                    <td>${board.boardHits}</td>
                </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
