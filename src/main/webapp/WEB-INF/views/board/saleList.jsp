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
                <th colspan="7">판매중인 물건</th>
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
                <th colspan="7">판매완료</th>
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

        <c:if test="${id eq 3}">
            <tr>
                <th colspan="7">거래중 목록</th>
            </tr>
            <tr>
                <th>글번호</th>
                <th>대표사진</th>
                <th>제목</th>
                <th>카테고리</th>
                <th>작성일자</th>
                <th>조회수</th>
                <th>거래확인</th>
            </tr>
            <c:forEach items="${boardDTO}" var="board">
                <c:if test="${board.boardStatus eq '거래중'}">
                    <tr class="colored" onclick="location.href='/board/detail?id=${board.id}'">
                        <td>${board.id}</td>
                        <td><img src="${pageContext.request.contextPath}/upload/${board.boardProfile}" alt="" height="100" width="100"></td>
                        <td>${board.boardTitle}</td>
                        <td>${board.boardCategory}</td>
                        <td>${board.boardDate}</td>
                        <td>${board.boardHits}</td>
                        <td><input type="button" class="btn-primary" value="거래완료" onclick="event.cancelBubble=true;tradeSuccess(); location.href='/trade/success?id=${board.id}&sale=1'">
                            <input type="button" class="btn-primary" value="거래취소" onclick="event.cancelBubble=true;tradeFail(); location.href='/trade/fail?id=${board.id}&sale=1'">
                            <input type="button" value="채팅" onclick="event.cancelBubble=true;bchat(${board.id})"></td>
                    </tr>
                </c:if>
            </c:forEach>
        </c:if>
        <c:if test="${boardDTO.size() eq 0}">
            <tr>
                <td colspan="8">등록된 글이 없습니다.</td>
            </tr>
        </c:if>
    </table>
</div>

<c:if test="${boardDTO.size() ne 0}">
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
                        <a class="page-link" href="/board/sale?page=${paging.page-1}&id=${id}">[이전]</a>
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
                            <a class="page-link" href="/board/sale?page=${i}&id=${id}">${i}</a>
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
                        <a class="page-link" href="/board/sale?page=${paging.page+1}&id=${id}">[다음]</a>
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
        let popUrl = "/chat/start?id="+ boardId ;
        let popOption = "width = 650px, height=800px, top=300px, left=300px, scrollbars=yes";

        window.open(popUrl,"test",popOption);
    }

</script>
</html>
