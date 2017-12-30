<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <!--필수 -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
.mainNavbarEdit{
    margin-top: 60px;
}
.navbar-brand{
    width:93%;
    margin-right: 0;
    background-color: #6a0d6a;
}


        .navbar {
            margin-bottom: 0;
            z-index: 9999;
            border: 0;
            font-size: 20px !important;
            line-height: 1.42857143 !important;
            letter-spacing: 8px;
            border-radius: 0;
        }

        .navbar li a{}
        .navbar{}
.navbar-brand {
    position: relative;
    left: 15px;
        }
        .navbar-nav li a:hover, .navbar-nav li.active a {
            color: #0C1021!important;
            background-color: #fff !important;
        }
        .navbar-default .navbar-toggle {
            border-color: transparent;
            color: #fff !important;
        }
        .iconBtn
        { border-radius: 0;

        }
        @media screen and (max-width: 768px) {
            .col-sm-4 {
                text-align: center;
                margin: 25px 0;
            }
        }
        .removePadding{
            padding-left: 0;
            padding-right: 0;
        }
    </style>
</head>

<!--배경색 변경가능 (class 이름 변경으로 색상 선택 가능)-->
<%--총 넓이 2600--%>

<body id="mainPage" data-spy="scroll" data-target=".navbar" data-offset="60">

<nav class="navbar navbar-default  navbar-fixed-top">
    <div class="row mainNavbarEdit">
        <div class="col-lg-2" removePadding></div>
        <div class="col-lg-3 removePadding" >
            <%--49px왼쪽 페딩--%>
            <a class="navbar-brand" href="#mainPage">Logo</a>
        </div>
        <div class="col-lg-5 removePadding" >
            <form class="form-inline my-2 my-lg-0g"  style="text-align: right">
                <button  class="btn btn-outline-secondary iconBtn" type="submit">로그인</button>
                <button class="btn btn-outline-light iconBtn" type="submit">Mypage</button>
                <button class="btn btn-outline-dark iconBtn" type="submit">ㄴㄴ</button>
            </form>
            <div class="navbar-header ">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#mainNavbar" >
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse" id="mainNavbar" >
                <ul class="nav navbar-nav ">
                    <li><a href="#main">Main</a></li>
                    <li><a href="#editor">Editor</a></li>
                    <li><a href="#test">Test</a></li>
                    <li><a href="#board">Board</a></li>
                </ul>
            </div>
        </div>
        <div class="col-lg-2 removePadding"></div>
    </div>
</nav>


