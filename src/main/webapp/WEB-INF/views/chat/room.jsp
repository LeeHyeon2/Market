<%--
  Created by IntelliJ IDEA.
  User: GRAM
  Date: 2022-06-14
  Time: 오후 3:38
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
<input type="text" id="contents" name="contents" placeholder="채팅입력"><input type="button" value="보내기" onclick="chat()">

<div id="comment-list"></div>

</body>
<script>
  function chat(){
    const contents = document.getElementById("contents").value
    $.ajax({
      url: "/chat/save/",
      type: "get",
      data:{
        "contents":contents,
        "boardId":${id}
      },
      success: function (result){

      }
    })
    document.getElementById("contents").value = "";
  }


  window.onload = function request(){

    timer = setInterval( function () {
      $.ajax({
        url: "/chat/chat/?id=" + '${id}',
        type: "get",
        dataType : "json",
        success: function (result){
          console.log("테스트");

          let output = "<table class='table'>";
          output += "<tr><th>아이디</th>";
          output += "<th>내용</th>";
          output += "<th>작성시간</th></tr>";
          <c:if test="result eq null">
          output += "<tr><th>채팅기록이 없습니다.</th><tr>";
          </c:if>
          for(let i in result){
            output += "<tr>";
            output += "<td>"+result[i].memberId+"</td>";
            output += "<td>"+result[i].contents+"</td>";
            output += "<td>"+result[i].chatTime+"</td>";
            output += "</tr>";
          }
          output += "</table>";
          document.getElementById('comment-list').innerHTML = output;


        }
      })

    }, 1000);

  }
</script>
</html>