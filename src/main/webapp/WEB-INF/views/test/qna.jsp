<%--
  Created by IntelliJ IDEA.
  User: r
  Date: 2017-12-07
  Time: 오후 8:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/>

<jsp:include page="/WEB-INF/views/include/slidebar.jsp" flush="false"/>


    <!-- Top menu on small screens -->
    <header class="w3-container w3-top w3-hide-large w3-black w3-xlarge w3-padding-16">
        <span class="w3-left w3-padding">THINK JACK</span>
        <a href="javascript:void(0)" class="w3-right w3-button w3-black" onclick="w3_open()">☰</a>
    </header>
    <!-- Push down content on small screens -->
    <div class="w3-hide-large" style="margin-top:83px"></div>

    <!-- 내용-->
    <div class="row">
        <div class="col-3"></div>
        <div class="col-6">
            <div>질문 게시판</div>
            <div class="well" >내용</div>
            <button type="button" class="btn">reply</button> <span class="w3-tag">0</span>
            <hr>
            <div class="well">
                <div >내용</div>
                <button type="button" class="btn">reply</button>
            </div>
            <hr>
            <div class="container">
                <ul class="pager">
                    <li><a href="#">Previous</a></li>
                    <li><a href="#">Next</a></li>
                </ul>
            </div>
            <hr>
        </div>
    </div>

<ul id="replies">
</ul>

<script>
    <%--전체 게시판 숫자 불러오기--%>
var boardId=1;
$.getJSON("/replies/all/" + boardId , function (data) {
    console.log(data.length);

//전체 댓글 목록 출력
    $(data).each(
        function(){
            str += "<li data-replyId='"+this.replyId+"' class ='replyLi'>"
                + this.replyId +":"+this.replyText
                +'</li>';
        });

    $("#replies").html(str);
    });
</script>

<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="false"/>