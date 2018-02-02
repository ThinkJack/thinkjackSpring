<%--
  Created by IntelliJ IDEA.
  User: Uri
  Date: 2017-12-08
  Time: 오후 5:06
  To change this template use File | Settings | File Templates.
--%>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header 메뉴바 -->
<nav class="navbar  navbar-expand-lg navbar-light bg-light fixed-top">

    <a class="navbar-brand" href="/"><img class="rounded-circle" style=" height:50px;" src="/resources/images/idea.png" ></a>

    <div class="navbar-defualt">

                <div class="page_title_view justify-content-start" id="page-title-view">
                    <a class="page_title text-dark">
                        <span id="src-title">JS-Algorithm</span>
                    </a>
                    <i class="fa fa-flask" style="color: black"></i>
                </div>
                <div class="page_title_text"  id="page-title-text">
                    <input type="text" name="page-title" id="src-title-input" value=""/>
                </div>
                <div class="row"><span class="bd" style="color: #9c9c9c;">A masterpiece by &nbsp;</span></div>

    </div>
<c:if test="${login eq null}">
    <div class="nav mx-auto" style="margin-right: 0px !important">

    <a class="btn btn-primary justify-content-end" href="/user/login">
        Login
    </a>
    </div>
</c:if>
    <c:if test="${login ne null}">
    <div class="nav mx-auto" style="margin-right: 0px !important">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle  pt-0" data-toggle="dropdown" href="#" role="button"
               aria-haspopup="true" aria-expanded="false">
                <img class="rounded-circle Photo " id="profileHeader" src=""
                     style="width:38px; height:38px;"></a>

            <div class="dropdown-menu" x-placement="bottom-start"
                 style="position: absolute; transform: translate3d(-60px, 65px, 0px); top: 0px; left: 0px; will-change: transform;">
                <div class="eclipsis pl-4" style="width:70% ">
                    <a class=" hn ">${login.userName}</a>
                </div>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item hn" href="/user/myinfo">마이페이지</a>
                <a class="dropdown-item hn" href='/user/logout'>로그아웃</a>
            </div>
        </li>
    </div>
    </c:if>
</nav>
