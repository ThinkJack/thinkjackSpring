
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
                </div>
                <div class="col-sm-8 removePadding borderLT" style="height: 62%; margin-right:30%;">
                    <div class="col-sm-1"></div>
                    <div class="col-sm-5">
                        <div class=" animate1 " >
                            <img src="/resources/images/titile.jpg" style="height: 300px; width: 300px;" >
                        </div></div>
                    <div class="col-sm-6">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-2 removePadding "> </div>
</section>
<div class="deaf" >
    <a href="#" class="scroll-down" address="true"></a>
</div>
<div class="deaf" id="editor" style="background-color: black"></div>
<section class="b container-fluid removePadding">
    <div class="row removePadding">
        <div class="col-sm-2 removePadding"></div>
        <div class="col-sm-8 removePadding" >
            <div class="row removePadding">
                <div class="col-sm-6 removePadding borderLB " style="height:20%;margin-right: 50% ;margin-bottom: -11px;">
                    <button class="btn btn-primary btn-lg btn-block bd" style="margin-left:39%;width:70%;border:8pt solid #fff;height:55%;margin-bottom: 10px;position:relative;top:69px;font-size: 28px" onclick="location.replace('/edit/unitTest')">Unit</button>
                </div>
                <div class="col-sm-4 removePadding borderLB " style="height:40%;margin-left: 20%;"></div>
                <div class="col-sm-4 removePadding borderRB " style="height:20%;margin-top:139.781px;">
                    <button class="btn btn-primary btn-lg btn-block bd" style="width:102.5%;border:8pt solid #fff;height:55%;margin-bottom: 10px;position:relative;top:-45%;font-size: 28px;" onclick="location.replace('/edit/editPage')">Edit</button>
                </div>
                <div class=" removePadding borderRT " style="height:20%;width:13.33%;margin-top:139.781px;"></div>
                <div class="col-sm-12 removePadding borderR " style="height:43%;">
                </div>
            </div>
        </div>
        <div class="col-sm-2 removePadding"> </div>
    </div>
</section>

<section class="c container-fluid removePadding">
    <div class="row removePadding">
        <div class="col-sm-4 removePadding " ></div>
        <div class="col-sm-4 removePadding  ">
            <img class="img-responsive" src="/resources/images/main/h.png">
        </div>
        <div class="col-sm-4 removePadding " >
            <div class="col-sm-6 removePadding borderRB " style="height:300px;"></div>
        </div>
    </div>
</section>


<section class="d container-fluid removePadding" id="board" >
    <div class="row removePadding">
        <div class="col-sm-6 removePadding " style="height:50%;margin:0">
        <div class="removePadding di" style="height:100%;width:32%;margin:0;"></div>
        <div class="removePadding di" style="height:100%;width:30%;margin:0;background-color:black">
            <div class="rotate widthFull " >
                <ul>
                    <li>
                        <a >
                            <div class="front img-circle ">
                                <%--<i class="fa fa-android fa-4x"></i>--%>
                                <img class=" widthFull"  src="/resources/images/like24-2.png" >
                            </div>
                            <div class="back img-circle">
                                <img  class=" widthFull" src="/resources/images/like24-1.png" >
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="removePadding di" style=";width:33%;margin:0;">
            <button type="button"  class="btn  btn-primary border " STYLE="height:40%;width:110%;">Source</button>
            <div class="removePadding di" style="width:103%;margin:0;">
                      </div>
        </div>
    </div>
        <div class="col-sm-6 removePadding borderL" style="height:50%;margin:0">
            <div class="removePadding di " style="width:33%;margin:0;">
                <button type="button" class="btn  btn-primary border" STYLE="height:40%;width:110%;">NOTICE</button>
                <div class="removePadding di" style="height:50%;width:103%;margin:0;"></div>
            </div>
            <div class="removePadding di" style="height:100%;width:32%;margin:0;">

            </div>
            <div class="removePadding di" style="height:100%;width:33%;margin:0;"></div>
        </div>
        <div class="col-sm-6 removePadding " style="height:50%;margin:0">
            <div class="removePadding di" style="height:100%;width:32%;margin:0;"></div>
            <div class="removePadding di animate2 text-white" style="width:30%;margin:0; background-color: aqua">
                                  <h1>다양한 소스를 확인하세요</h1>
                       </div>
            <div class="removePadding di" style=";width:33%;margin:0;">
                <button type="button" class="btn  btn-primary border " STYLE="height:40%;width:110%;">Source</button>
                <div class="removePadding di" style="width:103%;margin:0;"></div>
            </div>
        </div>
        <div class="col-sm-6 removePadding borderL" style="height:50%;margin:0">
        <div class="removePadding di " style="width:33%;margin:0;">
                <button type="button" class="btn  btn-primary border" STYLE="height:40%;width:110%;">Source</button>
                <div class="removePadding di" style="height:50%;width:103%;margin:0;"></div>
            </div>
            <div class="removePadding di" style="height:100%;width:32%;margin:0; ">
            </div>
            <div class="removePadding di" style="height:100%;width:33%;margin:0;"></div>
        </div>

    </div>
</section>
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
        var $el = $('.animate1');

        if($(this).scrollTop() >=10) $el.addClass('animated swing');
        else $el.removeClass('animated swing');
    });


    $(window).scroll(function() {
        var $el = $('.animate2');

        if($(this).scrollTop() >=2000) $el.addClass('animated slideInLeft');
        else $el.removeClass('animated slideInLeft');
    });


    //title옆 글
    window.sr = ScrollReveal({ reset: true });
    sr.reveal('.foo1');
    sr.reveal('.foo2',{duration: 1000});
    sr.reveal('.foo3',{duration: 1500});



</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="false"/>