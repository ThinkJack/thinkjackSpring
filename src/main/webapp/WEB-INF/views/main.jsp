
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/>
<link href="/resources/dist/css/main.css" rel="stylesheet">
<style>

    .title{
        font-size: 4rem;
    }
    .title2{
        font-size:6rem
    }

    @media screen and (max-width: 1090px) {

        .title{
            font-size: 2rem;
        }
        .title2{
            font-size:4rem
        }
        .text-center{
            font-size: 1rem;
        }

        .b {
            height: 60%;
        }

    }
    @media screen and (max-width: 570px) {

        .title{
            font-size: 1.2rem;
        }
        .title2{
            font-size:3rem
        }
        .b {
            height: 50%;
        }


    }
    img { max-width: 100%; }
</style>
<section class="a container-fluid" >
    <%--Main--%>
    <div class="deaf" id="main"></div>
    <div class="row removePadding">
        <div class="col-sm-2 removePadding"></div>
        <div class="col-sm-8 removePadding">
            <div class="row removePadding">
                <div class="col-sm-6 removePadding borderRB "
                     style="height: 30%;margin-left: 50% ;margin-bottom: -11px;z-index: 10">
                    <br>
                    <p class="bd aniB mt-5 title"><a class="title2" >rn</a>asterpiece</p>
                </div>
                <div class="col-sm-8 removePadding borderLT" style="height: 62%; margin-right:30%;">
                    <div class="row">
                        <div class=" aniA  " style="padding-left: 100px">
                            <h1 class=" bd title" >Talk is cheap.</h1>
                            <h1 class=" bd text-white title" >I Show me the code.</h1>
                        </div>
                    </div>
                    <a href="#" class="scroll-down" address="true"></a>
                    <div class="col-sm-6">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-2 removePadding "></div>
</section>
<div>
    <h1 class="bd title" style="margin-left:10%;z-index:5; ">Service</h1>
</div>
<section class="b container-fluid removePadding">
    <div class="grid ">
        <div class="pointB col-6 " style="display: none ;margin-top: 15%;height:45%;">
            <img width="100%" height="100%"
                 src="/resources/test1.gif" />
        </div>
        <!--Left side-->
        <div id="west" class=" column effect-hover ">
            <div class="content ">
                <i class="fa fa-edit" aria-hidden="true" onclick="location.href='/edit/editPage'">
                </i>
                <h2>Go <span>Editor</span></h2>
            </div>
        </div>
        <!--Right side-->
        <div id="east" class="column effect-hover">
            <div class="content">
                <i class="fa fa-keyboard-o" aria-hidden="true" onclick="location.href='/edit/unitTest'">
                </i>
                <h2>Go <span class="tip">Unit Test</span></h2>
            </div>
        </div>
        <div class="pointA col-6 " style="display: none ;margin-top: 15%;height:45%;">
            <img width="100%" height="100%"
                 src="/resources/editgif.gif" />
        </div>
    </div>
</section>
<script type="text/javascript">
    $(function () {
        $('#west').mouseenter(function () {
            $('.pointA').css("display", "block");
            $('#east').css("display", "none");
        });
        $('#west').mouseleave(function () {
            $('.pointA').css("display", "none");
            $('#east').css("display", "block");
        });
    });
</script>
<script type="text/javascript">
    $(function(){
        $('#east').mouseenter(function(){
            $('.pointB').css("display","block");
            $('#west').css("display","none");
        });
        $('#east').mouseleave(function(){
            $('.pointB').css("display","none");
            $('#west').css("display","block");
        });
    });
</script>
<div style="background-color:white">
    <h1 class="bd title ">Board</h1>
</div>
<section class="c container-fluid removePadding">
    <div class="row removePadding">
        <div class="col-sm-3 "></div>
        <div class="col-sm-9 removePadding lampContainer ">
            <div class="lamp-container " style="display:inline-block">
                <div class="lamp show-on-scroll">
                    <h1 class="bd ani1 title">Masterpiece </h1>
                    <h1 class="bd ml-5 ani2 title">Boards</h1>
                </div>
            </div>
        </div>
        <div class=" col-sm-2"></div>
        <div class=" col-sm-2 box" onclick="location.href='/board/list?category=notice'">
            <h2 class="hn text-white text-center">공지사항</h2>
            <span class="icon-cont"><i class="fa fa-rocket"></i>
                 <h1 class="bd text-white " style=" font-size: 1em;opacity: 0.5;">Click</h1>
            </span>
        </div>
        <div class="col-sm-2 box" onclick="location.href='/srcBoard/srcList'">
            <h2 class="hn text-white text-center">코드 게시판</h2>
            <span class="icon-cont"><i class="fa fa-edit"></i>
                      <h1 class="bd text-white " style=" font-size: 1em;opacity: 0.5;">Click</h1></span>
        </div>
        <div class="col-sm-2 box" onclick="location.href='/board/list?category=free'">
            <h2 class="hn text-white text-center">자유 게시판</h2>
            <span class="icon-cont"><i class="fa fa-desktop"></i>
                 <h1 class="bd text-white " style=" font-size: 1em;opacity: 0.5;">Click</h1></span>
        </div>
        <div class="col-sm-2 box " onclick="location.href='/board/list?category=qna'">
            <h2 class="hn text-white text-center">질문 게시판</h2>
            <span class="icon-cont"><i class="fa fa-coffee"></i>
                 <h1 class="bd text-white  " style=" font-size: 1em;opacity: 0.5;">Click</h1></span>
        </div>
    </div>
</section>
<div class="deaf2" style="background-color: orange"></div>
<script>
    <%--슬라이드--%>
    $(function() {
        $('.scroll-down').click (function() {
            $('html, body').animate({scrollTop: $('section.c').offset().top }, 'slow');
            return false;
        });
    });
</script>
<script>
    <%--title--%>
    $(window).scroll(function () {
        var el = $('.aniA');

        if ($(this).scrollTop() >= 10) el.addClass('animated swing');
        else el.removeClass('animated swing');
    });
    var el = $('.aniB');
    el.addClass('animated slideInDown');
    $(window).scroll(function() {
        var el = $('.ani1');
        if($(this).scrollTop() >=1700) el.addClass('animated slideInRight');
        else el.removeClass('animated slideInRight');
    });
    $(window).scroll(function() {
        var el = $('.ani2');

        if($(this).scrollTop() >=1700) el.addClass('animated slideInLeft');
        else el.removeClass('animated slideInLeft');
    });
    //나타나는 글
    window.sr = ScrollReveal({ reset: true });
    sr.reveal('.foo1');
    //전구
    $(window).scroll(function() {
        var $el = $('.show-on-scroll');
        if (matchMedia("screen and (min-width: 1100px)").matches) {

            if($(this).scrollTop() >=1700) $el.addClass('shown');
            else $el.removeClass('shown');

        } else {
            if($(this).scrollTop() >=1000) $el.addClass('shown');
            else $el.removeClass('shown');
        }
    });
    //sectionD
    $('.box').click(function() {
        $(this).toggleClass('selected');

    });
</script>

<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="false"/>