<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
    <!--필수 -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="/resources/dist/css/home.css" rel="stylesheet">
</head>
<%--스크롤--%>
<a href="javascript:" id="return-to-top"><i class="icon-chevron-up"></i></a>
<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">


<body id="mainPage" data-spy="scroll" data-target=".navbar" data-offset="60">

<nav class="navbar navbar-default  navbar-fixed-top ">
    <div class="row mainNavbarEdit">
        <div class="col-lg-2" removePadding></div>
        <div class="col-lg-3 removePadding" >

        </div>
        <div class="col-lg-5 removePadding" >

            <div class="container-fluid">

                <div class="collapse navbar-collapse width1" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav snip1189 ">
                            <li class="current"><a href="#main" >Main</a></li>
                            <li><a href="#editor" >Service</a></li>
                            <%--<li class="dropdown">--%>
                                <%--<a href="#board" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" >Board</a>--%>
                                <%--<ul class="dropdown-menu" >--%>
                                    <%--<li><a href="/board/list?category=free">Free</a></li>--%>
                                    <%--<li><a href="#">QNA</a></li>--%>
                                    <%--<li><a href="#">도움말</a></li>--%>
                                    <%--<li class="divider"></li>--%>
                                    <%--<li><a href="#">소스 게시판</a></li>--%>
                                <%--</ul>--%>
                            <%--</li>--%>
                        <li><a href="#board" >Board</a></li>

                    </ul>
                    <%--로그인 되었을때--%>
                    <c:if test="${login eq null}">
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <div class="btn-group login" role="group" aria-label="Basic example">
                                    <button id="loginBtn" type="button" class="btn btn-secondary button1 rounded-0">로그인</button>
                                    <button id="joinBtn" type="button" class="btn btn-secondary button1 rounded-0">회원가입</button>
                                </div></li>
                            <li>
                            <a  id="updateicon" class="dropdown-toggle loginPoto" data-toggle="dropdown" role="button" aria-expanded="false"><img class="img-circle" src="/resources/images/mycircle.png" ></a>
                            </li>

                        </ul>
                    </c:if>

                    <c:if test="${login ne null}">
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <div class="btn-group login" role="group" aria-label="Basic example">
                                    <button id="logoutBtn" type="button" class="btn btn-secondary button1 rounded-0">로그아웃</button>
                                </div></li>

                            <li class="dropdown">
                                <a href="#" id="updateBtn" class="dropdown-toggle loginPoto" data-toggle="dropdown" role="button" aria-expanded="false"><img class="img-circle"  src="/resources/images/main2.jpg" ></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="#">회원정보 수정</a></li>
                                    <li><a href="#">마이페이지</a></li>
                                        <%--<li><a href="#">Something  else here</a></li>--%>
                                        <%--<li class="divider"></li>--%>
                                        <%--<li><a href="#">Separated link</a></li>--%>
                                </ul>
                            </li>
                        </ul>
                    </c:if>
                </div><!-- /.navbar-collapse -->

            </div><!-- /.container-fluid -->

        </div>
        <div class="col-lg-2 removePadding">
        </div>
    </div>
</nav>




