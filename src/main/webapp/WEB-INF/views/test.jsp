<%--
  Created by IntelliJ IDEA.
  User: GRAM
  Date: 2022-06-14
  Time: 오전 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <title>chat</title>
</head>

<body>
<input type="text" placeholder="채팅입력"> <input type="submit" value="보내기">

<table>
    <tr>
        <td>발신 : ${id}</td>
    </tr>
    <tr>
        <td>수신</td>
    </tr>
</table>

<div><input type="button" onclick="request()" class="btn btn-default" value="클릭" /></div>

</body>
<script>
    function request(){

        timer = setInterval( function () {
            $.ajax({
                url: "member/test",
                type: "get",
                dataType : "json",
                success: function (result){
                    console.log(result);
                    console.log(result[0].id);
                    console.log(result[1].id);
                }
            })

        }, 1000);

    }
</script>
</html>
