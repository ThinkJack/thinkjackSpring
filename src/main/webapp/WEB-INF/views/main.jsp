
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/>
<link href="/resources/dist/css/main.css" rel="stylesheet">

<div>
    <section class="a" >

        <%--Main--%>

        <div class="deaf" id="main" ></div>

        <div class="row">
            <div class="col-xs-2  "></div>
            <div class="col-xs-3 removePadding" >

                <div class="imeage1 animate1 " >
                    <img src="/resources/images/titile.jpg" >
                </div>
            </div>
            <div class="col-xs-5 removePadding" >
                <div class="mainText ">

                    <h1 class="foo1 " style="color:black" >자신의 코드를</h1>

                    <h1 class="foo2 " style="color: black">작성해 보세요</h1>
                    <h1 class="foo3 " style="color: red">Thinkjack</h1>



                </div>
            </div>
            <div class="col-xs-2  "> </div>
        </div>
        <a href="#" class="scroll-down" address="true"></a>
        <div class="deaf" ></div>
    </section>

    <div class="deaf" id="editor" style="background-color: black">
    </div>
    <section class="b">
        <div class="row " >
            <div class="col-xs-4  "></div>

            <div class="col-xs-5 removePadding" >
                <div class="mainText pt2">

                </div>
                <div class="widthFull2 ">

                    <%--<iframe frameborder="0" height="100%" width="100%"--%>
                    <%--src="https://www.youtube.com/embed/aQsy17K84Ls?&version=3&loop=1&playlist=aQsy17K84Ls&autoplay=1&controls=0"frameborder="0"></iframe>--%>
                    <div class="textPage2 ">
                    </div>
                    <div class="textPage2 ">
                        <div class="col-sm-4 removePadding" >
                            <button class="custom-btn btn-12 widthFull" onclick="location.replace('/edit/unitTest')"><p>Unit Test</p></button>
                        </div>
                        <div class="col-sm-1 removePadding" >

                        </div>
                        <div class="col-sm-5 removePadding" >
                        </div>
                    </div>


                    <div class="textPage2 " >



                    </div>

                    <div class="textPage2 ">
                        <div class="col-sm-5 removePadding" >
                        </div>
                        <div class="col-sm-1 removePadding" >

                        </div>
                        <div class="col-sm-4 removePadding" >
                            <button class="custom-btn btn-12 widthFull mov" onclick="location.replace('/edit/editPage')" ><p>Edit Page</p></button>
                        </div>
                    </div>

                </div>
            </div>
            <div class="col-xs-2  "> </div>
        </div>

    </section>
    <div class="deaf" style="background-color:black">
    </div>
    <section class="c">
        <div class="col-xs-7 ">
            <h1 class="animate2">
                자신의 생각을 코드로 표현!
            </h1>
        </div>
        <div class="col-xs-3 ">

            <div class="imeage1">
                <div id="lampadario">
                    <%--@declare id="switch"--%><input class="input" id="a" type="radio" name="switch" value="on" />
                    <input class="input" type="radio" id="b" name="switch" value="off" checked="checked"/>
                    <label  for="switch"></label>
                </div>
            </div>
        </div>
    </section>
    <div class="deaf" style="background-color:black">

    </div>
    <section class="d" id="board">
        <div class="row maginPage"  >
            <div class="col-xs-2 " ></div>
            <div class="col-xs-3 removePadding ">
                <div  class="imeage1 ">
                    <div class="rotate mov3">
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
                <div class="reText">

                </div>
            </div>
            <div class="col-xs-1 removePadding" >
            </div>
            <div class="col-xs-4 removePadding" >
                <div class="mainText pt"></div>

                <div class="textPage3  ">
                    <div class="col-sm-6 removePadding" >
                        <button class="custom-btn btn-12 widthFull " onclick="location.replace('/board/list?category=free');"><p>Free Board</p></button>

                    </div>
                    <div class="col-sm-6 removePadding">
                    </div>
                </div>
                <div class="textPage3">
                    <div class="col-sm-6 removePadding" ></div>
                    <div class="col-sm-6 removePadding" >
                        <button  class="custom-btn btn-12 widthFull widthFull " onclick="location.replace('/board/list?category=qna');"><p>QNA</p></button>
                    </div>
                </div>
                <div class="textPage3">
                    <div class="col-sm-6 removePadding" >
                        <button  class="custom-btn btn-12 widthFull widthFull " onclick="location.replace('#');"><p>Source</p></button>
                    </div>
                    <div class="col-sm-6 removePadding" >
                    </div>
                </div>
                <div class="textPage3">
                    <div class="col-sm-6 removePadding" >
                    </div>
                    <div class="col-sm-6 removePadding" >
                        <button  class="custom-btn btn-12 widthFull widthFull " onclick="location.replace('/board/list?category=relese');"><p>Board Page</p></button>
                    </div>
                </div>
            </div>
            <div class="col-xs-2 "> </div>
        </div>


    </section>
</div>
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
    })

    //title옆 글
    window.sr = ScrollReveal({ reset: true });
    sr.reveal('.foo1');
    sr.reveal('.foo2',{duration: 1000});
    sr.reveal('.foo3',{duration: 1500});

    //전구 옆 글
    $(window).scroll(function() {
        var $el = $('.animate2');

        if($(this).scrollTop() >=1500) $el.addClass('animated fadeInLeft');
        else $el.removeClass('animated fadeInLeft');
    });


</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="false"/>