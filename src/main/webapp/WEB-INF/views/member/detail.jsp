<%--
  Created by IntelliJ IDEA.
  User: GRAM
  Date: 2022-05-27
  Time: 오후 1:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<html>
<head>
    <title>detail</title>
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
            <th>거래내역</th>
        </tr>
        <tr>
            <th>거래내역출력 + 클릭시 그 글로 이동</th>
        </tr>
    </table>
</div>
</body>
</html>
