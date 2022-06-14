<%--
  Created by IntelliJ IDEA.
  User: GRAM
  Date: 2022-06-10
  Time: 오후 2:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>trade/list</title>
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
<div class="container mt-3">
    <table class="table">
        <tr>
            <th colspan="4">거래내역</th>
        </tr>
        <tr>
            <th>구매자</th>
            <th>판매자</th>
            <th>글번호</th>
            <th>거래시간</th>
            <c:if test="${id eq 1}">
                <th>거래</th>
            </c:if>
        </tr>
        <c:if test="${tradeDTO.size() eq 0}">
            <tr><th colspan="4">내역이 없습니다!</th></tr>
        </c:if>

        <c:forEach items="${tradeDTO}" var="trade">
            <tr class="colored" onclick="location.href='/board/detail?id=${trade.boardId}'">
                <td>${trade.buyMemberId}</td>
                <td>${trade.saleMemberId}</td>
                <td>${trade.boardId}</td>
                <td>${trade.tradeTime}</td>
                <c:if test="${id eq 1}">
                    <td>
                        <c:if test="${trade.saleMemberId eq sessionScope.loginMemberId}">
                            <input type="button" class="btn-primary" value="거래완료" onclick="event.cancelBubble=true;tradeSuccess(); location.href='/trade/success?id=${trade.boardId}&sale=3'">
                        </c:if>
                        <input type="button" class="btn-primary" value="거래취소" onclick="event.cancelBubble=true;tradeFail(); location.href='/trade/fail?id=${trade.boardId}&sale=3'">
                        <input type="button" value="채팅" onclick="event.cancelBubble=true;chat(${trade.boardId});"></td>
                </c:if>
            </tr>
        </c:forEach>
    </table>
</div>

<c:if test="${tradeDTO.size() ne 0}">
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
                        <a class="page-link" href="/trade/list?page=${paging.page-1}&id=${id}">[이전]</a>
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
                            <a class="page-link" href="/trade/list?page=${i}&id=${id}">${i}</a>
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
                        <a class="page-link" href="/trade/list?page=${paging.page+1}&id=${id}">[다음]</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</c:if>
</body>
<script>
    const tradeSuccess = () =>{
        alert("거래가 완료되었습니다!")
    }
    function tradeFail(){
        alert("거래를 취소했습니다.")
    }

    function chat(boardId){
        let popUrl = "/chat/start?id=" + boardId;
        let popOption = "width = 650px, height=800px, top=300px, left=300px, scrollbars=yes";

        window.open(popUrl,"test",popOption);
    }

</script>
</html>
