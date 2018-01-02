<%--
  Created by IntelliJ IDEA.
  User: Uri
  Date: 2018-01-02
  Time: 오전 8:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .card {
        margin-bottom: 20px;
    }

    .fl-right {
        float: right;
        margin-right: 5px;
    }

    .title {
        border-bottom: 5px solid rgba(0,0,0,.125);
    }

    .title_div {
        margin-bottom: 20px;
    }

    .iframe_wrap {
        height: 25%;
    }

    .iframe_wrap iframe{
        -ms-transform: scale(0.5);
        -moz-transform: scale(0.5);
        -o-transform: scale(0.5);
        -webkit-transform: scale(0.5);
        transform: scale(0.5);

        -ms-transform-origin: 0 0;
        -moz-transform-origin: 0 0;
        -o-transform-origin: 0 0;
        -webkit-transform-origin: 0 0;
        transform-origin: 0 0;

        width: 200%;
        height: 200%;
    }
</style>
<div class="container">
    <div class="row title_div">
        <div class="col">
            <h1 class="title"><b>SrcBoard (좋아요 순!)</b></h1>
        </div>
    </div>
    <c:forEach var="srcVo" items="${list}" varStatus="status" >
        <c:if test="${status.count % 3 eq 1}">
    <div class="row">
        </c:if>
        <div class="col">
            <div class="card">
                <%--<img class="card-img-top" src="" alt="Card image cap">--%>
                <div class="iframe_wrap">
                    <iframe class="card-img-top" frameborder="0" scrolling="no" id="${srcVo.srcId}">
                    </iframe>
                </div>
                <div class="card-body">
                    <h5 class="card-title" id="src-title1" data>${srcVo.srcTitle}</h5>
                    <p class="card-text" id="src-comments1">${srcVo.srcComments}</p>
                </div>
                <div class="card-body">
                    <img src="" style="width:20px; height:20px;">
                    <a href="/edit/editPage/${srcVo.srcId}" class="card-link" id="src-writer2">${srcVo.srcWriterName}</a>
                    <img src="/resources/images/like24-1.png" class="fl-right" style="width:20px; height:20px;">
                    <a href="/edit/editPage/${srcVo.srcId}" class="card-link fl-right" id="src-likecnt2">${srcVo.srcLikecnt}</a>
                    <img src="/resources/images/reply24.png" class="fl-right" style="width:20px; height:20px;">
                    <a href="/edit/editPage/${srcVo.srcId}" class="card-link fl-right" id="src-replycnt2">10</a>
                    <img src="/resources/images/view24.png" class="fl-right" style="width:20px; height:20px;">
                    <a href="/edit/editPage/${srcVo.srcId}" class="card-link fl-right" id="src-viewcnt2">${srcVo.srcViewcnt}</a>
                </div>
            </div>
        </div>
        <c:if test="${status.count % 3 eq 0}">
    </div>
        </c:if>
        <script>
            $(function () {
                var previewFrame = document.getElementById('${srcVo.srcId}');
                previewFrame.style = "overflow: hidden;";
                var preview = previewFrame.contentDocument || previewFrame.contentWindow.document;
                var tempHtml = escapeHtml('<c:out value="${srcVo.srcHtml}" default=""/>');
                var tempCss = escapeHtml('<c:out value="${srcVo.srcCss}" default=""/>');
                var tempJs = escapeHtml('<c:out value="${srcVo.srcJavaScript}" default=""/>');
                preview.open();

                preview.write(
                    "" + tempHtml
                    +
                    "<style>" + tempCss + "<\/style>"
                    +
                    "<script>" + tempJs + "<\/script>"
                    +
                    "<script>" + "<\/script>"
                );
                preview.close();
            });

            function escapeHtml(text) {
                return text
                    .replace(/&lt;/gi, "<")
                    .replace(/&gt;/gi, ">")
                    .replace(/&#33;/gi, "!")
                    .replace(/&#034;/gi, '"')
                    .replace(/&quot;/gi, '"')
                    .replace(/&#035;/gi, '"')
                    .replace(/&#037;/gi, "%")
                    .replace(/&amp;/gi, "&")
                    .replace(/&#038;/gi, "&")
                    .replace(/&#039;/gi, "'");
            }
        </script>
    </c:forEach>
</div>
<!--내용-->

