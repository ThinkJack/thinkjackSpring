<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/>

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
        border-bottom: 5px solid rgba(0, 0, 0, .125);
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

    body {
        background-color: orange;
    }

    .ellipsis {
        /*text-align: center;*/
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
    }

    /*소스게시판 미디어 쿼리*/

    @media only screen and (min-width: 760px) {
        .col-md-6 {
            -webkit-box-flex: 0;
            -ms-flex: 0 0 50%;
            flex: 0 0 50%;
            max-width: 50%;
        }
    }

    @media only screen and (min-width: 1100px) {
        .col-md-6 {
            -webkit-box-flex: 0;
            -ms-flex: 0 0 33.3333333333%;
            flex: 0 0 33.3333333333%;
            max-width: 33.3333333333%;
        }

        /*.col-lg-2{*/
        /*-webkit-box-flex: 0;*/
        /*-ms-flex: 0 0 0%;*/
        /*flex: 0 0 0%;*/
        /*max-width: 0%;*/
        /*margin: auto;*/
        /*}*/

    }


</style>
<script>
    var getPage = function (srcId) {
        // alert(srcId);
        $.getJSON("/srcReply/" + srcId + "/" + 1, function (data) {

            var srcReplyCnt = data.pageMaker.totalCount;

            // document.getElementById("srcReply" + srcId).innerText = srcReplyCnt;
            $('#srcReply' + srcId).html(srcReplyCnt);

        });
    };
    //필요한 변수 정의 부분

    //필요한 함수 정의 부분
    function likeImgChange(elId, remove, kinds, color) {

        $(elId).addClass(kinds);
        $(elId).removeClass(remove);
        $(elId).css("color", color);
    }
</script>
<div class="deaf2"></div>
<div class="container-fluid removePadding text-center">
    <div class="row justify-contents-around">
        <div class="col-lg-1  removePadding"></div>
        <div class="col-lg-10  removePadding">
            <label class="control-label">
                <h1 class="bd" id="titleList" style="text-align: center;">코드 게시판</h1>
            </label>
            <div class="deaf2 ">
                <img class=" widthFull float-right" src="/resources/images/main/mainA.png"
                     style="  background-size:contain;width:auto">
            </div>
            <div class="form-group ">
                <div class="input-group bd">
                    <div class="col-lg-6 col-md-4 col-xs-2"></div>
                    <div class="input-group-prepend col-lg-6 col-md-8 col-xs-10" style="width: 100%;">
                        <%--<div class="form-group ">--%>
                        <label class="mr-1 mt-2" for="sel1">Select list:</label>
                        <select class="custom-select bd" name="searchType" id="sel1">

                            <option value="n"
                                    <c:out value="${cri.searchType == null?'selected':''}"/> >
                                ---
                            </option>
                            <option value="t"
                                    <c:out value="${cri.searchType eq 't'?'selected':''}"/> >
                                Title
                            </option>
                            <option value="w"
                                    <c:out value="${cri.searchType eq 'w'?'selected':''}"/> >
                                Writer
                            </option>
                            <option value="tw"
                                    <c:out value="${cri.searchType eq 'tw'?'selected':''}"/> >
                                Title OR Writer
                            </option>

                        </select>
                        <%--</div>--%>

                        <input type="text" class="form-control bd" placeholder="Search" name="keyword" id="keywordInput"
                               value="${cri.keyword}" aria-label="Amount (to the nearest dollar)">
                        <div class="input-group-append">
                            <button type="submit" class="btn btn-primary bd " id="search-btn">Search</button>
                        </div>
                        <div class="input-group-append">
                            <button type="button" class="btn btn-primary bd" onclick="location.href='/edit/editPage'">
                                EditPage
                            </button>
                        </div>

                    </div>
                </div>
            </div>
            <div class=" search_div bd">
                <div class="row">
                    <c:forEach var="srcVo" items="${list}" varStatus="status">
                        <%--<c:if test="${status.count % 3 eq 1}">--%>
                        <%--<div class="row">--%>
                        <%--</c:if>--%>
                        <div class="col-lg-3 col-md-6 col-xs-12">
                            <div class="card hn">
                                    <%--<img class="card-img-top" src="" alt="Card image cap">--%>
                                <div class="iframe_wrap" onclick="location.href='/edit/editPage/${srcVo.srcId}';">
                                    <iframe class="card-img-top" frameborder="0" scrolling="no" id="${srcVo.srcId}">
                                    </iframe>
                                </div>

                                    <%--<div class="card-body" style="overflow: auto">--%>
                                <div class="row removePadding align-items-center" style=" width:100%; height:45px; ">
                                        <%--제목 길면 스크롤 생기고 옆으로 늘어나게--%>
                                    <span class="ellipsis col-6 hn" id="src-title1"><c:out
                                            value="${srcVo.srcTitle}"/></span>
                                    <div class="row fl-right ml-auto ">
                                        <c:if test="${srcVo.srclikeCli eq '1'}">
                                            <i class="fa fa-heart" style="color: red; font-size: 20px;"
                                               id="${srcVo.srcId}like"></i>
                                        </c:if>
                                        <c:if test="${srcVo.srclikeCli eq '0'}">
                                            <i class="fa fa-heart-o" style="color: gray; font-size: 20px;"
                                               id="${srcVo.srcId}like"></i>
                                        </c:if>

                                        <a href="/edit/editPage/${srcVo.srcId}" class="card-link fl-right"
                                           id="${srcVo.srcId}likecnt"> ${srcVo.srcLikecnt}</a>

                                        <i class="fa fa-comments" style="color: gray; font-size: 20px;"></i>
                                        <a href="/edit/editPage/${srcVo.srcId}?reply=show" class="card-link fl-right"
                                           id="srcReply${srcVo.srcId}">
                                            <script>getPage("${srcVo.srcId}")</script>
                                        </a>

                                        <i class="fa fa-eye" style="color: gray; font-size: 20px;"></i>
                                        <a href="/edit/editPage/${srcVo.srcId}" class="card-link fl-right"
                                           id="src-viewcnt2"> ${srcVo.srcViewcnt}</a>
                                    </div>
                                    <p class="card-text hn ellipsis" id="src-comments1">${srcVo.srcComments}</p>
                                </div>
                                    <%--<div class="card-body mb-0  pb-0 removePadding" style="padding-left:10px; padding-right:7px; height: 70px;" >--%>
                                <div class="row removePadding align-items-center ">
                                    <div class="col-3 removePadding p-3">
                                        <img class=" src_icon removePadding rounded-circle"
                                             src="/resources/images/123.gif" style="width:44.5px; height:44.5px;"
                                             id="${srcVo.srcId}img"
                                             onclick="location.href='/edit/editPage/${srcVo.srcId}';">
                                    </div>
                                    <a href="/edit/editPage/${srcVo.srcId}" class="card-link removePadding ellipsis"
                                       id="src-writer2">${srcVo.srcWriterName}</a>

                                </div>
                                <script>


                                    <%--작성자 이미지 경로 작업--%>
                                    <c:if test="${srcVo.srcWriterImgPath ne null}">
                                    $("#${srcVo.srcId}img").attr("src", filePathChange("${srcVo.srcWriterImgPath}", true));
                                    </c:if>
                                    //                        좋아요 이미지 작업
                                    <%--<c:if test="${srcVo.srclikeCli eq 1}">--%>
                                    <%--$("#${srcVo.srcId}like").attr("src", "/resources/images/like24-2.png");--%>
                                    <%--</c:if>--%>

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
                                                        likeImgChange("#${srcVo.srcId}like", "fa-heart-o", "fa-heart", "red");
                                                    } else {
                                                        //좋아요 취소시
                                                        likeImgChange("#${srcVo.srcId}like", "fa-heart", "fa fa-heart-o", "gray");
                                                    }

                                                    document.getElementById("${srcVo.srcId}likecnt").innerHTML = success.srcLikeCnt;
                                                }
                                            });
                                            </c:if>
                                        });
                                    });
                                </script>
                                    <%--</div>--%>
                            </div>
                        </div>
                        <%--<c:if test="${status.count % 3 eq 0}">--%>
                        <%--</div>--%>
                        <%--</c:if>--%>
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
                                    "<script>"
                                    +
                                    "try{"
                                    +
                                    tempJs
                                    +
                                    "}catch(err){}"
                                    +
                                    "<\/script>"
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
                <%--<c:if test="${status.count % 3 eq 0}">--%>
                <%--</div>--%>
                <%--</c:if>--%>
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

                    $("#keywordInput").keydown(function (e) {
                        if (e.keyCode === 13) {
                            $("#search-btn").click();
                        }
                    });
                });
            </script>
        </div>

    </div>
    <div class="col-lg-1  removePadding"></div>
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

    <div class="deaf2"></div>
    <!--내용-->


    <jsp:include page="/WEB-INF/views/include/footer.jsp" flush="false"/>
