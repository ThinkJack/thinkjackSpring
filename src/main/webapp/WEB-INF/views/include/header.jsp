<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <!--필수 -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!--w3schools-->
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <title>Thinkjack</title>

    <!--css파일 연결부분-->
    <link href="/resources/dist/css/common.css" rel="stylesheet">
    <link href="/resources/dist/css/main.css" rel="stylesheet">

    <!--sidenavbar-새로운 게시글 알림-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
    <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>

    <!--아이콘-->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>

<!--배경색 변경가능 (class 이름 변경으로 색상 선택 가능)-->
<%--총 넓이 2600--%>
<body class="w3-white w3-content " style="max-width:2600px">

    <div class="row">
        <div class="col-8"></div>
        <div class="col-4">
            <button href="">로그인</button>
            <!--로그인 했을때-->
            <!--<button href="">로그인</button>-->
            <!--<button href="" style="padding-left:10px;">버튼2</button>-->
        </div>
    </div>


    <!--center navbar-->
    <header class="w3-panel w3-center w3-opacity" >
        <div class="w3-padding-64">
            <div class="w3-bar w3-border">
                <a href="/main" class="w3-bar-item w3-button ">Home</a>
                <a href="/board/list?category=free" class="w3-bar-item w3-button ">Cummunity</a>
                <a href="/board/list?category=qna" class="w3-bar-item w3-button ">QNA</a>
                <a href="/board/list?category=notice" class="w3-bar-item w3-button "> Release Notes</a>
                <a href="/edit/editPage" class="w3-bar-item w3-button "> Editor</a>
                <a href="/edit/unitTest" class="w3-bar-item w3-button "> UnitTest</a>
            </div>
        </div>

    </header>