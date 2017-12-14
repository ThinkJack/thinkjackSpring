<%--
  Created by IntelliJ IDEA.
  User: Uri
  Date: 2017-12-08
  Time: 오후 5:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>EditPage</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/dist/css/tether.min.css">
    <%--<link rel="stylesheet" href="/resources/dist/css/bootstrap.css" />--%>
    <!-- 코드미러 -->
    <link rel="stylesheet" href="/resources/codemirror/lib/codemirror.css" />
    <!-- theme -->
    <link rel="stylesheet" href="/resources/codemirror/theme/night.css">
    <link rel="stylesheet" href="/resources/codemirror/theme/bespin.css">
    <link rel="stylesheet" href="/resources/codemirror/theme/dracula.css">
    <!-- 스크롤바 -->
    <link rel="stylesheet" href="/resources/codemirror/addon/scroll/simplescrollbars.css">
    <!-- autocomplete -->
    <link rel="stylesheet" href="/resources/codemirror/addon/hint/show-hint.css">
    <!-- addon\dialog -->
    <link rel="stylesheet" href="/resources/codemirror/addon/dialog/dialog.css">

    <link rel="stylesheet" href="/resources/dist/css/editCss.css">

    <!--folding-->
    <link rel="stylesheet" href="/resources/codemirror/addon/fold/foldgutter.css" />
    <link rel="stylesheet" href="css/editCss.css">

    <link rel="stylesheet" href="/resources/codemirror/lib/codemirror.css"/>
    <!--folding-->
    <link rel="stylesheet" href="/resources/codemirror/addon/fold/foldgutter.css"/>
    <!-- autocomplete -->
    <link rel="stylesheet" href="/resources/codemirror/addon/hint/show-hint.css">
    <!-- addon\dialog :good looking input dialogs -->


</head>
<body>
<!-- header 메뉴바 -->
<nav class="navbar navbar-expand-md navbar-dark fixed-top">

    <a class="navbar-brand" href="#"><img src="/resources/images/logo.png" style="width:20px;"></a>

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault"
            aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <!--href="" 는 현재 패이지 reload해줌 -->
                <a class="nav-link" href="">name <span class="sr-only">(current)</span></a>
            </li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="nav-item active run" id="run">
                <div>
                    <a class="btn btn-outline-dark" href="javascript:;">
                        <img src="/resources/images/reload.png"> Run
                    </a>
                </div>
            </li>
            <li class="nav-item active">
                <div>
                    <!-- 좋아요 버튼 -->
                    <a class="btn btn-outline-dark" href="javascript:likebt();">
                        <img src="/resources/images/like1.png" id="likebt"> Like
                    </a>
                </div>
            </li>
            <li class="nav-item active">
                <div>
                    <a class="btn btn-outline-dark" href="javascript:;" data-toggle="modal" data-target="#setting">
                        <img src="/resources/images/setting.png"> Setting
                    </a>
                </div>
            </li>
            <li class="nav-item active">
                <a class="btn btn-outline-dark" href="javascript:;" data-toggle="modal" data-target="#changeView">
                    <img src="/resources/images/view.png"> Change View
                </a>
            </li>
        </ul>
    </div>
</nav>
