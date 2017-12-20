<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/>

<jsp:include page="/WEB-INF/views/include/slidebar.jsp" flush="false"/>


<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<%--이모티콘--%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%--하트 스타일부분--%>
<style>

    .boxcoracao{
        width: 35px;
        display: inline-block;
        position: relative;
    }

    .textbtn{ display: inline-block;}

    .coracao{
        background: url("https://abs.twimg.com/a/1446542199/img/t1/web_heart_animation.png");
        height: 50px;
        width: 50px;
        background-size: 2900%;
        background-position: left center;

        top: -30px;
        left:  0px;
        position:absolute;

    }
    .coracao.ativo{
        background: url("https://abs.twimg.com/a/1446542199/img/t1/web_heart_animation.png");
        height: 50px;
        width: 50px;
        background-size: 2900%;
        background-position: right center;

        top: -30px;
        left:  0px;
        position:absolute;
        animation: none 0s !important;
        -moz-animation: none 0s !important;

    }
    .btn:hover  .coracao{
        animation: animationFrames 1.4s steps(28) infinite;
    }

    @keyframes animationFrames{
        100%{
            background-position: -2800px ;

        }
    }


    .btn-purple{
        color: #fff;
        background-color: #AE30DA;
        border-color: #8A2EAB;
    }

    .btn-purple:hover{
        color: #fff;
        background-color: #8F33AF;
        border-color: #8A2EAB;

    }

    .btn{ transition: background-color 0.2s ease;}
</style>
<div class="row">
    <div class="col-3"></div>
    <div class="col-6">

        <form role="form" method="post">
            <input type="hidden" name='category' value="${category}">
            <input type='hidden' name='page' value="${cri.page}">
            <input type='hidden' name='perPageNum' value="${cri.perPageNum}">
            <input type='hidden' name='searchType' value="${cri.searchType}">
            <input type='hidden' name='keyword' value="${cri.keyword}">
        </form>
        <div class="box-body">

            <div style="text-align: right;">
                <a class="btn btn-outline-dark heart">
                    <img id="heart" src="">
                </a>

            </div>
            <div class="form-group">
                <label>Title</label>
                <input type="text" name='title' class="form-control" value="${boardVO.boardTitle}"
                       readonly="readonly">
            </div>
            <div class="form-group">
                <label>Content</label>
                <textarea type="text" name='content' class="form-control" rows="20"
                          readonly="readonly">${boardVO.boardContent}</textarea>
            </div>
            <div class="form-group">
                <label>Writer</label>
                <input type="text" name='writer' class="form-control" value="${boardVO.boardWriter}"
                       readonly="readonly">
            </div>
        </div>
        <div class="box-footer">
            <c:if test="${login.userName == boardVO.boardWriter}">
                <button type="submit" class="btn btn-warning modifyBtn">Modify</button>
                <button type="submit" class="btn btn-danger removeBtn">REMOVE</button>
            </c:if>
            <button type="submit" class="btn btn-primary goListBtn">GO LIST</button>
        </div>
        <%--댓글 등록 부분 --%>
        <div class="media well">
            <div class="media-body">
                <%--댓글 등록하는 아이디(--%>
                <input type="text" name='writer' class="form-control" id="register" value="${boardVO.boardWriter}"  readonly="readonly">
                <%--댓글 입력 부분--%>
                <div class="form-group">
                    <textarea class="form-control" rows="3" id="newReplyText">댓글 입력하세요</textarea>
                    <%--1.등록 버튼을 누르면 새로운 댓글 추가된다--%>
                    <button type="button" type="submit" class="btn btn-danger" id="addBtn" >등록 </button>
                </div>
            </div>
        </div>

        <%--입력된 댓글 목록 나타나는 부분--%>
        <ul class="replies"></ul>
        <form role="form2">
            <input type="hidden" name='replyLikeCnt' value="${replyVO.replyLikeCnt}">
        </form>
        <ul class="timeline">
            <%--버튼을 클릭하면 댓글목록이 나온다--%>
            <li class = "time-label" id="repliesDiv" >
                <button type="button" class=""> Replies List </button>
            </li>
            <%--페이지네이션 부분--%>
            <div class ='text-center'>

                <ul id="pagination" class="pagination">
                </ul>

            </div>
        </ul>

        <%--댓글 반복문 부분--%>
        <script id="template" type="text/x-handlebars-template">
            {{#each .}}
            <li class ="replyLi" data-replyId={{replyId}}>

                <div class="timeline-item media well">
                    <%--3.날짜부분--%>
                    <span class="time">
                           {{prettifyDate replyRegdate}}

                          {{#if replyParent}}
                    <span class="badge">대댓글</span>

                    {{else}}
                    <span class="badge">댓글</span>

                    {{/if}}

                    </span>
                    <div class="btn reHeart">
                        <div class='textbtn'>
                            Like
                        </div>

                        <div style="text-align: right;">
                            <a class="btn btn-outline-dark reHeart">
                                <img id="reHeart" src="">
                            </a>
                        </div>
                    </div>>
                    <div class="media-body" id="comentReply" >
                        <h3 class="timeline-header"><div>{{replyId}}</div>{{replyWirter}}</h3>
                        <input type="text" name='title' class="timeline-body" value={{replyText}} readonly="readonly">
                        <a class="btn btn-primary btn-xs" data-toggle="modal" data-target="#modifyModal">Modify</a>
                    </div>
                </div>
            </li>
            {{/each}}
        </script>
        <div class="col-3"></div><div id='modifyModal' class="modal modal-primary fade" role="dialog">
        <%--modal-title--%>
        <div class ='modal-dialog'>
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body" data-replyId>
                        <p><input type="text" id="replyText" class="form-control"></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button"  class="btn btn-info" id="replyModBtn">Modify</button>
                        <button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
        <script>
            $(document).ready(function () {
                var heartval = ${heart};

                if(heartval>0) {
                    console.log(heartval);
                    $("#heart").prop("src", "/resources/images/like2.png");
                    $(".heart").prop('name',heartval)
                }
                else {
                    console.log(heartval);
                    $("#heart").prop("src", "/resources/images/like1.png");
                    $(".heart").prop('name',heartval)
                }        var formObj = $("form[role='form']");
                var boardid =  "<input type='hidden' name='boardId' value='${boardVO.boardId}'>";

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


                $(".reHeartt").on("click", function () {

                    var that = $(".reHeart");

                    var sendData = {'replyId' : '${replyVO.replyId}','heart' : that.prop('name')};
                    $.ajax({
                        url :'/board/heart',
                        type :'POST',
                        data : sendData,
                        success : function(data){
                            that.prop('name',data);
                            if(data==1) {
                                $('#heart').prop("src","/resources/images/like2.png");
                            }
                            else{
                                $('#heart').prop("src","/resources/images/like1.png");
                            }


                        }
                    });
                });



            })
        </script>


        <script>

            //1.댓글등록부분
            $("#addBtn").on("click", function () {
                //각각의 id값을 받아온다

                var replyTextObj = $("#newReplyText");
                //내용입력 comment
                var replyText = replyTextObj.val();
                var replyer = $("#register").val();

                $.ajax({
                    type: 'post',
                    url: '/replies/',
                    headers: {
                        "Content-Type": "application/json",
                        "X-HTTP-Method-Override": "POST"
                    },
                    dataType: 'text',
                    //문자를 객체로 바꿈
                    data: JSON.stringify({boardId: boardId, replyText: replyText,replyWirter:replyer}),
                    success: function (result) {
                        if (result == 'SUCCESS') {
                            alert("등록");
                            replyPage = 1;
                            getPage("/replies/" + boardId + "/" + replyPage);

                            replyTextObj.val("");
                        }
                    }
                });
            });
            <%--modal창 수정 삭제--%>
            $("#replyDelBtn").on("click",function() {
                var replyId = $('.modal-title').html();
                var replyText = $("#replyText").val();

                $.ajax({
                    type: 'delete',
                    url: '/replies/' + replyId,
                    headers: {
                        "Content-Type": "application/json",
                        "X-HTTP-Method-Override": "DELETE"
                    },
                    dataType: 'text',
                    success: function (result) {

                        if (result == 'SUCCESS') {
                            alert("삭제 되었습니다.");
                            getPage("/replies/"+boardId+"/"+replyPage);
                        }
                    }
                });

            });
            $("#replyModBtn").on("click", function () {

                var replyId = $('.modal-title').html();
                var replyText = $("#replyText").val();
                //console.log(replyText);

                $.ajax({
                    type:'put',
                    url:'/replies/'+ replyId,
                    headers: {
                        "Content-Type":"application/json",
                        "X-HTTP-Method-Override": "PUT"
                    },
                    data:JSON.stringify({replyText:replyText}),
                    dataType: 'text',
                    success: function (result) {
                        if (result == 'SUCCESS') {
                            alert("수정 되었습니다.");
                            getPage("/replies/"+boardId+"/"+replyPage);
                        }
                    }
                });
            });

        </script>

        <script>
            <%--3.날짜부분--%>
            Handlebars.registerHelper("prettifyDate",function(timeValue){
                var dateObj = new Date(timeValue);
                console.log(timeValue+"나오니?????");
                var year = dateObj.getFullYear();
                console.log(year+"year");
                var month = dateObj.getMonth()+1;
                var date = dateObj.getDate();
                var hour = dateObj.getHours();
                var minute = dateObj.getMinutes();
                var second = dateObj.getSeconds();
                var strDate = year+"-"+month+"-"+date+" "+hour+":"+minute+":"+second;
                return strDate;
            });
        </script>
        <script>
            <%--페이지 연결부분--%>
            var printData = function (replyArr,target,templateObject){

                var template = Handlebars.compile(templateObject.html());
                // console.log(template+">>>>>");
                var html = template(replyArr);
                $(".replyLi").remove();
                target.after(html);
            }
        </script>
        <script>
            /*댓글 목록 보기*/
            //해당 게시물의 번호

            var boardId=${boardVO.boardId};
            var replyPage=1;

            //댓글목록 처리
            //getPage는 특정한 게시물에 대한 페이지 처리를 위해서 호출되는 함수
            function getPage(pageInfo){
                $.getJSON(pageInfo,function (data) {
                    console.log("pageMaker?:"+data.pageMaker);
                    printData(data.list,$("#repliesDiv"),$('#template'));
                    printPaging(data.pageMaker ,$(".pagination"));

                    $("#modifyModal").modal('hide');

                    //    예상:대댓글부분div 숨긴다
                });
            }

            //페이지 네이션 부분
            var printPaging = function(pageMaker,target){
                var str="";
                console.log(pageMaker+"나오니");
                if(pageMaker.prev){
                    str += "<li><a href='"+(pageMaker.startPage-1)+"'> << </a></li>";
                }

                for(var i=pageMaker.startPage, len = pageMaker.endPage; i <= len ; i++){
                    var strClass = pageMaker.cri.page == i?'class=active':'';
                    str += "<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>";
                }

                if(pageMaker.next){
                    str += "<li><a href ='"+(pageMaker.endPage+1)+"'> >> </a></li>";
                }
                target.html(str);
            };

            //최초로 댓글의 1페이지가져오는작업 (repliesList)버튼 클릭하면 작동
            $("#repliesDiv").on("click",function(){
                if($(".timeline li").resize()>1){
                    return;
                }
                getPage("/replies/"+boardId+"/1");
            });
            //페이지 네이션 부분
            $(".pagination").on("click","li a", function(event){

                event.preventDefault();

                replyPage = $(this).attr("href");

                getPage("/replies/"+boardId+"/"+replyPage);
            });

            //대글리스트 나오는 부분
            $("#replies").on("click",".replyLi button", function () {
                var reply = $(this).parent();
                //reply의 속성
                var replyId = reply.attr("data-replyId");

                var replyText = reply.text();

                $(".modal-title").html(replyId);
                $("#replyText").val(replyText);
                $("#modDiv").show("slow");
            });


            //댓글의 수정버튼을 누르면 모달창이 나오도록
            $(".timeline").on("click",".replyLi",function (event){

                var reply =$(this);
                //#repliesText의 값을 reply에서 찾는다(class이름이 timeline-bodyd의 글에서
                $("#repliesText").val(reply.find('.timeline-body').text());
                //data-replyId 값을 받아서 modal-title값으로 보낸다
                $(".modal-title").html(reply.attr("data-replyId"));

            });

            //대댓글 목록 부분
            function listReply2(){
                $.ajax({
                    type: "get",
                    //contentType: "application/json", ==> 생략가능(RestController이기때문에 가능)
                    url: "${path}/reply/listJson.do?bno=${dto.bno}",
                    success: function(result){
                        console.log(result);
                        var output = "<table>";
                        for(var i in result){
                            output += "<tr>";
                            output += "<td>"+result[i].userName;
                            output += "("+changeDate(result[i].regdate)+")<br>";
                            output += result[i].replytext+"</td>";
                            output += "<tr>";
                        }
                        output += "</table>";
                        $("#listReply").html(output);
                    }
                });
            }

            $("#reAddBtn").click(function () {
                //reply 같으면 div창이 나타나게
                //div에는 reply아이디값을 값이

                var reReplyTextObj = $("#newReReplyText");

                $.ajax({
                    type: 'post',
                    url: '/replies/re',
                    headers: {
                        "Content-Type": "application/json",
                        "X-HTTP-Method-Override": "POST"
                    },
                    dataType: 'text',
                    //문자를 객체로 바꿈
                    data: JSON.stringify({boardId: boardId, replyText: replyText,userId:uerId}),
                    success: function (result) {
                        if (result == 'SUCCESS') {
                            alert("대댓글 등록");
                            replyPage = 1;
                            getPage("/replies/" + boardId + "/" + replyPage);

                            replyTextObj.val("");
                        }
                    }
                });
            });

        </script>
        <script>
            //댓글부분
            //좋아요 버튼
            $("#reHeart").click(function() {
                var reHeartVal = ${heart};

                if(reHeartVal>0) {
                    console.log(heartval);
                    $("#reHeart").prop("src", "/resources/images/like2.png");
                    $(".reHeart").prop('name',reHeartVal)
                }
                else {
                    console.log(reHeartVal);
                    $("#reHeart").prop("src", "/resources/images/like1.png");
                    $(".reHeart").prop('name',reHeartVal)
                }        var formObj = $("form[role='form']");
                var boardid =  "<input type='hidden' name='boardId' value='${boardVO.boardId}'>";

            });



        </script>

        <jsp:include page="/WEB-INF/views/include/footer.jsp" flush="false"/>
<%--<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="false"/>--%>