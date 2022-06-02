<%--
  Created by IntelliJ IDEA.
  User: GRAM
  Date: 2022-06-02
  Time: 오후 3:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <title>update</title>
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
    <div class="input-form-background row">
        <div class="input-form col-md-12 mx-auto">
            <h4 class="mb-3">회원정보 수정</h4>
            <form class="validation-form" novalidate action="/member/update" method="post" name="updateForm">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="name">이름</label>
                        <input type="text" style="border:none" class="form-control" id="name" name="memberName"  value="${memberDTO.memberName}" readonly>
                        <span id="spanName"></span>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label for="memberId">ID</label>
                        <input type="text" style="border:none" class="form-control" id="memberId" name="memberId" placeholder="" value="${memberDTO.memberId}"  readonly>
                        <span id="spanMemberId"></span>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="password">비밀번호</label>
                    <input type="password" class="form-control" id="password" name="memberPassword" placeholder="비밀번호 입력." required>
                    <span id="spanPassword"></span>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="email1">이메일</label>
                        <input type="text" class="form-control" id="email1" name="memberEmail1" value="${memberDTO.memberEmail1}" required>
                        <span id="spanEmail1"></span>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="email2">선택</label>
                        <input type="text" class="form-control" id="email2" name="memberEmail2" placeholder="" value="${memberDTO.memberEmail2}" required>
                        <h1></h1>
                        <select name="" id="domain" onchange="emailSelect()">
                            <option value="@">직접입력</option>
                            <option value="@naver.com">네이버</option>
                            <option value="@gmail.com">지메일</option>
                            <option value="@daum.net">다음</option>
                            <option value="@kakao.com">카카오</option>
                        </select>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="member_post">우편번호</label>
                        <input type="text" class="form-control" id="member_post" placeholder="우편번호" value="${memberDTO.memberPost}" name="memberPost" onclick="findAddr()" required readonly>
                        <span id="spanPost"></span>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="member_address">주소</label>
                        <input type="text" class="form-control" id="member_address" placeholder="" value="${memberDTO.memberAddress1}" name="memberAddress1" onclick="findAddr()" required readonly>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="address2">상세주소</label>
                    <input type="text" class="form-control" id="address2" name="memberAddress2" value="${memberDTO.memberAddress2}" placeholder="상세주소를 입력해주세요." required>
                </div>
                <span></span>


                <input type="button" class="btn btn-primary btn-lg btn-block" value="수정" onclick="save()">
                <input type="button" class="btn btn-primary btn-lg btn-block" value="회원탈퇴" onclick="delete1()">
            </form>
        </div>
    </div>
</div>


</body>
<script>

    const passwordCheck = () =>{

    }

    function emailSelect() {
        const domainValue = document.getElementById("domain").value;
        const email2 = document.getElementById("email2");
        email2.value = domainValue;
    }

    function findAddr(){
        new daum.Postcode({
            oncomplete: function(data) {

                console.log(data);

                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var jibunAddr = data.jibunAddress; // 지번 주소 변수
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('member_post').value = data.zonecode;
                if(roadAddr !== ''){
                    document.getElementById("member_address").value = roadAddr;
                }
                else if(jibunAddr !== ''){
                    document.getElementById("member_address").value = jibunAddr;
                }
            }
        }).open();
    }

    function save(){
        let password = document.getElementById("password").value;
        let email = document.getElementById("email1").value;
        let post = document.getElementById("member_post").value;
        let email2 = document.getElementById("email2").value;


        if(password == ""){
            document.getElementById("password").style.borderColor = "red";
            document.getElementById("spanPassword").style.color = "red";
            document.getElementById("spanPassword").innerText = "비밀번호를 입력해주세요!!";
        }else if(password == "${memberDTO.memberPassword}"){
            document.getElementById("password").style.borderColor = "green";
            document.getElementById("spanPassword").style.color = "green";
            document.getElementById("spanPassword").innerText = "";
        }else if(password != "${memberDTO.memberPassword}"){
            document.getElementById("password").style.borderColor = "red";
            document.getElementById("spanPassword").style.color = "red";
            document.getElementById("spanPassword").innerText = "비밀번호가 일치하지 않습니다!!";
        }

        if(email == "" || email2 == ""){
            document.getElementById("email1").style.borderColor = "red";
            document.getElementById("spanEmail1").style.color = "red";
            document.getElementById("spanEmail1").innerText = "이메일을 입력해주세요!!";
        }else{
            document.getElementById("email1").style.borderColor = "green";
            document.getElementById("spanEmail1").style.color = "green";
            document.getElementById("spanEmail1").innerText = "";
        }

        if(post == ""){
            document.getElementById("member_post").style.borderColor = "red";
            document.getElementById("spanPost").style.color = "red";
            document.getElementById("spanPost").innerText = "주소를 입력해주세요!!";
        }else{
            document.getElementById("member_post").style.borderColor = "green";
            document.getElementById("spanPost").style.color = "green";
            document.getElementById("spanPost").innerText = "";
        }

        if(password != "" && email != "" && post != "" && email2 != "" && password == '${memberDTO.memberPassword}'){
            alert("수정 되었습니다!!")
            updateForm.submit();
        }
    }

    function login() {
        location.href = "/member/login";
    }
    function delete1(){
        let password = document.getElementById("password").value;
        if(password == '${memberDTO.memberPassword}'){
            alert("회원탈퇴 되었습니다.")
            location.href = "/member/delete"
        }else{
            alert("비밀번호가 일치하지 않습니다!!")
        }
    }
</script>
</html>
