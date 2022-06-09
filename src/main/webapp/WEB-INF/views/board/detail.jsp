<%--
  Created by IntelliJ IDEA.
  User: GRAM
  Date: 2022-06-08
  Time: 오전 8:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
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

<div class="container">
    <table class="table table-border">
        <tr>
            <th>작성자 : ${boardDTO.memberId}</th>
            <th>작성시간 : ${boardDTO.boardDate}</th>
        </tr>
        <tr>
            <th>제목 : ${boardDTO.boardTitle}</th>
            <th>조회수 : ${boardDTO.boardHits}</th>
        </tr>
        <tr>
            <th>카테고리 : ${boardDTO.boardCategory}</th>
            <th>거래상태 : ${boardDTO.boardStatus}</th>
        </tr>
        <tr>
            <th>희망 거래지역 : ${boardDTO.boardAddress}</th>
            <td></td>
        </tr>
        <tr>
            <th>대표사진 , 내용</th>
            <td></td>
        </tr>
        <tr>
            <th><img src="${pageContext.request.contextPath}/upload/${boardDTO.boardProfile}" alt="" height="100" width="100">
                ${boardDTO.boardContents}</th>
            <th></th>
        </tr>
        <c:if test="${boardDTO.boardFile ne null}">
            <tr>
                <th>추가사진</th>
                <td></td>
            </tr>
            <tr>
                <th><img src="${pageContext.request.contextPath}/upload/${boardDTO.boardFile}" alt="" height="100" width="100"></th>
                <td></td>
            </tr>
        </c:if>

        <tr>
            <td>
                <c:if test="${sessionScope.loginMemberId eq boardDTO.memberId}">
                    <input type="button" class="btn-primary" value="수정" onclick="location.href = '/board/update?id=${boardDTO.id}'">
                    <input type="button" class="btn-primary" value="삭제" onclick="location.href = '/board/delete?id=${boardDTO.id}'">
                </c:if>
                <c:if test="${sessionScope.loginMemberId ne boardDTO.memberId}">
                    <input type="button" class="btn-primary" value="구매신청">
                    <c:if test="${bag eq null}">
                        <input type="button" class="btn-primary" value="장바구니에 추가" onclick="bagUpdate();location.href = '/bag/update?memberId=${sessionScope.loginMemberId}&boardId=${boardDTO.id}'">
                    </c:if>
                    <c:if test="${bag ne null}">
                        <input type="button" class="btn-primary" value="장바구니 삭제" onclick="bagDelete();location.href = '/bag/delete?memberId=${sessionScope.loginMemberId}&boardId=${boardDTO.id}&bag=1'" >
                    </c:if>
                    <c:if test="${sessionScope.loginMemberId eq 'admin'}">
                        <input type="button" class="btn-primary" value="삭제" onclick="delete1()">
                    </c:if>
                </c:if>
            </td>
        </tr>
    </table>
</div>
</body>
<script>
    const delete1 = () => {
        alert("글이 삭제되었습니다!") ;
        location.href = "/board/delete?id=" + "${boardDTO.id}" ;
    }
    const bagUpdate = () =>{
        alert("장바구니에 등록되었습니다!")
    }
    const bagDelete = () => {
        alert("장바구니에서 삭제되었습니다!!")
    }
</script>
</html>
