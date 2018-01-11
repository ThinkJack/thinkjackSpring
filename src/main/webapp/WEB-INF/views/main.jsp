
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
                    <h1 class="foo3 ">Thinkjack</h1>
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
<section class="b container-fluid">
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
<div class="deaf" ></div>
<section class="c container-fluid">
    <div class="col-sm-2 removePadding"></div>
    <div class="col-sm-8 removePadding ">
        <h1 class="animate2">
            자신의 생각을 코드로 표현!
        </h1>
        <div class=" removePadding borderRB " style="height: 60.5%;margin-left: 85%">
        </div>
        <div class="removePadding borderLT" style="height: 60.5%;margin-left: 50%;margin-right:30%;">
        </div>
    </div>
    <div class="col-sm-2 removePadding">


        <div id="lampadario">
            <%--@declare id="switch"--%><input class="input" id="a" type="radio" name="switch" value="on" />
            <input class="input" type="radio" id="b" name="switch" value="off" checked="checked"/>
            <label  for="switch"></label>
        </div>

    </div>
</section>
<div class="deaf" style="background-color:black">
</div>
<section class="d container-fluid" id="board">
    <div class="col-sm-6 removePadding " style="height: 20%;background-color: #8B2252">
        <div class="rotate" style="width:100%; height: 100%;margin-left: auto>
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
    <div class="col-sm-6 removePadding " style="height: 20%"></div>
    <div class="col-sm-6 removePadding " style="height: 48%">
        <img src="/resources/images/main/f.png" style="height:auto; width:40%;position: absolute;left: 30%" > </div>
    <div class="col-sm-4 removePadding" >

        <div class="col-sm-6 removePadding " style="height: 12%;">
            <button class="btn btn-primary btn-lg btn-block bd " style="height: 90%;position: relative;top:-35px;border: #fff 8pt solid;" onclick="location.replace('/board/list?category=free');"><p>Free Board</p></button>
        </div>
        <div class="col-sm-6 removePadding " style="height: 12%;"></div>

        <div class="col-sm-6 removePadding " style="height: 12%;"></div>
        <div class="col-sm-6 removePadding " style="height: 12%;">
            <button  class="btn btn-primary btn-lg btn-block bd " style="height: 90%;position: relative;top:-35px;border: #fff 8pt solid;" onclick="location.replace('/board/list?category=qna');"><p>QNA</p></button>
        </div>

        <div class="col-sm-6 removePadding " style="height: 12%;">
            <button  class="btn btn-primary btn-lg btn-block bd " style="height: 90%;position: relative;top:-35px;border: #fff 8pt solid;" onclick="location.replace('/srcBoard/srcList');"><p>Source</p></button>
        </div>
        <div class="col-sm-6 removePadding " style="height: 12%;"></div>

        <div class="col-sm-6 removePadding  " style="height: 12%;"></div>
        <div class="col-sm-6 removePadding" style="height: 12%;">
            <button  class="btn btn-primary btn-lg btn-block bd " style="height: 90%;position: relative;top:-35px;border: #fff 8pt solid;" onclick="location.replace('/board/list?category=notice');"><p>Board Page</p></button>
        </div>

    </div>

</section>

<div class="deaf" style="background-color:black"></div>

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

    //title옆 글
    window.sr = ScrollReveal({ reset: true });
    sr.reveal('.foo1');
    sr.reveal('.foo2',{duration: 1000});
    sr.reveal('.foo3',{duration: 1500});

    //전구 옆 글
    $(window).scroll(function() {
        var $el = $('.animate2');

        if($(this).scrollTop() >=1800) $el.addClass('animated fadeInLeft');
        else $el.removeClass('animated fadeInLeft');
    });


</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="false"/>