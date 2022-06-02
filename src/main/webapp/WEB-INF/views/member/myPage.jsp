<%--
  Created by IntelliJ IDEA.
  User: GRAM
  Date: 2022-06-02
  Time: 오후 2:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <style>
        body{
            padding: 0;
            margin: 0;
        }
        div{
            box-sizing: border-box;
        }

        /* alert badge */
        .circle{
            display: inline-block;
            width: 5px;
            height: 5px;
            border-radius: 2.5px;
            background-color: #ff0000;
            position: absolute;
            top: -5px;
            left: 110%;
        }

        /* 녹색 텍스트 */
        .green{
            color: #24855b;
        }

        .wrap{
            background-color: #F8F8F8;
        }
        /* 녹색배경 */
        .greenContainer{
            height: 132px;
            background-color: #24855b;

            display: flex;
            align-items: flex-end;
            padding: 16px;
        }

        .greenContainer .name{
            font-size: 20px;
            font-weight: bold;
            color: #ffffff;
        }
        .greenContainer .modify{
            margin-left: auto;
        }

        /* 단골상점 , 상품후기 , 적립금 박스 */
        .summaryContainer{
            background-color: white;
            display: flex;
            padding: 21px 16px;
            height: 90px;
            margin-bottom: 10px;
        }
        /* 단골상점 , 상품후기 , 적립금 */
        .summaryContainer .item{
            flex-grow: 1
        }
        /* 녹색 숫자 */
        .summaryContainer .number{
            font-size: 19px;
            font-weight: bold;
            color: #24855b;
        }
        /* 텍스트 */
        .summaryContainer .item > div:nth-child(2){
            font-size: 13px;
        }

        /* ================== 주문/배송조회 박스 시작 ==================== */
        .shippingStatusContainer{
            padding: 21px 16px;
            background-color: white;
            margin-bottom: 10px;
        }

        /* 주문/배송조회 타이틀 */
        .shippingStatusContainer .title{
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 15px;
        }

        /* 장바구니 결제완료 배송중 구매확정 [로우] */
        .shippingStatusContainer .status{
            display: flex;
            justify-content: space-between;
            margin-bottom: 21px;
        }
        /* 장바구니 결제완료 배송중 구매확정 [아이템]  */
        .shippingStatusContainer .item{
            display: flex;
        }

        .shippingStatusContainer .number{
            font-size: 31px;
            font-weight: 500;
            text-align: center;
        }
        .shippingStatusContainer .text{
            font-size: 12px;
            font-weight: normal;
            color: #c2c2c2;
            text-align: center;
        }
        .shippingStatusContainer .icon{
            display: flex;
            align-items: center;
            padding: 20px;
            width: 16px;
            height: 16px;
        }


        /*=================== 주문목록 ~ 찜한상품 리스트 ==================*/
        .listContainer{
            padding: 0;
            background-color: #ffffff;
            margin-bottom: 10px;
        }
        .listContainer .item{
            display: flex;
            align-items: center;
            padding: 16px;
            color: black;
            text-decoration: none;
            height: 56px;
            box-sizing: border-box;
        }
        .listContainer .icon{
            margin-right: 14px;
        }
        .listContainer .text{
            font-size: 16px;
            position: relative;
        }
        .listContainer .right{
            margin-left: auto;
        }


        /*=================== 내지갑의 보유 적립금 들어가는 부분 ================*/
        .listContainer .smallLight{
            font-size: 14px;
            color: #c2c2c2;
        }
        .listContainer .smallLight > span{
            margin-left: 10px;
        }

        .listContainer .right .blct{
            font-size: 14px;
            font-weight: bold;
            margin-right: 5px;
        }



        /* 공지사항 이용안내 고객센터 */
        .infoContainer{
            background-color: white;
            display: flex;
            height: 100px;
            margin-bottom: 10px;
        }

        .infoContainer .item{
            flex-grow: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            font-size: 13px;
            text-decoration: none;
            color: black;
        }
        .infoContainer .item > div:first-child{
            margin-bottom: 2px;
        }



        /*  */
        .listContainer .item:hover{
            /*   background-color: #f8f8f8; */
        }
        .infoContainer .item:hover{
            /*   background-color: #f8f8f8; */
        }
    </style>
    <title>myPage</title>
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
<div class="wrap">
    <div class="shippingStatusContainer">
        <div class="title">
            주문/배송내역
        </div>
        <div class="status">

            <div class="item">
                <div>
                    <div class="green number">ex</div>
                    <div class="text">장바구니</div>
                </div>
                <div class="icon"> > </div>
            </div>
            <div class="item">
                <div>
                    <div class="number">ex</div>
                    <div class="text">구매완료</div>
                </div>
                <div class="icon"> > </div>
            </div>
            <div class="item">
                <div>
                    <div class="green number">ex</div>
                    <div class="text">판매완료</div>
                </div>
                <div class="icon"> > </div>
            </div>

        </div>

    </div>
    <div class="listContainer">
        <a href="/member/update" class="item">
            <div class="icon">ii</div>
            <div class="text">회원정보 수정</div>
            <div class="right"> > </div>
        </a>
        <a href="#" class="item">
            <div class="icon">ii</div>
            <div class="text">구매목록</div>
            <div class="right"> > </div>
        </a>
        <a href="#" class="item">
            <div class="icon">ii</div>
            <div class="text">판매목록</div>
            <div class="right"> > </div>
        </a>
        <a href="#" class="item">
            <div class="icon">ii</div>
            <div class="text">거래내역</div>
            <div class="right"> > </div>
        </a>
        <a href="#" class="item">
            <div class="icon">ii</div>
            <div class="text">장바구니</div>
            <div class="right"> > </div>
        </a>
    </div>
</div>
</div>
</body>
</html>
