<%--
  Created by IntelliJ IDEA.
  User: Uri
  Date: 2017-12-14
  Time: 오후 1:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>EditPage</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

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
                <div class="col"><p class="h4 text-white code-name bd">HTML</p></div>
                <div class="col" id="codeHtml"></div>
            </div>
            <div class="col resize_code layout-ch" id="resize-code-1" ></div>
            <div class="build col code_layout" id="cssBuild">
                <div class="col"><p class="h4 text-white code-name bd">CSS</p></div>
                <div class="col" id="codeCss"></div>
            </div>
            <div class="col resize_code layout-ch" id="resize-code-2"></div>
            <div class="build col code_layout" id="jsBuild">
                <div class="col"><p class="h4 text-white code-name bd" >JS</p></div>
                <div class="col" id="codeJavaScript"></div>
            </div>
        </div>
        <div class="row resize_view" id="resize-view"></div>
        <%--결과창--%>
        <div class="row main_view layout" id="layout2">
            <div class="row iframe_body iframeWrapper" id="iframe-body">
                <iframe class="col" id="resultView" scrolling="yes"></iframe>
            </div>
            <div class="row console_body">
                <div class="row resize-console"></div>
                <%--console--%>
                <div class="row edit-console" id="edit-console">
                    <div class="build col">
                        <div class="col">
                            <p class="h4 text-white code-name">Console</p>
                            <a class="btn btn-outline-secondary btn-sm console-clear" href="javascript:;" id="console-clear">
                                clear
                            </a>
                        </div>
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
<jsp:include page="../include/editInclude/editKeyMapModal.jsp" flush="false"/>
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
    userId = "<c:out value="${login.userId}" default=""/>";

    <c:if test="${SrcVO.cdnCss ne null}">
    <c:forEach items="${SrcVO.cdnCss}" var="item">
    cdnCss.push("${item}");
    </c:forEach>
    </c:if>

    <c:if test="${SrcVO.cdnJs ne null}">
    <c:forEach items="${SrcVO.cdnJs}" var="item">
    cdnJs.push("${item}");
    </c:forEach>
    </c:if>


    //화면에서 받은 값 세팅
    $(function () {
        document.getElementById("src-title").innerHTML = srcTitle;
        <c:if test="${((login ne null)) and (SrcVO.srcWriter eq login.userId) or
                    ((login ne null) and (SrcVO.srcId eq null)) or
                    ((login eq null) and (SrcVO.srcId ne null) and !(empty cookie.get(SrcVO.srcId))) or
                    ((login eq null) and (SrcVO.srcId eq null))}">
        document.getElementById("src-title-modal").value = srcTitle;
        document.getElementById("modal-comment").value = srcComments;
        </c:if>
        document.getElementById("src-writer").innerHTML = srcWriterName;
        document.getElementById("src-title-reply-modal").innerHTML = "\<h4\>" + srcWriterName + "\</h4\>";
        document.getElementById("comment-view").value = srcComments;
        document.getElementById("view-count").innerHTML = viewCnt;
        document.getElementById("like-couont").innerHTML = likeCnt;
        if(document.getElementById("visibility" + srcStatus) !== null){
            document.getElementById("visibility" + srcStatus).checked = true;
        }

        window.console = console;

        //작성 및 수정날자 세팅
        if (srcRegdate !== "") {
            if (srcUpdate !== srcRegdate) {
                document.getElementById("regdate").innerHTML = "Create&nbsp&nbsp" + srcRegdate +
                    "&nbsp&nbspUpdate&nbsp&nbsp" + srcUpdate;
            } else {
                document.getElementById("regdate").innerHTML = "Create&nbsp&nbsp" + srcRegdate;
            }
        }

        //좋아요 세팅
        if(document.getElementById("like") !== null) {
            if(Heart === "0") {
                //없을때
                likeImgChange("fa-heart", "fa-heart-o", "gray");
            } else {
                //있을때
                likeImgChange("fa-heart-o", "fa-heart", "red");
            }
        }

        <c:if test="${login.userProfile ne null}">
        $("#reply-user-img").attr("src", filePathChange("${login.userProfile}"));
        </c:if>

        <c:if test="${SrcVO.srcWriterImgPath ne null}">
        $("#user-img").attr("src", filePathChange("${SrcVO.srcWriterImgPath}"));
        </c:if>

        <c:if test="${login ne null}">
            $("#profileHeader").attr("src",filePathChange("${login.userProfile}"));
        </c:if>

        <c:if test="${param.reply eq 'show'}">
        if($("#reply-modal") !== null){
            $("#reply-modal-bt").trigger('click');
        }
        </c:if>

        cdnCssJsViewSet(cdnCss, "css");
        cdnCssJsViewSet(cdnJs, "js");
        cdnCssJsValSet();

        //코드 세팅
        codeHtml.setValue(strHtml);
        codeCss.setValue(strCss);
        codeJavaScript.setValue(strJs);
        changeSaveImg(1);
    });
</script>
</body>
</html>
