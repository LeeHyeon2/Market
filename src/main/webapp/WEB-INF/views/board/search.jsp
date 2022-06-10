<%--
  Created by IntelliJ IDEA.
  User: GRAM
  Date: 2022-06-10
  Time: 오후 3:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<html>
<head>
    <title>Title</title>
    <style>
        tr.colored:hover td{
            background-color:#f3e9e9 !important;
            color:#303f39 !important;
        }
    </style>
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
<c:if test="${sessionScope.loginMemberId eq null}">
    <jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
</c:if>

<div class="container mt-3">
    <table class="table">
        <tr>
            <form action="/board/search" method="post" name="typeForm">
                <input type="hidden" id="search" name="search" value="${search}">
                <th colspan="7">${search} 에 대한 검색결과
                    <select name="type" id="type" onchange="type1()">
                        <option value="">선택</option>
                            <option value="전체">전체</option>
                            <option value="memberId">작성자</option>
                            <option value="boardTitle">제목</option>
                            <option value="boardContents">내용</option>
                    </select>
                </th>
            </form>
        </tr>
        <tr>
            <th>글번호</th>
            <th>판매자</th>
            <th>대표사진</th>
            <th>제목</th>
            <th>카테고리</th>
            <th>거래상태</th>
            <th>작성일자</th>
            <th>조회수</th>
        </tr>
        <c:if test="${boardDTO.size() eq 0}">
            <tr><td colspan="8">검색결과가 없습니다.</td></tr>
        </c:if>
        <c:forEach items="${boardDTO}" var="board">
            <tr class="colored" onclick="location.href='/board/detail?id=${board.id}'">
                <td>${board.id}</td>
                <td>${board.memberId}</td>
                <td><img src="${pageContext.request.contextPath}/upload/${board.boardProfile}" alt="" height="100" width="100"></td>
                <td>${board.boardTitle}</td>
                <td>${board.boardCategory}</td>
                <td>${board.boardStatus}</td>
                <td>${board.boardDate}</td>
                <td>${board.boardHits}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
<script>
    const type1 = () => {
        typeForm.submit();
    }
</script>
</html>
