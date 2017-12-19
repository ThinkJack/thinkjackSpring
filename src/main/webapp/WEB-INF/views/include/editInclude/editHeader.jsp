<%--
  Created by IntelliJ IDEA.
  User: Uri
  Date: 2017-12-08
  Time: 오후 5:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- header 메뉴바 -->
<nav class="navbar navbar-expand-md navbar-dark fixed-top">

    <a class="navbar-brand" href="#"><img src="/resources/images/logo.png" style="width:30px;"></a>

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto page_info">
            <li class="nav-item active">
                <!--href="" 는 현재 패이지 reload해줌 -->
                <div class="page_title_view" id="page-title-view">
                    <a class="page_title">
                        <span id="page-title">Title</span>
                    </a>
                    <img class="pencil" id="pencil" src="/resources/images/pencil.png">
                </div>
                <div class="page_title_text"  id="page-title-text">
                    <input type="text" name="page-title" id="page-title-input" value=""/>
                </div>
                <div class="row"><span style="color: #9c9c9c;">A masterpiece by &nbsp;</span><span id="page-user-id">Name</span></div>
            </li>
            <li class="nav-item">
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
                    <img src="/resources/images/browser-visualization.png"> Change View
                </a>
            </li>
        </ul>
    </div>
</nav>
