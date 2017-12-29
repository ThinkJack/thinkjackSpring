
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/>

<style>
<%--전체적으로 padding-top값 존재--%>
    .container-fluid{
        padding-top: 220px;
        height: 850px;
    }

    .logo{
        width:100%;
        height:100%;

    }
    .mainText{
        width:100%;
        height:15%;
     background-color: #5A5CAD
    }

    .textPage{
        width:100%;
        height:100%;
        background-color: #2A00FF;
    }

    img{
        width: 100%;
        height: 100%;
    }
</style>
<%--Main--%>
<div id="main" class="container-fluid">
    <div class="row ">
        <div class="col-lg-2" style="background-color: #aa0000"></div>
        <div class="col-lg-3" style="background-color: #00a8c6">
            <div  class="logo">
                <img src="/resources/images/logo.png" >
            </div>
        </div>
        <div class="col-lg-5" style="background-color: #2E8B57">
            <div class="mainText">
                <h2>main navbar 공간</h2>
            </div>
            <div class="textPage">
                <h2>??</h2>
            </div>
            <div class="mainText">
                <h2>??</h2>
            </div>
        </div>
        <div class="col-lg-2" style="background-color: #aa0000">      <h2>이미지</h2></div>
    </div>
</div>





<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="false"/>