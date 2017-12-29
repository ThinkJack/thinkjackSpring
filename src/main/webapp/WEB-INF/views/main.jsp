
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    <%--전체적으로 padding-top값 존재--%>
    .maginPage{
        height: 700px;
    }

    .logo{
        width:100%;
        height:100%;
    }
    .mainText{
        width:100%;
        height:30%;
        background-color: #5A5CAD;
    }

    .textPage{
        width:100%;
        height:70%;
        background-color: #2A00FF;
    }

    img{
        width: 450px;
        height: 450px;
        Position: relative;
        left: -15px;
    }
    .deaf{
        height: 165px;
        /*background-color: #aa0000;*/
    }
    .pageBox{
        height: 700px;
    }
</style>
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/>



<%--Main--%>
<div class="container-fluid " >
    <div class="deaf" id="main"></div>
    <div class="row maginPage"  >
    <div class="col-lg-2 pageBox"></div>
    <div class="col-lg-3" style="background-color: #00a8c6">
        <div class="logo">
            <img src="/resources/images/logo.png" >
        </div>
    </div>
    <div class="col-lg-5" >
        <div class="mainText">

        </div>
        <div class="textPage">

        </div>
    </div>
    <div class="col-lg-2 pageBox"> </div>
</div>


    <div class="deaf" id="editor"></div>
    <div class="row maginPage" >
        <div class="col-lg-2 pageBox"></div>
        <div class="col-lg-3" style="background-color: #00a8c6">
            <div  class="logo">
                <img src="/resources/images/slid2.jpg" >
            </div>
        </div>
        <div class="col-lg-5" >
            <div class="mainText">

            </div>
            <div class="textPage">

            </div>
        </div>
        <div class="col-lg-2 pageBox"> </div>
    </div>



    <div class="deaf" id="test"></div>
    <div class="row maginPage" >
        <div class="col-lg-2 pageBox"></div>
        <div class="col-lg-3" style="background-color: #00a8c6">
            <div  class="logo">
                <img src="/resources/images/logo.png" >
            </div>
        </div>
        <div class="col-lg-5" >
            <div class="mainText">

            </div>
            <div class="textPage">

            </div>
        </div>
        <div class="col-lg-2 pageBox"> </div>
    </div>


    <div class="deaf" id="board"></div>
    <div class="row maginPage" >
        <div class="col-lg-2 pageBox"></div>
        <div class="col-lg-3" style="background-color: #00a8c6">
            <div  class="logo">
                <img src="/resources/images/intro1.jpg" >
            </div>
        </div>
        <div class="col-lg-5" >
            <div class="mainText">

            </div>
            <div class="textPage">

            </div>
        </div>
        <div class="col-lg-2 pageBox"> </div>
    </div>
</div>


<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="false"/>