<%--
  Created by IntelliJ IDEA.
  User: GRAM
  Date: 2022-06-03
  Time: 오전 9:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <title>board/save.jsp</title>
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
    <h2>판매등록</h2>
    <br>
    <form action="/board/save" method="post" name="saveForm" enctype="multipart/form-data">
        <table class="table table-border">
            <tr>
                <th>작성자</th>
                <td>${sessionScope.loginMemberId}</td>
                <input type="hidden" name="memberId" value="${sessionScope.loginMemberId}">
            </tr>
            <tr>
                <th>제목(필수)</th>
                <td><input type="text" name="boardTitle" id="boardTitle"></td>
            </tr>
            <tr>
                <th>내용(필수)</th>
                <td><textarea name="boardContents" id="boardContents" cols="50" rows="10"></textarea></td>
            </tr>
            <tr>
                <th>거래 가격(필수)</th>
                <td><input type="text" name="boardPrice" id="boardPrice">(원)</td>
            </tr>
            <tr>
                <th>희망 거래지역(필수)</th>
                <td>
                    <select name="boardAddress" id="boardAddress">
                        <option value="">지역선택</option>
                        <option value="서울특별시">서울특별시</option>
                        <option value="인천광역시">인천광역시</option>
                        <option value="대전광역시">대전광역시</option>
                        <option value="대구광역시">대구광역시</option>
                        <option value="울산광역시">울산광역시</option>
                        <option value="부산광역시">부산광역시</option>
                        <option value="광주광역시">광주광역시</option>
                        <option value="경기도">경기도</option>
                        <option value="강원도">강원도</option>
                        <option value="충청도">충청도</option>
                        <option value="전라도">전라도</option>
                        <option value="경상도">경상도</option>
                        <option value="제주도">제주도</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>카테고리(필수)</th>
                <td>
                    <select name="boardCategory" id="boardCategory">
                        <option value="">카테고리 선택</option>
                        <option value="전자기기">전자기기</option>
                        <option value="식품">식품</option>
                        <option value="가전">가전</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>대표사진(필수)</th>
                <td><input type="file" name="boardProfile1" id="boardProfile"></td>
            </tr>
            <tr>
                <th>추가 사진</th>
                <td><input type="file" name="boardFile1"></td>
            </tr>
            <tr>
                <td><input style="border: #dde0e3; background-color: #dde0e3; color: black;" class="btn btn-primary" type="button" onclick="save()" value="판매등록"></td>
                <td></td>
            </tr>
        </table>
    </form>
</div>
</body>
<script>
    function save(){
        let boardTitle = document.getElementById("boardTitle").value;
        let boardContents= document.getElementById("boardContents").value;
        let boardPrice = document.getElementById("boardPrice").value;
        let boardAddress = document.getElementById("boardAddress").value;
        let boardCategory = document.getElementById("boardCategory").value;
        let boardProfile = document.getElementById("boardProfile").value;

        if (boardTitle == ""){
            alert("제목을 입력해주세요")
        }else {
            if(boardContents == ""){
                alert("내용을 입력해주세요")
            }else {
                if(boardPrice == ""){
                    alert("가격을 입력해주세요")
                }else{
                    if(boardAddress == ""){
                        alert("희망지역을 선택해주세요")
                    }else{
                        if(boardCategory == ""){
                            alert("카테고리를 선택해주세요")
                        }else {
                            if(boardProfile == ""){
                                alert("대표사진을 선택해주세요")
                            }else{
                                alert("글이 등록되었습니다.")
                                saveForm.submit();
                            }
                        }
                    }
                }
            }
        }
    }
</script>
</html>
