
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/>

<section class="basic">

    <%--Main--%>
    <div class="container-fluid " >
        <div class="deaf" id="main" ></div>
        <div class="row maginPage main">
            <div class="col-lg-2 pageBox "></div>
            <div class="col-lg-3 removePadding" >
                <img src="/resources/images/titile.jpg" >
            </div>
            <div class="col-lg-5 removePadding" >
                <div class="mainText">
                </div>
            </div>
            <div class="col-lg-2 pageBox "> </div>
        </div>
    </div>

    <a href="#" class="scroll-down" address="true"></a>
</section>
<section class="basic">
    <div class="deaf" id="editor" style="background-color: black">

    </div>


    <div class="row maginPage" >
        <div class="col-lg-2 pageBox "></div>
        <div class="col-lg-3 removePadding "  >
            <div  class="imeage1">
                <img src="/resources/images/io.JPG" >
            </div>
        </div>
        <div class="col-lg-5 removePadding" >
            <div class="mainText pt2">
            </div>
            <div class="widthFull2 ">
                <%--<iframe frameborder="0" height="100%" width="100%"--%>
                <%--src="https://www.youtube.com/embed/aQsy17K84Ls?&version=3&loop=1&playlist=aQsy17K84Ls&autoplay=1&controls=0"frameborder="0"></iframe>--%>
                <div class="textPage2 ">
                    <div class="col-sm-6 removePadding" >

                    </div>
                    <div class="col-sm-6 removePadding" >
                        <button type="button" class="btn button1 widthFull " onclick.href="/board/list?category=free" onclick="location.replace('/edit/editPage')" ><p>Edit Page</p></button>
                    </div>
                </div>

                <div class="textPage2 ">
                    <div class="col-sm-6 removePadding" >
                        <button type="button" class="btn button1 widthFull " onclick="location.replace('/edit/unitTest')" ><p>Unit Test</p></button>
                    </div>
                    <div class="col-sm-6 removePadding" >
                    </div>
                </div>

            </div>
        </div>
        <div class="col-lg-2 pageBox "> </div>
    </div>

</section>
<section class="point">
<div class="col-lg-5 "> </div>
    <div class="col-lg-4 rotate ">
        <ul>
            <li>
                <a href="#">
                    <div class="front img-circle">
                        <%--<i class="fa fa-android fa-4x"></i>--%>
                        <img src="/resources/images/like24-2.png" >
                    </div>
                    <div class="back img-circle">
                        <img src="/resources/images/like24-1.png" >
                    </div>
                </a>
            </li>
        </ul>
    </div>
</section>
<section class="ok " id="board">
    <div class="row maginPage"  >
        <div class="col-lg-2 pageBox" ></div>
        <div class="col-lg-3 removePadding ">
            <div  class="imeage1 ">
                <figure class="snip1585">
                    <img src="/resources/images/main2.jpg" >
                    <figcaption>
                        <h3>원하는 게시판의 버튼을 클릭하세요 </h3>
                    </figcaption>
                </figure>

            </div>
            <div class="reText">
                <div class="col-sm-1 pt1" >
                    <svg class="rect " width="60px" height="60px">
                        <rect width="60px" height="60px" style="color:black"/>
                    </svg>
                </div>
                <div class="col-sm-10 pt" >
                    <div class=" positionBtn"><p>Board Page</p></div>
                </div>
                <div class="col-sm-1 line">
                    <svg class="rect" width="30px" height="100%" >
                        <rect width="30px" height="100%" style="color:black"/>
                    </svg>
                </div>
            </div>
        </div>
        <div class="col-lg-5 removePadding" >
            <div class="mainText pt2"></div>
            <div class="textPage2 ">
                <div class="col-sm-6 removePadding" >
                    <button type="button" class="btn button1 widthFull" onclick="location.replace('/board/list?category=free');"><p>Free Board</p></button>
                </div>
                <div class="col-sm-6 removePadding">
                </div>
            </div>
            <div class="textPage2 ">
                <div class="col-sm-6 removePadding" ></div>
                <div class="col-sm-6 removePadding" >
                    <button type="button" class="btn button1 widthFull " onclick="location.replace('/board/list?category=qna');"><p>QNA</p></button>
                </div>
            </div>
            <div class="textPage2 ">
                <div class="col-sm-6 removePadding" >
                    <button type="button" class="btn button1 widthFull " onclick="location.replace('#');"><p>Source</p></button>
                </div>
                <div class="col-sm-6 removePadding" >
                </div>
            </div>
            <div class="textPage2 ">
                <div class="col-sm-6 removePadding" >
                </div>
                <div class="col-sm-6 removePadding" >
                    <button type="button" class="btn button1 widthFull " onclick="location.replace('/board/list?category=relese');"><p>Board Page</p></button>
                </div>
            </div>
        </div>
        <div class="col-lg-2 pageBox"> </div>
    </div>

    <div class="deaf" ></div>

</section>
<script>
    <%--슬라이드--%>
    $(function() {
        $('.scroll-down').click (function() {
            $('html, body').animate({scrollTop: $('section.ok').offset().top }, 'slow');
            return false;
        });
    });




</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="false"/>