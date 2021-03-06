<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
    <link rel="shortcut icon" href="/resources/images/favicon/idea.ico" type="image/x-icon" />
    <link rel="icon"  href="/resources/images/favicon/idea.ico"  type="image/x-icon"  />
    <title>rnasterpiece</title>
    <!--필수 -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=0.5, maximum-scale=1, user-scalable=no">

    <%--애니메이션 효과--%>
    <link rel="stylesheet" href="/resources/dist/css/animate.min.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/animate.css@3.5.2/animate.min.css">
    <%--이모티콘--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <link href="/resources/bootstrap-social.css" rel="stylesheet">

    <!-- jquery load -->

    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>--%>
    <%--bootstrap--%>
    <%--<link rel="stylesheet" href="/resources/dist/css/bootstrap.css">--%>
    <%--<link rel="stylesheet" href="/resources/dist/css/bootstrap.min.css">--%>
    <%--<link rel="stylesheet" href="/resources/dist/css/_bootswatch.scss">--%>
    <link href="https://maxcdn.bootstrapcdn.com/bootswatch/4.0.0-beta.3/sketchy/bootstrap.min.css" rel="stylesheet">
    <%--<link rel="stylesheet" href="/resources/dist/css/_variables.scss">--%>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
    <script src="/resources/dist/js/bootstrap.min.js"></script>



    <link href="/resources/dist/css/home.css" rel="stylesheet">
    <%--jquery--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <%--스크롤 애니메이션--%>
    <script src="https://unpkg.com/scrollreveal/dist/scrollreveal.min.js"></script>
    <%--첨부파일--%>
    <script src="/resources/dist/js/upload.js"></script>

    <script>
        var msg=Boolean("${msg}");
        if(msg){
            alert("${msg}");
        }
        $(document).ready(function() {
            $(".profileHeader").attr("src",getFileInfo("${login.userProfile}"));
        });
    </script>
    <style>
        .naver{
            background-color:#1EC800;
            margin-top: 5px;
            color:white;
        }
        .naverImg{
            /*background-color:#1EC800;*/
            height:32px;
            margin:auto;
            padding-right:4px;
            padding-left:4px;
            padding:3px;
        }
        /*.naverImg:hover {*/
        /*!*box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);*!*/
        /*background-color: #00b300;*/
        /*}*/
        .naver:hover{
            /*box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);*/
            background-color: #00b300;
            color:white;
        }


        .navbar {
            margin-bottom: 20px;
        }

    </style>
</head>

<body data-spy="scroll" data-target=".navbar" data-offset="50">

<nav class="navbar navbar-expand-lg navbar-light bg-light  fixed-top bd">
    <%--<a class="navbar-brand" href="#">Expand at lg</a>--%>
    <a class="navbar-brand " href ='/' style="font-size: 40px">
        <img class="rounded-circle" style=" height:50px;" src="/resources/images/idea.png" >
    </a>

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation" style="">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse " id="navbarColor03">
        <%--<ul class="nav nav-pills mx-auto ">--%>
        <ul class="nav nav-pills col-12 row justify-content-between align-items-center">
            <div class="row col-6 justify-content-start align-items-center">

                <li class="nav-item dropdown pointer " >
                    <a class="nav-link dropdown-toggle " id="Service" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Service</a>
                    <div class="dropdown-menu pointerA hn" aria-labelledby="Service" style="position: absolute; transform: translate3d(0px, 35%, 0px); top: 0px; left: 0px; will-change: transform;">
                        <a class="dropdown-item" href="/edit/editPage">Editor</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="/edit/JSAlgorithm">JSAlgorithm</a>
                    </div>
                </li>
                <li class="nav-item dropdown pointer2" >
                    <a class="nav-link dropdown-toggle "  id="Board"  data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Board</a>
                    <div class="dropdown-menu pointerB  hn" aria-labelledby="Board" style="position: absolute; transform: translate3d(0px, 17%, 0px); top: 0px; left: 0px; will-change: transform;">
                        <a class="dropdown-item " href='/board/list?category=notice'>공지사항</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item " href='/board/list?category=qna'>질문 게시판</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item " href='/srcBoard/srcList'>코드 게시판</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item " href='/board/list?category=free'>자유 게시판</a>
                    </div>
                </li>
            </div>

            <div class="row col-6 justify-content-end align-items-center">
                <%--로그아웃 상태--%>
                <c:if test="${login eq null}">

                    <li class="nav-item">
                        <button  class="btn btn-outline-primary hn " onclick="location.href='/user/login'" style="font-size: 20px ;height:50px;">로그인</button>
                    </li>
                    <%--<li class="nav-item">--%>
                        <%--<a  class="nav-link"><img class="rounded-circle Photo" src="/resources/images/123.png"></a>--%>
                    <%--</li>--%>
                    <%--</ul>--%>
                </c:if>
                <%--로그인 상태--%>
                <c:if test="${login ne null}">
                    <%--<ul class="nav nav-pills ml-auto w-100 justify-content-end ". style="float: right;margin-right: 10%;">--%>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle  " data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                            <img  class="rounded-circle Photo profileHeader" src="" ></a>
                        <div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; transform: translate3d(0px, 65px, 0px); top: 0px; left: 0px; will-change: transform;">
                            <div class="eclipsis pl-4" style="width:70% ">
                                <a class=" hn " >${login.userName}</a>
                            </div>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item hn" href="/user/myinfo">마이페이지</a>
                            <a class="dropdown-item hn" href='/user/logout'>로그아웃</a>
                        </div>
                    </li>
                    <%--</ul>--%>
                </c:if>
            </div>
            <%--</ul>--%>
        </ul>

    </div>
</nav>


<script>
    $(function(){
        $('.pointer').mouseenter(function(){
            $('.pointerA').addClass('show');

        });
        $('.pointer').mouseleave(function(){
            $('.pointerA').removeClass('show');

        });

        $('.pointer2').mouseenter(function(){
            $('.pointerB').addClass('show');

        });
        $('.pointer2').mouseleave(function(){
            $('.pointerB').removeClass('show');

        });
    });
</script>
