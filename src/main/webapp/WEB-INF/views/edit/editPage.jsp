<%--
  Created by IntelliJ IDEA.
  User: Uri
  Date: 2017-12-14
  Time: 오후 1:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--<%--%>
<%--response.setHeader("Cache-Control","no-cache");--%>
<%--response.setHeader("Pragma","no-cache");--%>
<%--response.setDateHeader("Expires",0);--%>
<%--%>--%>

<html>
<head>
    <title>EditPage</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <%--<meta http-equiv="Cache-Control" content="no-cache"/>--%>
    <%--<meta http-equiv="Expires" content="0"/>--%>
    <%--<meta http-equiv="Pragma" content="no-cache"/>--%>

    <jsp:include page="../include/editInclude/editCss.jsp" flush="false"/>
</head>
<body>
    <%--header--%>
    <jsp:include page="../include/editInclude/editHeader.jsp" flush="false"/>

    <!-- main 코드 작성 페이지 -->
    <main role="main" class="main" id="code-main">

        <div class="row container-fluid main_ch">
            <div class="row boarderLine"></div>
            <div class="row layout" id="layout1">
                <div class="build col code_layout" id="htmlBuild">
                    <div class="col"><p class="h4 text-white code-name">HTML</p></div>
                    <div class="col" id="codeHtml"></div>
                </div>
                <div class="col resize_code layout-ch" id="resize-code-1" ></div>
                <div class="build col code_layout" id="cssBuild">
                    <div class="col"><p class="h4 text-white code-name">CSS</p></div>
                    <div class="col" id="codeCss"></div>
                </div>
                <div class="col resize_code layout-ch" id="resize-code-2"></div>
                <div class="build col code_layout" id="jsBuild">
                    <div class="col"><p class="h4 text-white code-name">JS</p></div>
                    <div class="col" id="codeJavaScript"></div>
                </div>
            </div>
            <div class="row resize_view" id="resize-view"></div>
            <%--결과창--%>
            <div class="row main_view layout" id="layout2">
                <div class="row iframe_body iframeWrapper" id="iframe-body" >
                    <iframe class="col" id="resultView" scrolling="yes"></iframe>
                </div>
                <div class="row console_body" overflow-y:auto>
                    <div class="row resize-console"></div>
                    <%--console--%>
                    <div class="row edit-console" id="edit-console">
                        <div class="build col">
                            <div class="col"><p class="h4 text-white code-name">Console</p></div>
                            <div class="col edit-console-view" id="edit-console-view"></div>
                        </div>
                    </div>
                    <div class="row command-line" id="command-line-view">
                        <span class="arrow">></span>
                        <input type="text" name="command-line" id="command-line" value="" />
                    </div>
                </div>
            </div>
        </div>
    </main>


    <!--modal 창-->
    <jsp:include page="../include/editInclude/editModalSetting.jsp" flush="false"/>
    <jsp:include page="../include/editInclude/editModalChangeView.jsp" flush="false"/>
    <jsp:include page="../include/editInclude/editModalReply.jsp" flush="false"/>
    <!--footer-->
    <jsp:include page="../include/editInclude/editFooter.jsp" flush="false"/>


    <%--script단--%>
    <jsp:include page="../include/editInclude/editJS.jsp" flush="false"/>

    <script>

        srcId = '<c:out value="${SrcVO.srcId}" default=""/>';
        srcWriter = '<c:out value="${SrcVO.srcWriter}" default="0"/>';
        srcWriterName = '<c:out value="${SrcVO.srcWriterName}" default="CAPTAIN ANONYMOUS"/>';
        srcComments = '<c:out value="${SrcVO.srcComments}" default=""/>';
        srcTitle = '<c:out value="${SrcVO.srcTitle}" default="Untitled"/>';
        srcRegdate = '<c:out value="${SrcVO.srcRegdate}" default=""/>';
        srcUpdate = '<c:out value="${SrcVO.srcUpdate}" default=""/>';
        likeCnt = '<c:out value="${SrcVO.srcLikecnt}" default="0"/>';
        viewCnt = '<c:out value="${SrcVO.srcViewcnt}" default="0"/>';
        srcStatus = '<c:out value="${SrcVO.srcStatus}" default="1"/>';
        strHtml = escapeHtml('<c:out value="${SrcVO.srcHtml}" default=""/>');
        strCss = escapeHtml('<c:out value="${SrcVO.srcCss}" default=""/>');
        strJs = escapeHtml('<c:out value="${SrcVO.srcJavaScript}" default=""/>');
        Heart = "<c:out value="${like}" default="0"/>";
        <%--strHtml = '<c:out value="${SrcVO.srcHtml}" default=""/>';--%>
        <%--strCss = '<c:out value="${SrcVO.srcCss}" default=""/>';--%>
        <%--strJs = '<c:out value="${SrcVO.srcJavaScript}" default=""/>';--%>


        //화면에서 받은 값 세팅
        $(function () {
            document.getElementById("src-title").innerHTML = srcTitle;
            <c:if test="${login.userId eq SrcVO.srcWriter}">
                document.getElementById("src-title-modal").value = srcTitle;
                document.getElementById("modal-comment").value = srcComments;
            </c:if>
            document.getElementById("src-writer").innerHTML = srcWriterName;
            document.getElementById("src-title-reply-modal").innerHTML = "\<h4\>" + srcWriterName + "\</h4\>";
            document.getElementById("comment-view").value = srcComments;
            document.getElementById("view-count").innerHTML = viewCnt;
            document.getElementById("like-couont").innerHTML = likeCnt;
            document.getElementById("visibility" + srcStatus).checked = true;


            //코드 세팅
            codeHtml.setValue(strHtml);
            codeCss.setValue(strCss);
            codeJavaScript.setValue(strJs);

            //작성 및 수정날자 세팅
            if (srcRegdate !== "") {
                if (srcUpdate !== srcRegdate) {
                    document.getElementById("regdate").innerHTML = "Create&nbsp&nbsp" + srcRegdate +
                        "/tUpdate&nbsp&nbsp" + srcUpdate;
                } else {
                    document.getElementById("regdate").innerHTML = "Create&nbsp&nbsp" + srcRegdate;
                }
            }

            //좋아요 세팅
            if(document.getElementById("like") !== null) {
                if(Heart === "0") {
                    //없을때
                    likeImgChange(1);
                } else {
                    //있을때
                    likeImgChange(2);
                }
            }
        });

        $("#saveCode").click(function (e) {
            codeSave();
        });


    </script>
</body>
</html>
