<%--
  Created by IntelliJ IDEA.
  User: GRAM
  Date: 2022-06-08
  Time: 오전 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<html>
<head>
    <title>item</title>
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
            <th colspan="7">구매하기</th>
        </tr>
        <tr>
            <th>글번호</th>
            <th>판매자</th>
            <th>대표사진</th>
            <th>제목</th>
            <form action="/board/category" method="get" name="categoryForm">
                <th>카테고리 <select name="boardCategory" id="boardCategory" onchange="category()">
                    <option value="전체보기">전체보기</option>
                    <option value="전자기기">전자기기</option>
                    <option value="식품">식품</option>
                    <option value="가전">가전</option>
                </select></th>
            </form>
            <th>작성일자</th>
            <th>조회수</th>
        </tr>
        <c:forEach items="${boardDTO}" var="board">
        <tr class="colored" onclick="location.href='/board/detail?id=${board.id}'">
            <td>${board.id}</td>
            <td>${board.memberId}</td>
            <td><img src="${pageContext.request.contextPath}/upload/${board.boardProfile}" alt="" height="100" width="100"></td>
            <td>${board.boardTitle}</td>
            <td>${board.boardCategory}</td>
            <td>${board.boardDate}</td>
            <td>${board.boardHits}</td>
        </tr>
        </c:forEach>
    </table>
</div>

<div class="container">
    <ul class="pagination justify-content-center">
        <c:choose>
            <%-- 현재 페이지가 1페이지면 이전 글자만 보여줌--%>
            <c:when test="${paging.page<=1}">
                <li class="page-item disabled">
                    <a class="page-link">[이전]</a>
                </li>
            </c:when>
            <%-- 1페이지가 아닌 경우에는 이전을 클릭하면 현재 페이지보다 1작은페이지요청 --%>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="/board/item?page=${paging.page-1}">[이전]</a>
                </li>
            </c:otherwise>
        </c:choose>

        <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
            <c:choose>
                <%-- 요청한 페이지에 있는 경우 페이지 ㅓ번호는 텍스므만 보이게 --%>
                <c:when test="${i eq paging.page}">
                    <li class="page-item active">
                        <a class="page-link">${i}</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="/board/item?page=${i}">${i}</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:choose>
            <c:when test="${paging.page>=paging.maxPage}">
                <li class="page-item disabled">
                    <a class="page-link">[다음]</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="/board/item?page=${paging.page+1}">[다음]</a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
</div>
</body>
<script>
    const category = () => {
      categoryForm.submit();
    }
</script>
</html>
