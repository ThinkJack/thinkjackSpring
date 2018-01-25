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

<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">

    <a class="navbar-brand" href="/">  <img class="rounded-circle" style=" height:50px;" src="/resources/images/idea.png" ></a>
    <div>
        <div class="page_title_view" id="page-title-view">
            <a class="page_title text-dark" >
                <span id="src-title"></span>
            </a>
            <c:if test="${((login ne null)) and (SrcVO.srcWriter eq login.userId) or
                        ((login ne null) and (SrcVO.srcId eq null)) or
                        ((login eq null) and (SrcVO.srcId ne null) and !(empty cookie.get(SrcVO.srcId))) or
                        ((login eq null) and (SrcVO.srcId eq null))}">
                <i class="fa fa-paint-brush pencil" id="pencil" style="color: black"></i>
            </c:if>
        </div>
        <div class="page_title_text"  id="page-title-text">
            <input type="text" name="page-title" id="src-title-input" value="" maxlength="50"/>
        </div>
        <div class="row"><span class="bd" style="color: #9c9c9c;">A masterpiece by &nbsp;</span><span id="src-writer" style="color:#000000;"></span></div>
    </div>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto page_info">
            <li class="nav-item active">
                <!--href="" 는 현재 패이지 reload해줌 -->

            </li>
            <li class="nav-item">
            </li>
        </ul>
        <ul class="nav navbar-nav navbar-right ">
            <%--코드 실행 버튼--%>
            <li class="nav-item active run" id="run">
                <div>
                    <a class="btn btn-primary" href="javascript:;">
                        <i class="fa fa-refresh" style="color: gray; font-size: 20px;"></i> Run
                    </a>
                </div>
            </li>
            <c:if test="${((login ne null)) and (SrcVO.srcWriter eq login.userId) or
                        ((login ne null) and (SrcVO.srcId eq null)) or
                        ((login eq null) and (SrcVO.srcId ne null) and !(empty cookie.get(SrcVO.srcId))) or
                        ((login eq null) and (SrcVO.srcId eq null))}">
                <li class="nav-item active">
                    <div>
                        <a class="btn  btn-primary" href="javascript:;" id="saveCode">
                            <i class="fa fa-cloud" style="color: gray; font-size: 20px;" id="save-img"></i> Save
                            <%--<img src="/resources/images/cloud1.png" > --%>
                        </a>
                    </div>
                </li>
            </c:if>
            <c:if test="${(login.userId ne SrcVO.srcWriter) and (login ne null)}">
                <li class="nav-item active">
                    <div>
                        <!-- 좋아요 버튼 -->
                        <a class="btn  btn-primary" href="javascript:;" id="like">
                            <i class="fa fa-heart" style="color: gray; font-size: 20px;" id="likebt"></i> Like
                            <%--<img src="/resources/images/like1.png" > --%>
                        </a>
                    </div>
                </li>
            </c:if>
            <li class="nav-item active">
                <div>
                    <a class="btn btn-primary" href="javascript:;" data-toggle="modal" data-target="#setting">
                        <i class="fa fa-cog" style="color: gray; font-size: 20px;"></i>Setting
                        <%--<img src="/resources/images/setting.png"> --%>
                    </a>
                </div>
            </li>

            <c:if test="${login eq null}">
                <li class="nav-item active login">
                    <a class="btn  btn-primary" href="javascript:;" id="login">
                        Login
                    </a>
                </li>
                <li class="nav-item active sign_in">
                    <a class="btn  btn-primary" href="/user/register">
                        Sign in
                    </a>
                </li>


            </c:if>
            <c:if test="${login ne null}">
                <%--<li class="nav-item active sign_in">--%>
                <%--<a class="btn  btn-primary" href="/user/logout">--%>
                <%--Logout--%>
                <%--</a>--%>
                <%--</li>--%>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle  pt-0" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                        <img  class="rounded-circle Photo " id="profileHeader" src="" style="width:38px; height:38px;"></a>

                    <div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; transform: translate3d(-100px, 65px, 0px); top: 0px; left: 0px; will-change: transform;">
                        <a class="dropdown-item hn">${login.userName}</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item hn" href="/user/myinfo">회원정보 수정</a>
                        <a class="dropdown-item hn" href='/user/logout'>로그아웃</a>
                    </div>
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