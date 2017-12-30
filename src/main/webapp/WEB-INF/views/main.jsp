
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    <%--전체적으로 padding-top값 존재--%>
    .maginPage{
        height: 700px;
    }

    .logo{
        width:95%;
        height:85%;
    }
    .imeage1{
        width:95%;
        height:82%;
    }

    .imeage4{
        width:95%;
        height:90%;
    }
    .mainText{
        width:100%;
        height:5%;
        /*background-color: #5A5CAD;*/
    }
    .centerText{
        width: 100%;
        height: 75%;
        /*background-color: grey;*/
    }

    .textPage{
        width:100%;
        height:21.79%;
        /*background-color: #2A00FF;*/
    }

    .textPage2{
        width:100%;
        height:100%;
        /*background-color: #6a0d6a;*/
    }
    .textPage4{
        width:100%;
        height:26.5%;
        /*background-color: #888888;*/
    }

    .textPage3{
        width:100%;
        height:75%;
        /*background-color: #00a8c6;*/
    }



    .deaf{
        height: 165px;
        /*background-color: #aa0000;*/
    }
    .pageBox{
        height: 700px;

    }
    img{
        width: 100%;
        height: 94%;
    }
.line{
    width:30px;
    height: 100%;
    background-color: #0C1021;
    }
    .line2{
        width:95%;
        height: 100%;
        background-color: #FFFFFF;
    }

    .reText{
        width: 94%;
        height: 37%;
    background-color:#0C1021;
    }
    .reText3{
            width: 94%;
            height:14%;
            background-color:#0C1021;
        }
    .reText4{
        width: 94%;
        height: 41%;
        background-color:#0C1021;
    }
</style>
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/>



<%--Main--%>
<div class="container-fluid " >
    <div class="deaf" id="main"></div>
    <div class="row maginPage"  >
    <div class="col-lg-2 pageBox "></div>
    <div class="col-lg-3 removePadding" >
        <div class="logo" >
            <img src="/resources/images/logo.png" >
        </div>

    </div>
    <div class="col-lg-5 removePadding" >
        <div class="mainText">
        </div>
        <div class="centerText">
            <div class="line"></div>
        </div>
        <div class="textPage">



                <div class="col-sm-6 removePadding" style="background-color:yellow;">
                    <div class="line"></div>
                </div>
                <div class="col-sm-1 removePadding" style="background-color:pink;">
                    ta sunt explicabo.
                </div>
                <div class="col-sm-3 removePadding" style="background-color:yellow;">
                    hhhh
                </div>
                <div class="col-sm-2 removePadding" style="background-color:pink;">
                    sunt explicabo.
                </div>

       </div>
        <div class="textPage">



            <div class="col-sm-6 removePadding" style="background-color:yellow;">
                <div class="line"></div>
            </div>
            <div class="col-sm-1 removePadding" style="background-color:pink;">
                ta sunt explicabo.
            </div>
            <div class="col-sm-3 removePadding" style="background-color:yellow;">
                hhhh
            </div>
            <div class="col-sm-2 removePadding" style="background-color:pink;">
                sunt explicabo.
            </div>

        </div>
    </div>
    <div class="col-lg-2 pageBox "> </div>
</div>


    <div class="deaf" id="editor"></div>
    <div class="row maginPage" >
        <div class="col-lg-2 pageBox "></div>
        <div class="col-lg-3 removePadding ">
            <div  class="imeage1">
                <img src="/resources/images/slid2.jpg" >
            </div>
            <div class="reText">
                <div class="line2"></div>
            </div>
        </div>
        <div class="col-lg-5 removePadding" >
            <div class="mainText">
            </div>
            <div class="textPage2">
            </div>
        </div>
        <div class="col-lg-2 pageBox "> </div>
    </div>


    <div class="deaf" id="test"></div>
    <div class="row maginPage" >
        <div class="col-lg-2 pageBox "></div>
        <div class="col-lg-3 removePadding ">
            <div  class="logo">
                <img src="/resources/images/slide1.jpg" >
            </div>
            <div class="reText3">
                <div class="line2"></div>
            </div><br><br>
            <div class="reText3">
                <div class="line2"></div>
            </div>
        </div>
        <div class="col-lg-5 removePadding" >
            <div class="mainText">
            </div>
                <div class="textPage3">


                    <div class="col-sm-6 removePadding" style="background-color:yellow;">
                        <div class="line"></div>
                    </div>
                    <div class="col-sm-1 removePadding" style="background-color:pink;">
                        ta sunt explicabo.
                    </div>
                    <div class="col-sm-3 removePadding" style="background-color:yellow;">
                        hhhh
                    </div>
                    <div class="col-sm-2 removePadding" style="background-color:pink;">
                        sunt explicabo.
                    </div>


            </div>
        </div>
        <div class="col-lg-2 pageBox "> </div>
    </div>




    <div class="deaf" id="board"></div>
    <div class="row maginPage" >
        <div class="col-lg-2 pageBox"></div>
        <div class="col-lg-3 removePadding">
            <div  class="imeage4">
                <img src="/resources/images/intro1.jpg" >
            </div>
            <div class="reText4">
                <div class="line2"></div>
            </div>
        </div>
        <div class="col-lg-5 removePadding" >
            <div class="mainText">
            </div>
            <div class="textPage4 ">
            <div class="col-sm-6 removePadding" style="background-color:yellow;">
                <div class="line"></div>
            </div>
            <div class="col-sm-1 removePadding" style="background-color:pink;">
                ta sunt explicabo.
            </div>
            <div class="col-sm-3 removePadding" style="background-color:yellow;">
                hhhh
            </div>
            <div class="col-sm-2 removePadding" style="background-color:pink;">
                sunt explicabo.
            </div>



        </div>

            <div class="textPage4 ">
                <div class="col-sm-6 removePadding" style="background-color:yellow;">
                    <div class="line"></div>
                </div>
                <div class="col-sm-1 removePadding" style="background-color:pink;">
                    ta sunt explicabo.
                </div>
                <div class="col-sm-3 removePadding" style="background-color:yellow;">
                    hhhh
                </div>
                <div class="col-sm-2 removePadding" style="background-color:pink;">
                    sunt explicabo.
                </div>



            </div>

            <div class="textPage4 ">
                <div class="col-sm-6 removePadding" style="background-color:yellow;">
                    <div class="line"></div>
                </div>
                <div class="col-sm-1 removePadding" style="background-color:pink;">
                    ta sunt explicabo.
                </div>
                <div class="col-sm-3 removePadding" style="background-color:yellow;">
                    hhhh
                </div>
                <div class="col-sm-2 removePadding" style="background-color:pink;">
                    sunt explicabo.
                </div>



            </div>

            <div class="textPage4 ">
                <div class="col-sm-6 removePadding" style="background-color:yellow;">
                    <div class="line"></div>
                </div>
                <div class="col-sm-1 removePadding" style="background-color:pink;">
                    ta sunt explicabo.
                </div>
                <div class="col-sm-3 removePadding" style="background-color:yellow;">
                    hhhh
                </div>
                <div class="col-sm-2 removePadding" style="background-color:pink;">
                    sunt explicabo.
                </div>



            </div>

        </div>
        <div class="col-lg-2 pageBox"> </div>
    </div>
</div>


<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="false"/>