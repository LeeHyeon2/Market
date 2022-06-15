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
<div class="container">
  <div><input class="form-control" type="text" id="contents" name="contents" 입력하세요 onkeydown="javascript:if(event.keyCode==13)chat()" placeholder="채팅입력">
  <input class="btn btn-primary" type="submit" value="보내기" onclick="chat()"></div>
</div>
<div class="container" id="comment-list" style="overflow:scroll; height:700px;"></div>

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
          let output = "<table class='table'>";
          output += "<tr colspan = '3'><th>채팅내역</th></tr>";

          for(let i in result){
            if (result[i].memberId == '${sessionScope.loginMemberId}'){
              output += "<tr style='background-color:yellow'>";
              output += "<td>"+result[i].memberId+"</td>";
              output += "<td>"+result[i].contents+"</td>";
              output += "<td>"+result[i].chatTime+"</td>";
              output += "</tr>";
            }else{
              output += "<tr style='background-color:#dfc2c4'>";
              output += "<td>"+result[i].memberId+"</td>";
              output += "<td>"+result[i].contents+"</td>";
              output += "<td>"+result[i].chatTime+"</td>";
              output += "</tr>";
            }
          }
          output += "</table>";
          document.getElementById('comment-list').innerHTML = output;


        }
      })
    }, 1000);
  }
</script>
</html>