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
    padding-top: 5%;
}

        .navbar {
            margin-bottom: 0;
            background-color: #0C1021;
            z-index: 9999;
            border: 0;
            font-size: 15px !important;
            line-height: 1.42857143 !important;
            letter-spacing: 6px;
            border-radius: 0;


        }

        .navbar li a, .navbar .navbar-brand {
            color: #fff !important;
        }
        .navbar-nav li a:hover, .navbar-nav li.active a {
            color: #f4511e !important;
            background-color: #fff !important;
        }
        .navbar-default .navbar-toggle {
            border-color: transparent;
            color: #fff !important;
        }
        @media screen and (max-width: 768px) {
            .col-sm-4 {
                text-align: center;
                margin: 25px 0;
            }
        }
    </style>
</head>

<!--배경색 변경가능 (class 이름 변경으로 색상 선택 가능)-->
<%--총 넓이 2600--%>

<body id="mainPage" data-spy="scroll" data-target=".navbar" data-offset="60">

<nav class="navbar navbar-default  navbar-fixed-top">
    <div class="row mainNavbarEdit">
        <div class="col-lg-2" style="background-color: #aa0000"></div>
        <div class="col-lg-3" style="background-color: #00a8c6">
            <a class="navbar-brand" href="#mainPage">Logo</a>
        </div>
        <div class="col-lg-5" style="background-color: #2E8B57">
            <form class="form-inline my-2 my-lg-0"  style="text-align: right">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
            <div class="navbar-header">
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
        <div class="col-lg-2" style="background-color: #aa0000"></div>
    </div>
</nav>


