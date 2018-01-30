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
                        <span id="src-title">Unit Test</span>
                    </a>
                    <i class="fa fa-flask" style="color: black"></i>
                </div>
                <div class="page_title_text"  id="page-title-text">
                    <input type="text" name="page-title" id="src-title-input" value=""/>
                </div>
                <div class="row"><span class="bd" style="color: #9c9c9c;">A masterpiece by &nbsp;</span></div>

    </div>
    <div class="nav mx-auto" style="margin-right: 0px !important">
    <button class="btn btn-primary justify-content-end" href="/user/register">
        Sign in
    </button>
    </div>

</nav>
