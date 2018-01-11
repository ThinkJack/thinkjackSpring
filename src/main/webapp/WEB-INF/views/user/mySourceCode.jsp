<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: kwak
  Date: 2018. 1. 5.
  Time: AM 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <title>myInfo</title>
</head>
<jsp:include page="/WEB-INF/views/include/myinfoTab.jsp" flush="false"/>


<div role="tabpanel" class="tab-pane fade active in" id="Source_code" aria-labelledby="home-tab">
<div class="row search_div">
    <div class="col-2">
        <select name="searchType">
            <option value="n"
                    <c:out value="${cri.searchType == null?'selected':''}"/> >
                ---
            </option>
            <option value="t"
                    <c:out value="${cri.searchType eq 't'?'selected':''}"/> >
                Title
            </option>
        </select>
    </div>
    <div class="col-10">
        <input type="text" name="keyword" id="keywordInput" value="${cri.keyword}"/>
        <button id='search-btn'>Search</button>
    </div>
</div>
<c:forEach var="srcVo" items="${list}" varStatus="status">
    <c:if test="${status.count % 3 eq 1}">
        <div class="row flex-container">
    </c:if>
    <div class="col flex-item">
        <div class="thumbnail">
                <%--<img class="card-img-top" src="" alt="Card image cap">--%>
            <div class="iframe_wrap" onclick="location.href='/edit/editPage/${srcVo.srcId}';">
                <iframe class="card-img-top" frameborder="0" scrolling="no" id="${srcVo.srcId}">
                </iframe>
            </div>

            <div class="caption">
                <h5 class="card-title" id="src-title1" data>${srcVo.srcTitle}</h5>
                <p class="card-text" id="src-comments1">${srcVo.srcComments}</p>
            </div>
            <div class="caption">


                <img class="src_icon" src="" style="width:20px; height:20px;" id="${srcVo.srcId}img"
                     onclick="location.href='/edit/editPage/${srcVo.srcId}';">
                <a href="/edit/editPage/${srcVo.srcId}" class="card-link" id="src-writer2">${srcVo.srcWriterName}</a>

                <img class="fl-right src_icon" src="/resources/images/like24-1.png" id="${srcVo.srcId}like"
                     style="width:20px; height:20px;">
                <a href="/edit/editPage/${srcVo.srcId}" class="card-link fl-right"
                   id="${srcVo.srcId}likecnt">${srcVo.srcLikecnt}</a>

                <img class="fl-right src_icon" src="/resources/images/reply24.png"
                     onclick="location.href='/edit/editPage/${srcVo.srcId}?reply=show';"
                     style="width:20px; height:20px;">
                <a href="/edit/editPage/${srcVo.srcId}?reply=show" class="card-link fl-right" id="src-replycnt2">10</a>

                <img class="fl-right src_icon" src="/resources/images/view24.png"
                     onclick="location.href='/edit/editPage/${srcVo.srcId}';" style="width:20px; height:20px;">
                <a href="/edit/editPage/${srcVo.srcId}" class="card-link fl-right"
                   id="src-viewcnt2">${srcVo.srcViewcnt}</a>


                <script>
                    <%--작성자 이미지 경로 작업--%>
                    <c:if test="${srcVo.srcWriterImgPath ne null}">
                    $("#${srcVo.srcId}img").attr("src", filePathChange("${srcVo.srcWriterImgPath}", true));
                    </c:if>
                    //                        좋아요 이미지 작업
                    <c:if test="${srcVo.srclikeCli eq 1}">
                    $("#${srcVo.srcId}like").attr("src", "/resources/images/like24-2.png");
                    </c:if>

                    $(function () {
                        $("#${srcVo.srcId}like").click(function (e) {
                            <c:if test="${(login ne null) and (srcVo.srcWriter ne login.userId)}">
                            $.ajax({
                                type: "post",
                                url: "/edit/like",
                                headers: {
                                    "Content-Type": "application/json",
                                    "X-HTTP-Method-Override": "POST"
                                },
                                dataType: 'json',
                                data: JSON.stringify({
                                    srcId: "${srcVo.srcId}"
                                }),
                                success: function (success) {
                                    if (success.result === 0) {
                                        //좋아요 추가시
                                        likeImgChange("#${srcVo.srcId}like", 2);
                                    } else {
                                        //좋아요 취소시
                                        likeImgChange("#${srcVo.srcId}like", 1);
                                    }

                                    document.getElementById("${srcVo.srcId}likecnt").innerHTML = success.srcLikeCnt;
                                }
                            });
                            </c:if>
                        });
                    });
                </script>
            </div>
        </div>
    </div>
    <c:if test="${status.count % 3 eq 0}">
        </div>
    </c:if>
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script>
        $(function () {
            //이미지 맵핑
            //미리보기 화면 코드 넣어주기
            var previewFrame = document.getElementById('${srcVo.srcId}');
            previewFrame.style = "overflow: hidden;";
            var preview = previewFrame.contentDocument || previewFrame.contentWindow.document;
            var tempHtml = escapeHtml('<c:out value="${srcVo.srcHtml}" default=""/>');
            var tempCss = escapeHtml('<c:out value="${srcVo.srcCss}" default=""/>');
            var tempJs = escapeHtml('<c:out value="${srcVo.srcJavaScript}" default=""/>');
            var tempCdnCss = "";
            var tempCdnJs = "";

            <c:if test="${srcVo.cdnCss ne null}">
            <c:forEach items="${srcVo.cdnCss}" var="item">
            tempCdnCss += "<link rel='stylesheet' href='" + "${item}" + "'\/>";
            </c:forEach>
            </c:if>

            <c:if test="${srcVo.cdnJs ne null}">
            <c:forEach items="${srcVo.cdnJs}" var="item">
            tempCdnJs += "<script src='" + "${item}" + "'><\/script>";
            </c:forEach>
            </c:if>

            preview.write(
                tempCdnCss
                +
                "<style>" + tempCss + "<\/style>"
                +
                tempHtml
                +
                tempCdnJs
                +
                "<script>" + tempJs + "<\/script>"
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
<c:if test="${status.count % 3 eq 0}">
    </div>
</c:if>
<div class="text-center">
    <ul class="pagination justify-content-center">
        <c:if test="${pageMaker.prev}">
            <li class="page-item">

                <a class="page-link" href="srcList${pageMaker.makeSearch(pageMaker.startPage - 1)}"
                   aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                    <span class="sr-only">Previous</span>
                </a>
            </li>
        </c:if>
        <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
            <li
                    <c:out value="${pageMaker.cri.page == idx?'class=active page-item':'page-item'}"/>>
                <a class="page-link" href="srcList${pageMaker.makeSearch(idx)}">${idx}</a>
            </li>
        </c:forEach>
        <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
            <li class="page-item">
                <a class="page-link" href="srcList${pageMaker.makeSearch(pageMaker.endPage + 1)}" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                    <span class="sr-only">Next</span>
                </a>
            </li>
        </c:if>
    </ul>
</div>

<script>
    $(document).ready(function () {
        $('#search-btn').click(function (e) {

            self.location = "srcList"
                + '${pageMaker.makeQuery(1)}'
                + '&searchType='
                + $('select option:selected').val()
                + '&keyword=' + encodeURIComponent($('#keywordInput').val());
        });
    });
    $(document).ready(function () {
        $(".Source_code").addClass(" active");

    })
</script>

