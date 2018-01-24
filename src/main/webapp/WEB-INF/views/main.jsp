
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/>
<link href="/resources/dist/css/main.css" rel="stylesheet">

<section class="a container-fluid" >
    <%--Main--%>
    <div class="deaf" id="main" ></div>
    <div class="row removePadding">
        <div class="col-sm-2 removePadding"></div>
        <div class="col-sm-8 removePadding" >
            <div class="row removePadding">
                <div class="col-sm-6 removePadding borderRB " style="height: 30%;margin-left: 50% ;margin-bottom: -11px">
                    <br>
                    <p class="bd aniB mt-5" style=" font-size: 4em;" ><a style="font-size:6rem">rn</a>asterpiece</p>
                </div>
                <div class="col-sm-8 removePadding borderLT" style="height: 62%; margin-right:30%;">
                    <div class="col-sm-1"></div>
                    <div class="col-sm-5">
                        <div class=" aniA " >
                            <h1 class=" bd" >Website</h1>
                            <h1 class="bd">Interactions</h1>
                            <h1 class="text-white bd">without</h1>
                            <h1 class="text-white bd">code</h1>
                        </div>
                    </div>
                    <a href="#" class="scroll-down" address="true"></a>
                    <div class="col-sm-6">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-2 removePadding "> </div>
</section>
<div >
    <h1 class="bd " style="margin-left:10%; font-size: 4em;" >Service</h1>
</div>
<section class="b container-fluid removePadding">

    <div class="grid ">

        <div class="pointB col-6 " style="display: none">
            <iframe width="100%" height="100%"
                    src="https://www.youtube.com/embed/PzBrwCGbTJ4?controls=0&autoplay=1&loop=1&playlist=PzBrwCGbTJ4&showinfo=0">
            </iframe>
        </div>

        <!--Left side-->
        <div id="west" class=" column effect-hover ">
            <div class="content ">
                <i class="fa fa-edit" aria-hidden="true" onclick="location.href='/edit/editPage'">
                </i>
                <h2>Go <span >Edit</span></h2>
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
        <div class="pointA col-6 " style="display: none" >
            <iframe width="100%" height="100%"
                    src="https://www.youtube.com/embed/PzBrwCGbTJ4?controls=0&autoplay=1&loop=1&playlist=PzBrwCGbTJ4&showinfo=0">
            </iframe>
        </div>


    </div>

</section>

<script type="text/javascript">
    $(function(){
        $('#west').mouseenter(function(){

            $('.pointA').css("display","block");
            $('#east').css("display","none");

        });
        $('#west').mouseleave(function(){
            $('.pointA').css("display","none");
            $('#east').css("display","block");

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
    <h1 class="bd " style="margin-left:70%; font-size: 4em;" >Board</h1>
</div>

<section class="c container-fluid removePadding">
    <div class="row removePadding" >
        <div class="col-sm-3 " ></div>
        <div class="col-sm-9 removePadding lampContainer ">
            <div class="lamp-container " style="display:inline-block">
                <div class="lamp show-on-scroll">
                    <h1 class="bd ani1" style=" font-size: 4em;" >Masterpiece </h1>
                    <h1 class="bd ml-5 ani2" style=" font-size: 4em;" >Masterpiece </h1>
                </div>
            </div>
        </div>


        <div class=" col-sm-2"></div>

        <div class=" col-sm-2 box">
            <h2 class="hn text-white text-center">공지사항</h2>
            <span class="icon-cont"><i class="fa fa-rocket"></i>

                 <h1 class="bd text-white " style=" font-size: 1em;opacity: 0.5;">Click</h1></span>

            <ul class="hidden">
                <h6 class="text-center hn">새로운 공지사항을 확인하세요</h6>
                <li >
                    <button type="button" class="btn  btn-primary hn alignCenter" onclick="location.href='/board/list?category=notice'">Go</button>
                </li>



            </ul>

        </div>


        <div class="col-sm-2 box">
            <h2 class="hn text-white text-center">코드 게시판</h2>
            <span class="icon-cont"><i class="fa fa-edit"></i>
                      <h1 class="bd text-white " style=" font-size: 1em;opacity: 0.5;">Click</h1></span>

            <ul class="hidden">
                <h6 class="text-center hn">자신의 코드를 올려보세요</h6>
                <li >
                    <button type="button " class="btn  btn-primary hn alignCenter" onclick="location.href='/srcBoard/srcList'">Go</button>
                </li>
            </ul>

        </div>


        <div class="col-sm-2 box">
            <h2 class="hn text-white text-center">자유 게시판</h2>
            <span class="icon-cont"><i class="fa fa-desktop"></i>
                 <h1 class="bd text-white " style=" font-size: 1em;opacity: 0.5;">Click</h1></span>

            <ul class="hidden">
                <h6 class="text-center hn">자유롭게 의견을 올려보세요</h6>
                <li >
                <button type="button" class="btn  btn-primary hn alignCenter" onclick="location.href='/board/list?category=free'">Go</button>
                </li>
            </ul>

        </div>

        <div class="col-sm-2 box ">
            <h2 class="hn text-white text-center">질문 게시판</h2>
            <span class="icon-cont"><i class="fa fa-coffee"></i>
                 <h1 class="bd text-white  " style=" font-size: 1em;opacity: 0.5;">Click</h1></span>

            <ul class="hidden ">
                <h6 class="text-center hn">질문하세요</h6>
                <li >
                    <button type="button" class="btn  btn-primary hn alignCenter " onclick="location.href='/board/list?category=qna'">Go </button>
                </li>
            </ul>

        </div>
    </div>

</section>



<div class="deaf2" style="background-color: orange"></div>
<script>
    <%--슬라이드--%>
    $(function() {
        $('.scroll-down').click (function() {
            $('html, body').animate({scrollTop: $('section.d').offset().top }, 'slow');
            return false;
        });
    });
</script>
<script>
    <%--title--%>
    $(window).scroll(function() {
        var el = $('.aniA');

        if($(this).scrollTop() >=10) el.addClass('animated swing');
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

        if($(this).scrollTop() >=1700) $el.addClass('shown');
        else $el.removeClass('shown');

    });

    //sectionD
    $('.box').click(function() {
        $(this).toggleClass('selected');

    });
</script>

<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="false"/>