<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/>
<link href="/resources/dist/css/board.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<%--하트 스타일부분--%>
<style>
    #panel, #flip {
        padding: 5px;
        text-align: center;
        background-color: #e5eecc;
        border: solid 1px #c3c3c3;
    }

    .boardheader {
        display: inline-block;
    }

    #panel {
        padding: 50px;
        display: none;
    }

    #heart {
        width: 25px;
        height: 25px;
    }

    .reHeart {

        width: 25px;
        height: 25px;
    }

    .replyheart {
        width: 25px;
        height: 25px;
    }

    .card-header.text-white {
        /*background-color: black;*/
    }
    textarea{
        width: 100%;
    }


</style>

<div class="row  removePadding " style="padding-top: 100px;">
    <div class="col-md-3"></div>
    <div class="col-md-6 cardtext-white list-group ">
        <form role="form" method="post">
            <input type="hidden" name='category' value="${category}">
            <input type='hidden' name='page' value="${cri.page}">
            <input type='hidden' name='perPageNum' value="${cri.perPageNum}">
            <input type='hidden' name='searchType' value="${cri.searchType}">
            <input type='hidden' name='keyword' value="${cri.keyword}">
        </form>
        <div class="box-body m-3">
            <div style="float:right;">

                <label class=" text-white bd"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.boardRegdate}"/> </label>
                <a class="btn heart">
                    <img id="heart" src="">
                </a>
            </div>

            <div class="form-group text-white bd" style="margin-top: 10px;">
                <label  style="font-size:1.35rem;" >Title</label>
                <input type="text" name='title' class="form-control inputC hn" value="${boardVO.boardTitle}"
                       readonly="readonly" />
            </div>
            <div class="form-group text-white bd">
                <label  style="font-size:1.35rem;">Content</label>
                <textarea type="text" name='content' class="form-control inputC hn" rows="15"
                          readonly="readonly" style="padding-top: 20px;">${boardVO.boardContent}</textarea>
            </div>
            <div class="form-group text-white bd">
                <label  style="font-size:1.35rem;" >Writer</label>
                <div class="form-control" style="background: white">
                    <img id='writerProfile' class="rounded photo2">
                    <label style="color: black;">${boardVO.boardWriter}</label>
                </div>
                <script>
                    $("#writerProfile").prop("src", getFileInfo("${boardVO.boardWriterProfile}"))
                </script>

            </div>
        </div>
        <div class="box-footer m-3 ">
            <c:if test="${login.userName == boardVO.boardWriter}">
                <button type="submit" class="btn btn-warning modifyBtn hn">수정</button>
                <button type="submit" class="btn btn-danger removeBtn hn">삭제</button>
            </c:if>
            <button type="submit" class="btn btn-primary goListBtn pull-right bd">GO LIST</button>
        </div>
    </div>
    <div class="col-md-3"></div>
</div>
<div class="row removePadding ">
    <div class="col-md-3"></div>
    <div class="col-md-6 removePadding ">
        <%--댓글 등록 부분 --%>
        <div class="card border-primary ">
            <h2 class="bd m-2"> Comment</h2>

            <div class="row m-3">
                <div class="col-md-10" >
                    <%--댓글 등록하는 아이디(--%>
                    <input type="text" name='writer' class="form-control register hn" value="${login.userName}"
                           readonly="readonly">
                    <%--댓글 입력 부분--%>
                    <div class="form-group ">
                        <textarea class="form-control replyTextReply hn" rows="3" placeholder="댓글 입력하세요"></textarea>
                    </div>
                </div>
                <div class="col-md-2  removePadding ">
                    <%--1.등록 버튼을 누르면 새로운 댓글 추가된다--%>
                    <button type="button" class="btn btn-primary addBtn  hn" style="width:100%;height:160px;">등록</button>
                </div>
            </div>
        </div>


        <div class="row m-3">
            <%--입력된 댓글 목록 나타나는 부분--%>

            <%--<ul class="replies"></ul>--%>
            <ul class="timeline col-md-12">

                <%--버튼을 클릭하면 댓글목록이 나온다--%>
                <li class="time-label repliesDiv">

                    <%--<button type="button" class=""> Replies List </button>--%>
                </li>
                <%--페이지네이션 부분--%>
                <div class='text-center mb-5'>
                    <ul id="pagination" class="pagination pagination-sm justify-content-center"></ul>
                </div>
            </ul>
        </div>

    </div>
    <div class="col-md-2 widthFull4"></div>
</div>
<%--댓글 반복문 부분--%>
<script>
    $(document).ready(function () {

        Handlebars.registerHelper('ifCond', function (v1, v2, options) {
            if (v1 === v2) {
                return options.fn(this);
            }
            return options.inverse(this);
        });

    });
</script>
<script class="template" type="text/x-handlebars-template">

    {{#each .}}
    <li class="replyLi" data-replyId={{replyId}}>

        <div class="timeline-item card border-light mb-3">
            <%--댓글이 삭제되었는지 확인--%>
            {{#if replyVO.replyState}}
            <%-- 조건문으로 parent값 있는것을 구분한다--%>
            <%--하트 버튼(좋아요)--%>
            {{#if replyVO.replyParent}}
            <%--<div class="registerReply"  >--%>
            <div class="row removePadding registerReply card-header text-white" style="background-color:gray">

                <div class="col-md-1" style="background-color: white;">
                    <i class="fa fa-reply fa-rotate-180" aria-hidden="true" style="color: grey"></i>
                </div>
                <div class="col-md-2 mt-3 mb-3">
                    <%--사진--%>
                    <input type="hidden" class="replyHeart" value="{{reHeart}}">
                    <img src="{{profileImg replyVO.replyProfile}}" class="photo2 rounded">
                </div>

                <div class="col-md-9 mt-3 mb-3">
                    <strong class="title ">

                        <%--replyId 불러오기 위해 필요한 부분--%>
                        <span class="replyId" style="display: none">{{replyVO.replyId}}</span>
                        <input type="hidden" class="reParent" value="{{replyParent}}">
                        <%--replyId와 replyWriter 나타나는 부분--%>
                        <span class="replyWriter register hn" style="font-size:1.35rem;">{{replyVO.replyWriter}}</span>

                        <%--<span class="replyWriter">{{replyVO.replyWriter}}</span>--%>
                        <span style="float: right" class="bd">
                            {{#if reHeart}}
                            <%--reHeart값이 있을떄--%>
                            <a class="replyHeartBtn btn" name=1>
                                <img class="reHeart" src="/resources/images/like2.png">
                            </a>
                            <span> {{replyVO.replyLikeCnt}}</span>
                            {{else}}
                            <a class="replyHeartBtn btn" name=0>
                                <img class="reHeart" src="/resources/images/like1.png">
                            </a>
                            <span>{{replyVO.replyLikeCnt}}</span>
                            {{/if}}
                        </span>
                        <span class="time bd" style="float: right;margin-top: 10px;">{{prettifyDate  replyVO.replyRegdate}}</span>
                    </strong>
                </div>
                <div class="col-md-1" style="background-color: white;">
                </div>
                <div class="col-md-2 mt-3 mb-3"></div>
                <div class="col-md-7 mt-3 mb-3">

                    <div class="comment" style="overflow:auto; width:100%; height:150px;">
                        <%--입력된 댓글 text부분--%>

                        <textarea class="replyText form-control" readonly value="{{replyVO.replyText}}"
                                  style="display: none">{{replyVO.replyText}}</textarea>
                        <spna class="textSpan ">{{replyVO.replyText}}</spna>

                    </div>
                </div>

                <div class="col-md-2">
                    {{#ifCond loginUser replyVO.replyWriter}}

                    <button type="button" class="btn btn-warning replyModBtn hn" style="width: 90%;">수정</button>

                    <button type="button" class="btn btn-danger replyDelBtn hn" style="width: 90%;">삭제</button>

                    {{/ifCond}}
                </div>
            </div>

            {{else}}
            <%--댓글 부분--%>
            <div class="row removePadding registerReply card-header   text-white" style="background-color:#2c2c2c">
                <div class="col-md-2 mt-3 mb-3">
                    <%--사진--%>
                    <input type="hidden" class="replyHeart" value="{{reHeart}}">
                    <img src="{{profileImg replyVO.replyProfile}}" class="photo2 rounded">
                </div>
                <div class="col-md-10 mt-3 mb-3">
                    <strong class="title">
                        <%--replyId 불러오기 위해 필요한 부분--%>
                        <span class="replyId" style="display: none">{{replyVO.replyId}}</span>
                        <%--replyId와 replyWriter 나타나는 부분--%>
                        <span class="replyWriter register hn"  style="font-size:1.35rem;">{{replyVO.replyWriter}}</span>

                        <%--<span class="replyWriter">{{replyVO.replyWriter}}</span>--%>
                        <span style="float: right" class="bd">
                            {{#if reHeart}}
                            <%--reHeart값이 있을떄--%>
                            <a class="replyHeartBtn btn" name=1>
                                <img class="reHeart" src="/resources/images/like2.png">
                            </a>
                            <span> {{replyVO.replyLikeCnt}}</span>
                            {{else}}
                            <a class="replyHeartBtn btn" name=0>
                                <img class="reHeart" src="/resources/images/like1.png">
                            </a>
                            <span>{{replyVO.replyLikeCnt}}</span>
                            {{/if}}
                        </span>
                        <span class="time bd" style="float: right;margin-top: 10px;">{{prettifyDate  replyVO.replyRegdate}}</span>
                    </strong>
                </div>
                <div class="col-md-2 mt-3 mb-3">
                </div>
                <div class="col-md-8 mt-3 mb-3">

                    <div class="comment" style="overflow:auto; width:100%; height:150px;">
                        <%--입력된 댓글 text부분--%>
                        <%--<input class="replyText form-control" readonly value="{{replyVO.replyText}}" style="display: none"></input>--%>
                        <textarea class="replyText form-control" readonly value="{{replyVO.replyText}}"
                                  style="display: none">{{replyVO.replyText}}</textarea>
                        <spna class="textSpan ">{{replyVO.replyText}}</spna>
                    </div>
                </div>


                <div class="col-md-2">
                    {{#ifCond loginUser replyVO.replyWriter}}

                    <button type="button" class="btn btn-warning replyModBtn hn" style="width: 90%;"> 수정</button>

                    <button type="button" class="btn btn-danger replyDelBtn hn" style="width: 90%;">삭제</button>

                    {{/ifCond}}
                    <button type="button" class="btn btn-info demoReply hn" style="width: 90%;">답글</button>
                </div>
                <%--버튼 누르면 나오게 하기--%>
            </div>
            <div class="demo row mt-3 " name="demo" style="display: none">

                <div class="col-md-10 removePadding " style="float: left">
                    <textarea class="form-control replyTextReply hn" rows="3">대댓글 입력하세요</textarea>
                </div>
                <div class="col-md-2 removePadding " style="float:right;">
                    <button type="button" class="btn btn-primary addBtn hn ml-2 mt-1  " style="width:90%; height: 10%;">등록</button>
                </div>
            </div>

        </div>

        {{/if}}

        {{else}}
        <div class="card border-light mb-3 ">
            <div class="card-header hn">
                <span>삭제된 댓글입니다</span>
            </div>
        </div>
        {{/if}}
    </li>
    {{/each}}
</script>

<script>
    $(document).ready(function () {
        //하트
        var heartval = ${heart};
        if (heartval > 0) {
            // console.log(heartval);
            $("#heart").prop("src", "/resources/images/like2.png");
            $(".heart").prop('name', heartval)
        }
        else {
            // console.log(heartval);
            $("#heart").prop("src", "/resources/images/like1.png");
            $(".heart").prop('name', heartval)
        }
        var formObj = $("form[role='form']");
        var boardid = "<input type='hidden' name='boardId' value='${boardVO.boardId}'>";

        $(".modifyBtn").on("click", function () {
            formObj.attr("action", "/board/modify");
            formObj.attr("method", "get");
            formObj.append(boardid);
            formObj.submit();
        });

        $(".removeBtn").on("click", function () {
            formObj.attr("action", "/board/remove");
            formObj.append(boardid);
            formObj.submit();
        });
        $(".goListBtn").on("click", function () {
            formObj.attr("method", "get");
            formObj.attr("action", "/board/list");
            formObj.submit();
        });

        $(".heart").on("click", function () {
            var that = $(".heart");
            var sendData = {'boardId': '${boardVO.boardId}', 'heart': that.prop('name')};
            $.ajax({
                url: '/board/heart',
                type: 'POST',
                data: sendData,
                success: function (data) {
                    that.prop('name', data);
                    if (data == 1) {
                        $('#heart').prop("src", "/resources/images/like2.png");
                    }
                    else {
                        $('#heart').prop("src", "/resources/images/like1.png");
                    }
                }
            });
        });

    });
</script>
<script>
    //대댓글 id는 replyParent에서 받아오고 댓글 id=replyId값에서 받아온다
    $(document).on("click", ".addBtn", function () {

        var replyParent = $(this).parent().parent().parent().find('.replyId').text();
        // console.log("reParent 값?"+replyParent);
        //각각의 id값을 받아온다
        var replyTextObj = $(this).parent().parent().find('.replyTextReply');
        var replyText = replyTextObj.val();
        // console.log("내용확인"+replyText);
        var replyer = $('.register').val();
        // console.log(replyParent + "replyId?");

        $.ajax({
            type: 'post',
            url: '/replies/',
            headers: {
                "Content-Type": "application/json",
                "X-HTTP-Method-Override": "POST"
            },
            dataType: 'text',
            //문자를 객체로 바꿈
            data: JSON.stringify({
                boardId: boardId, replyText: replyText, replyWriter: replyer, replyParent: replyParent
            }),
            success: function (result) {
                if (result == 'SUCCESS') {
                    alert("등록");
                    replyPage = 1;

                    getPage("/replies/" + boardId + "/" + replyPage);

                    replyTextObj.val("댓글을 등록");
                }
            }
        });

    });
</script>

<script>
    $(document).on("click", ".demoReply", function () {
        var demo = $(this).parent().parent().siblings('.demo');
        // console.log(demo.css('display') + 'ddd');

        if (demo.css('display') == 'none') {
            demo.css("display", 'block');
            $(this).html('<span></span> 닫기');
        } else if (demo.css('display') == 'block') {
            demo.css("display", 'none');
            $(this).html('<span></span> 답글');
        }
        ;

    });

</script>
<script>
    <%--수정 삭제--%>
    $(document).on("click", ".replyModBtn", function () {
        var replyId = $(this).parent().parent().parent().find('.replyId').text();
        // console.log("reParent 값?" + replyId);
        //각각의 id값을 받아온다
        //변경된 택스트
        var replyTextObj = $(this).parent().parent().find('.replyText');
        var replyText = replyTextObj.val();
        var textSpan = $(this).parent().parent().find('.textSpan');

        if (replyTextObj.prop('readonly') == true) {

            replyTextObj.prop('readonly', false);
            $(this).html('<span></span> 등록');

            textSpan.css('display', 'none');
            replyTextObj.css('display', 'block');

        }
        else if (replyTextObj.prop('readonly') == false) {

            replyTextObj.prop('readonly', true);
            $(this).html('<span></span> 수정');

            replyTextObj.css('display', 'none');
            textSpan.css('display', 'block');
        }

        // console.log(replyText + "보내지는 글");

        $.ajax({
            type: 'put',
            url: '/replies/' + replyId,
            headers: {
                "Content-Type": "application/json",
                "X-HTTP-Method-Override": "PUT"
            },
            data: JSON.stringify({replyText: replyText}),
            dataType: 'text',
            success: function (result) {
                // console.log("수정완료?");
                if (result == 'SUCCESS') {
                    textSpan.html(replyText);
                }
            }
        });
    });

    $(document).on("click", ".replyDelBtn", function () {
        var replyId = $(this).parent().parent().parent().find('.replyId').text();
        var replyTextObj = $(this).parent().parent().find('.replyText');
        var replyText = replyTextObj.val();

        $.ajax({
            type: 'delete',
            url: '/replies/' + replyId,
            headers: {
                "Content-Type": "application/json",
                "X-HTTP-Method-Override": "DELETE"
            },
            dataType: 'text',
            success: function (result) {
                // console.log("삭제?");
                if (result == 'SUCCESS') {
                    alert("삭제 되었습니다.");
                    getPage("/replies/" + boardId + "/" + replyPage);
                }
            }
        });
    });
</script>
<script>
    <%--3.날짜부분--%>
    Handlebars.registerHelper("prettifyDate", function (timeValue) {
        var dateObj = new Date(timeValue);
        var year = dateObj.getFullYear();
        var month = dateObj.getMonth() + 1;
        var date = dateObj.getDate();
        var hour = dateObj.getHours();
        var minute = dateObj.getMinutes();
        var strDate = year + "-" + month + "-" + date + " " + hour + ":" + minute;
        return strDate;
    });
    Handlebars.registerHelper('profileImg', function (replyProfile) {
        // console.log(replyProfile);
        return getFileInfo(replyProfile);
    });

</script>
<script>
    <%--페이지 연결부분--%>
    var printData = function (replyArr, target, templateObject) {
        var template = Handlebars.compile(templateObject.html());
        // console.log(template+">>>>>");
        var html = template(replyArr);

        $(".replyLi").remove();
        target.after(html);


    };
</script>

<script>
    /*댓글 목록 보기*/
    //해당 게시물의 번호
    var boardId =${boardVO.boardId};
    var replyPage = 1;
    //댓글목록 처리
    //getPage는 특정한 게시물에 대한 페이지 처리를 위해서 호출되는 함수
    function getPage(pageInfo) {
        $.getJSON(pageInfo, function (data) {
            // console.log(data.list.length);
            // console.log(data.reHeart.length);
            var temp = data.list;
            var temp2 = new Array(data.list.length);
            for (var i in temp) {
                temp2[i] = {replyVO: data.list[i], reHeart: data.reHeart[i], loginUser: data.loginUser[i]};
            }


            // console.log(data.loginUser+"ㄴㄴ");


            printData(temp2, $(".repliesDiv"), $('.template'));
            // printData(data.list, $(".repliesDiv"), $('.template'), data.reHeart);

            printPaging(data.pageMaker, $("#pagination"));
        });
    }

    //페이지 네이션 부분
    var printPaging = function (pageMaker, target) {
        var str = "";

        if (pageMaker.prev) {
            str += "<li class='page-item'><a class='page-link' href='" + (pageMaker.startPage - 1) + "'> << </a></li>";
        }

        for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
            var strClass = pageMaker.cri.page == i ? 'class=active page-item' : '';
            str += "<li " + strClass + "><a class='page-link' href='" + i + "'>" + i + "</a></li>";
        }

        if (pageMaker.next) {
            str += "<li class='page-item'><a class='page-link' href ='" + (pageMaker.endPage + 1) + "'> >> </a></li>";
        }
        target.html(str);
    };
    //최초로 댓글의 1페이지가져오는작업 (repliesList)버튼 클릭하면 작동
    $(".repliesDiv").ready(function () {

        if ($(".timeline li").resize() > 1) {
            return;
        }
        getPage("/replies/" + boardId + "/1");
    });
    //페이지 네이션 부분
    $("#pagination").on("click", "li a", function (event) {

        event.preventDefault();

        replyPage = $(this).attr("href");



        getPage("/replies/" + boardId + "/" + replyPage);
    });


</script>
<script>
    <%--하트버튼을 누르면 senddata로 heart컨트롤러로 ajax로 보낸다.--%>

    $(document).on("click", ".replyHeartBtn", function () {
//  자바스크립트 객체 형태로 전달

        var heart_replyid = $(this).parent().parent().parent().find('.replyId').text();
        var heart = $(this).prop('name');
        var sendLike = {'replyId': heart_replyid, 'replyHeart': heart};
//
//         console.log('/replies/heart/' + heart_replyid + '/' + heart);

        $.ajax({
            url: '/replies/heart/' + heart_replyid + '/' + heart,
            type: 'POST',
            data: sendLike,
            contentType: "application/json",
            success: function (data) {
                // console.log("하트 전송?"+data);
                $(this).prop('name', data);
                if (data == 1) {
                    // console.log("전송되어온 하트"+data);
                    $(this).children().prop("src", "/resources/images/like2.png");
                    getPage("/replies/" + boardId + "/" + replyPage);
                }
                else {
                    // console.log("전송되어온 하트값 0일때"+data);
                    $(this).children().prop("src", "/resources/images/like1.png");
                    getPage("/replies/" + boardId + "/" + replyPage);
                }
            }
        });
    });
</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="false"/>
<%--<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="false"/>--%>