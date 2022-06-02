<%--
  Created by IntelliJ IDEA.
  User: GRAM
  Date: 2022-06-02
  Time: 오전 9:40
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
        <jsp:include page="layout/adminHeader.jsp" flush="false"></jsp:include>
    </c:if>
    <c:if test="${sessionScope.loginMemberId ne 'admin'}">
        <jsp:include page="layout/loginHeader.jsp" flush="false"></jsp:include>
    </c:if>
</c:if>
<c:if test="${sessionScope.loginMemberId eq null}">
    <jsp:include page="layout/header.jsp" flush="false"></jsp:include>
</c:if>
</body>
</html>
