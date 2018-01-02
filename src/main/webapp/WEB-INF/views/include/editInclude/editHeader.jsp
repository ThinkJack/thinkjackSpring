<%--
  Created by IntelliJ IDEA.
  User: Uri
  Date: 2017-12-08
  Time: 오후 5:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

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
                        <span id="src-title"></span>
                    </a>
                    <img class="pencil" id="pencil" src="/resources/images/pencil.png">
                </div>
                <div class="page_title_text"  id="page-title-text">
                    <input type="text" name="page-title" id="src-title-input" value=""/>
                </div>
                <div class="row"><span style="color: #9c9c9c;">A masterpiece by &nbsp;</span><span id="src-writer"></span></div>
            </li>
            <li class="nav-item">
            </li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="nav-item active run" id="run">
                <div>
                    <a class="btn btn-outline-dark" href="javascript:;">
                        <img src="/resources/images/reload.png"> Run
                    </a>`
                </div>
            </li>
            <script>
                <%--alert('${(SrcVO.srcId eq '')}' !== '');--%>
            </script>
            <c:if test="${(login.userId eq SrcVO.srcWriter) or
                        (SrcVO.srcId eq '') or
                        ((SrcVO.srcId eq null) and (login ne null)) or
                        ((SrcVO.srcId ne '') and !(empty cookie.get(SrcVO.srcId)))}">
            <li class="nav-item active">
                <div>
                    <a class="btn btn-outline-dark" href="javascript:;" id="saveCode">
                        <img src="/resources/images/cloud1.png" id="save-img"> Save
                    </a>
                </div>
            </li>
            </c:if>
            <c:if test="${(login.userId ne SrcVO.srcWriter) and (login ne null)}">
            <li class="nav-item active">
                <div>
                    <!-- 좋아요 버튼 -->
                    <a class="btn btn-outline-dark" href="javascript:;" id="like">
                        <img src="/resources/images/like1.png" id="likebt"> Like
                    </a>
                </div>
            </li>
            </c:if>
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
            <c:if test="${login eq null}">
                <li class="nav-item active login">
                    <a class="btn btn-outline-dark" href="javascript:;" id="login">
                        Login
                    </a>
                </li>
                <li class="nav-item active sign_in">
                    <a class="btn btn-outline-dark" href="/user/register">
                        Sign in
                    </a>
                </li>
            </c:if>
            <c:if test="${login ne null}">
                <li class="nav-item active sign_in">
                    <a class="btn btn-outline-dark" href="/user/logout">
                        Logout
                    </a>
                </li>
            </c:if>
        </ul>
    </div>
    <br>
    <div>
        <!--autoFormatSelection & commentSelection-->
        <%--<input type="button" onclick="autoFormatSelection()" value="autoFormatSelection">--%>
        <%--<input type="button" onclick="commentSelection(true)" value="commentSelection">--%>
    </div>

</nav>
