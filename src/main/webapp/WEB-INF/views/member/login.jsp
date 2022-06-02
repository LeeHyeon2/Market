<%--
  Created by IntelliJ IDEA.
  User: GRAM
  Date: 2022-06-02
  Time: 오후 2:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0">
</head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<style>
    body {
        min-height: 100vh;

        background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
        background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
        background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
        background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
        background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
    }

    .input-form {
        max-width: 680px;

        margin-top: 80px;
        padding: 32px;

        background: #fff;
        -webkit-border-radius: 10px;
        -moz-border-radius: 10px;
        border-radius: 10px;
        -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
        -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
        box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
</style>
<body>
<div class="container">
    <div class="input-form-backgroud row">
        <div class="input-form col-md-12 mx-auto">
            <div id="Login">
                <br>
                <div class="container" style="background-color: white;">
                    <div id="login-row" class="row justify-content-center align-items-center">
                        <div id="login-column" class="col-md-9">
                            <div id="login-box" class="col-md-12">
                                <form id="login-form" class="form" action="/member/login" method="post">
                                    <h3 class="text-center text-info">Login</h3>
                                    <div class="form-group">
                                        <label for="memberId" class="text-info">ID 입력</label><br>
                                        <input type="text" name="memberId" id="memberId" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="memberPassword" class="text-info">Password 입력</label><br>
                                        <input type="password" name="memberPassword" id="memberPassword" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <br>
                                        <input type="submit" class="btn btn-info btn-md" value="Login">
                                    </div>
                                    <div id="register-link" class="text-right">
                                        <a href="/" class="text-info">Main</a>
                                        <a href="/member/save" class="text-info">회원가입</a> <br>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    let loginResult = "";
    loginResult = '${msg}';
    if(loginResult == "fail"){
        alert("아이디 혹은 비밀번호가 다릅니다!!")
    }
</script>
</html>