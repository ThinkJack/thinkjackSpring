<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
    <title>mySourceCode</title>
</head>
<jsp:include page="/WEB-INF/views/include/myinfoTab.jsp" flush="false"/>

<style>
    .card {
        margin-bottom: 20px;
    }

    .fl-right {
        float: right;
        margin-right: 5px;
    }

    .search_div {
        margin-bottom: 20px;
    }

    .iframe_wrap {
        height: 25%;
        padding: 10px;
        border-bottom: 25px solid #333;
    }

    .iframe_wrap iframe {
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

        pointer-events: none;
    }

    .src_icon:hover {
        cursor: pointer;
    }

    .iframe_wrap:hover {
        opacity: 0.5;
        cursor: pointer;
    }

    .ellipsis{
        /*text-align: center;*/
        overflow:hidden;
        white-space:nowrap;
        text-overflow:ellipsis;
    }

</style>
<script>
    //필요한 댓글 개수 부분
    var getPage = function (srcId) {
        // alert(srcId);
        $.getJSON("/srcReply/" + srcId + "/" + 1, function (data) {

            var srcReplyCnt = data.pageMaker.totalCount;

            // document.getElementById("srcReply" + srcId).innerText = srcReplyCnt;
            $('#src-replycnt' + srcId).html(srcReplyCnt);

        });
    };

    //필요한 변수 정의 부분
    var imgPath = "/resources/images/";

    //필요한 함수 정의 부분
    function likeImgChange(elId, num) {
        $(elId).attr("src", imgPath + "like" + num + ".png");
    }
</script>

<div id="Source_code" class="tabcontent card   mb-3">

    <div class="container-fluid removePadding text-center">
        <div class="row">
            <div class="col-sm-1 removePadding"></div>
            <div class="col-sm-10 removePadding">

                <div class="deaf2 ">
                    <img class=" widthFull float-right" src="/resources/images/main/mainA.png"
                         style="  background-size:contain;width:auto">
                </div>
                <div class="form-group ">
                    <div class="input-group bd">
                        <div class="input-group-prepend" style="width: 100%;">
                            <%--<div class="form-group ">--%>
                            <label class="mr-1 mt-2" for="sel1">Select list:</label>
                            <select class="custom-select  col-2" name="searchType" id="sel1">
                                <option value="n"
                                        <c:out value="${cri.searchType == null?'selected':''}"/> >
                                    ---
                                </option>
                                <option value="t"
                                        <c:out value="${cri.searchType eq 't'?'selected':''}"/> >
                                    Title
                                </option>
                            </select>
                            <input type="text" class="form-control bd col-10" placeholder="Search" name="keyword"
                                   id="keywordInput"
                                   value="${cri.keyword}" aria-label="Amount (to the nearest dollar)">
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-primary bd " id="search-btn">Search</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class=" search_div bd">
                    <c:forEach var="srcVo" items="${list}" varStatus="status">
                        <c:if test="${status.count % 3 eq 1}">
                            <div class="row">
                        </c:if>
                        <div class="col">
                            <div class="card hn">
                                    <%--<img class="card-img-top" src="" alt="Card image cap">--%>
                                <div class="iframe_wrap" onclick="location.href='/edit/editPage/${srcVo.srcId}';">
                                    <iframe class="card-img-top" frameborder="0" scrolling="no" id="${srcVo.srcId}">
                                    </iframe>
                                </div>

                                <div class="card-body" style=" width:100%; height:45px; ">
                                        <%--제목 길면 스크롤 생기고 옆으로 늘어나게--%>
                                    <h5 class="hn mb-0 ellipsis"   id="src-title1" data>${srcVo.srcTitle}</h5>
                                    <p class="card-text hn ellipsis" id="src-comments1">${srcVo.srcComments}</p>
                                </div>
                                <div class="card-body mb-0  pb-0" style="padding-left:10px; padding-right:7px; height: 70px;" >
                                    <div class="row removePadding ">
                                        <div class="col-4">
                                            <img class=" src_icon removePadding rounded-circle" src="/resources/images/123.gif" style="width:44.5px; height:44.5px;" id="${srcVo.srcId}img"
                                                 onclick="location.href='/edit/editPage/${srcVo.srcId}';">
                                        </div>
                                        <a href="/edit/editPage/${srcVo.srcId}" class=" ml-3 card-link removePadding ellipsis" id="src-writer2">${srcVo.srcWriterName}</a>
                                    </div>
                                </div>
                                <div class="card-body">

                                        <%--<img class="src_icon" src="" style="width:20px; height:20px;" id="${srcVo.srcId}img"--%>
                                        <%--onclick="location.href='/edit/editPage/${srcVo.srcId}';">--%>
                                        <%--<a href="/edit/editPage/${srcVo.srcId}" class="card-link"--%>
                                        <%--id="src-writer2">${srcVo.srcWriterName}</a>--%>

                                    <img class="fl-right src_icon" src="/resources/images/like24-1.png"
                                         id="${srcVo.srcId}like"
                                         style="width:20px; height:20px;">
                                    <a href="/edit/editPage/${srcVo.srcId}" class="card-link fl-right"
                                       id="${srcVo.srcId}likecnt">${srcVo.srcLikecnt}</a>

                                    <img class="fl-right src_icon" src="/resources/images/reply24.png"
                                         onclick="location.href='/edit/editPage/${srcVo.srcId}?reply=show';"
                                         style="width:20px; height:20px;">
                                    <a href="/edit/editPage/${srcVo.srcId}?reply=show" class="card-link fl-right"
                                       id="src-replycnt${srcVo.srcId}">
                                        <script> getPage("${srcVo.srcId}");</script>
                                    </a>

                                    <img class="fl-right src_icon" src="/resources/images/view24.png"
                                         onclick="location.href='/edit/editPage/${srcVo.srcId}';"
                                         style="width:20px; height:20px;">
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
                <%--</div>--%>
            </div>
        </div>
    </div>
    <div class="text-center">
        <ul class="pagination justify-content-center">
            <c:if test="${pageMaker.prev}">
                <li class="page-item">
                    <a class="page-link" href="mySourceCode${pageMaker.makeUserSearch(pageMaker.startPage - 1)}"
                       aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">Previous</span>
                    </a>
                </li>
            </c:if>
            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                <%--<script>alert("${pageMaker.makeSearch(idx)}"); console.log("??");</script>--%>
                <li
                        <c:out value="${pageMaker.cri.page == idx?'class=active page-item':'page-item'}"/>>
                    <a class="page-link" href="mySourceCode${pageMaker.makeUserSearch(idx)}">${idx}</a>
                </li>
            </c:forEach>
            <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                <li class="page-item">
                    <a class="page-link" href="mySourceCode${pageMaker.makeUserSearch(pageMaker.endPage + 1)}"
                       aria-label="Next">
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

                self.location = "mySourceCode"
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

    <div class="deaf2"></div>

</div>
</div>
</div>
</div>

<jsp:include page="/WEB-INF/views/include/footer.jsp"/>