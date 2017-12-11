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

    <a class="navbar-brand" href="#"><img src="/resources/images/logo.png" style="width:20px;"></a>

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
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
            <li class="nav-item active">
                <div>
                <!-- 좋아요 버튼 -->
                    <a class="btn btn-outline-dark" href="javascript:;" >
                        <img src="/resources/images/like1.png" id="like"> Like
                    </a>
                </div>
            </li>
            <li class="nav-item active">
                <div>
                    <a class="btn btn-outline-dark" href="javascript:;" data-toggle="modal" data-target="#Setting">
                        <img src="/resources/images/setting.png"> Setting
                    </a>
                </div>
            </li>
            <li class="nav-item active">
                <a class="btn btn-outline-dark" href="javascript:;" data-toggle="modal" data-target="#ChangeView">
                    <img src="/resources/images/view.png"> Change View
                </a>
            </li>
        </ul>
    </div>
</nav>