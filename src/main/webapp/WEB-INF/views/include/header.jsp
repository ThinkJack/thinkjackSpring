<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
    <!--필수 -->
    <meta charset="utf-8">
    <%--반응형 웹디자인 아닌 조정폭--%>
    <%--<meta name="viewport" content="width=device-width, initial-scale=1">--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


    <link href="/resources/dist/css/home.css" rel="stylesheet">

    <%--애니메이션 효과--%>
    <%--<link rel="stylesheet" href="/resources/dist/css/animate.min.css">--%>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/animate.css@3.5.2/animate.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/scrollreveal/dist/scrollreveal.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <%--이미지 파일 작업관련 js 정의한 파일--%>
    <script src="/resources/upload.js"></script>
    <script>
        var msg=Boolean("${msg}");
        if(msg){
            alert("${msg}");
        }

        $(document).ready(function() {
            var headerimg;
            var fullName="${login.userProfile}";

            var test =fullName.lastIndexOf("/");
            fileName= fullName.substring(test+1,fullName.length);
            path= fullName.substring(0,test+1);
//            console.log(path);
//            console.log(fileName);
//            console.log(test);
            profileheader =path+"s_"+fileName;
//            console.log(fullName);
            if(fullName!=="") {
                headerimg = getFileInfo(profileheader);
                // console.log(headerimg);
                hstr = headerimg;
            }else{
                hstr = "/resources/images/like1.png";
            }

            $("#profileHeader").attr("src",hstr);
        });
    </script>
</head>

<body>

<div  class="container-fluid removePadding">
    <div class="row removePadding">

            <nav class="navbar navbar-inverse navbar-fixed-top">
                <div class="col-xs-2 removePadding" >

                </div>

                <div class="col-xs-5 removePadding" >
                    <a class="navbar-brand " onclick="location.replace('/main')">Logo</a>

                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>

                    <div class="collapse navbar-collapse" id="myNavbar" >
                        <ul class="nav navbar-nav   pt5">
                            <li><a href="#main" >Main</a></li>
                            <li><a href="#editor" >Service</a></li>
                            <li><a href="#board" >Board</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-xs-3 removePadding" >

                    <%--로그아웃 상태--%>
                    <c:if test="${login eq null}">
                    <ul class="nav navbar-nav navbar-right">

                        <li>
                            <div class="btn-group login" role="group" aria-label="Basic example">
                                <button id="loginBtn"  class="btn btn-secondary button1 btn-13 pt5" onclick="location.replace('/user/login')" >로그인</button>
                            </div>
                        </li>


                        <li>
                            <a  id="updateicon" class="dropdown-toggle loginPoto" data-toggle="dropdown" role="button" aria-expanded="false"><img class="img-circle widthFull"  src="/resources/images/main2.jpg" ></a>
                        </li>
                    </ul>

                        </c:if>
                        <%--로그인 상태--%>
                        <c:if test="${login ne null}">
                            <ul class="nav navbar-nav navbar-right">

                                <li>
                                    <div class="btn-group login" role="group" aria-label="Basic example">
                                        <button id="logoutBtn" type="button" class="btn btn-secondary btn-13 button1 pt5"  onclick="location.replace('/user/logout')" >로그아웃</button>
                                    </div>
                                </li>

                                <li class="dropdown">
                                    <a href="#" id="updateBtn" class="dropdown-toggle loginPoto" data-toggle="dropdown" role="button" aria-expanded="false"><img id="profileHeader " class="poto" src=""  ></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="/user/modifyinfo">회원정보 수정</a></li>

                                    </ul>
                                </li>
                            </ul>
                        </c:if>
                </div>
            </nav>
    </div>

</div>

