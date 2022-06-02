<%--
  Created by IntelliJ IDEA.
  User: GRAM
  Date: 2022-06-02
  Time: 오전 9:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

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
  </head>
  <body>
  <div class="container">
    <div class="input-form-background row">
      <div class="input-form col-md-12 mx-auto">
        <a href="/"><h3 class="mb-3">Market</h3></a>
        <h4 class="mb-3">회원가입</h4>
        <form class="validation-form" novalidate action="/member/save" method="post" name="saveForm">
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="name">이름</label>
              <input type="text" class="form-control" id="name" name="memberName" placeholder="" value="" required>
              <span id="spanName"></span>
            </div>

            <div class="col-md-6 mb-3">
              <label for="memberId">ID</label>
              <input type="text" class="form-control" id="memberId" name="memberId" placeholder="" value="" onblur="duplicateCheck()"  required>
              <span id="spanMemberId"></span>
            </div>
          </div>

          <div class="mb-3">
            <label for="password">비밀번호</label>
            <input type="password" class="form-control" id="password" name="memberPassword" placeholder="비밀번호 입력." required>
            <span id="spanPassword"></span>
          </div>

          <div class="mb-3">
            <label for="passwordCheck">비밀번호 체크</label>
            <input type="password" class="form-control" id="passwordCheck" placeholder="비밀번호 다시입력
" required onblur="passwordCheck()">
            <span id="spanPasswordCheck"></span>
          </div>

          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="email1">이메일</label>
              <input type="text" class="form-control" id="email1" name="memberEmail1" required>
              <span id="spanEmail1"></span>
            </div>
            <div class="col-md-6 mb-3">
              <label for="email2">선택</label>
              <input type="text" class="form-control" id="email2" name="memberEmail2" placeholder="" value="" required>
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
              <input type="text" class="form-control" id="member_post" placeholder="우편번호" value="" name="memberPost" onclick="findAddr()" required readonly>
              <span id="spanPost"></span>
            </div>
            <div class="col-md-6 mb-3">
              <label for="member_address">주소</label>
              <input type="text" class="form-control" id="member_address" placeholder="" value="" name="memberAddress1" onclick="findAddr()" required readonly>
            </div>
          </div>

          <div class="mb-3">
            <label for="address2">상세주소</label>
            <input type="text" class="form-control" id="address2" name="memberAddress2" placeholder="상세주소를 입력해주세요." required>
          </div>
          <span></span>


          <input type="button" class="btn btn-primary btn-lg btn-block" value="가입완료" onclick="save()">
          <input type="button" class="btn btn-primary btn-lg btn-block" value="로그인" onclick="login()">
        </form>
      </div>
    </div>
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; Market</p>
    </footer>
  </div>
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
      let memberName = document.getElementById("name").value;
      let memberId = document.getElementById("memberId").value;
      let password = document.getElementById("password").value;
      let passwordCheck = document.getElementById("passwordCheck").value;
      let email = document.getElementById("email1").value;
      let post = document.getElementById("member_post").value;
      let email2 = document.getElementById("email2").value;

      if(memberName == ""){
        document.getElementById("name").style.borderColor = "red";
        document.getElementById("spanName").style.color = "red";
        document.getElementById("spanName").innerText = "이름을 입력해주세요!!";
      }else{
        document.getElementById("name").style.borderColor = "green";
        document.getElementById("spanName").style.color = "green";
        document.getElementById("spanName").innerText = "";
      }

      if(memberId == ""){
        document.getElementById("memberId").style.borderColor = "red";
        document.getElementById("spanMemberId").style.color = "red";
        document.getElementById("spanMemberId").innerText = "아이디를 입력해주세요!!";
      }

      if(password == ""){
        document.getElementById("password").style.borderColor = "red";
        document.getElementById("spanPassword").style.color = "red";
        document.getElementById("spanPassword").innerText = "비밀번호를 입력해주세요!!";
      }else{
        document.getElementById("password").style.borderColor = "green";
        document.getElementById("spanPassword").style.color = "green";
        document.getElementById("spanPassword").innerText = "";
      }
      if(passwordCheck == ""){
        document.getElementById("passwordCheck").style.borderColor = "red";
        document.getElementById("spanPasswordCheck").style.color = "red";
        document.getElementById("spanPasswordCheck").innerText = "비밀번호 체크를 입력해주세요!!";
      }else if(password != passwordCheck){
        document.getElementById("passwordCheck").style.borderColor = "red";
        document.getElementById("spanPasswordCheck").style.color = "red";
        document.getElementById("spanPasswordCheck").innerText = "비밀번호가 일치하지 않습니다!!";
      }else if(password == passwordCheck){
        document.getElementById("passwordCheck").style.borderColor = "green";
        document.getElementById("spanPasswordCheck").style.color = "green";
        document.getElementById("spanPasswordCheck").innerText = "";
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

      if(saveCheck == 1 && memberName!="" && passwordCheck!= "" && password != "" && email != "" && post != "" && email2 != ""){
        alert("가입이 완료됐습니다!")
        saveForm.submit();
      }
    }

    let saveCheck = 0;
    const duplicateCheck = () => {
      const memberId = document.getElementById("memberId").value;
      const checkResult = document.getElementById("spanMemberId");
      $.ajax({
        type: "post", // http request method
        url: "/member/duplicateCheck", // 요청주소(컨트롤러 주소값)
        data: {"memberId": memberId}, // 전송하는 파라미터
        dataType: "text",
        success: function (result){
          if(result == "ok"){
            checkResult.style.color = "green";
            checkResult.innerHTML = "가입가능 합니다!"
            saveCheck = 1;
          }else{
            checkResult.style.color = "red";
            checkResult.innerHTML = "사용 할 수 없는 아이디 입니다.";
            saveCheck = 0;
          }
        },
        error: function (){
          alert("실패")
        }
      })
    }
    function login() {
      location.href = "/member/login";
    }
  </script>
  </body>

</html>