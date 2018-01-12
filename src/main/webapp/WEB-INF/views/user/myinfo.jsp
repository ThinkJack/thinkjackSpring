<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>myInfo</title>
</head>
<jsp:include page="/WEB-INF/views/include/myinfoTab.jsp" flush="false"/>

<div id="Account_information" class="tabcontent card text-white bg-primary mb-3 ">

    <section class="grid-1 big-area" >
        <%--<h1>사용자 프로필</h1>--%>
        <p>사용자 프로필</p>

        <div class="panel panel-1"></div>
        <div class="panel panel-2 ">
            <img id="profile" align="left" class="small-unit" style="width:200px;height:200px;"  src="" alt="Profile image example"/>
        </div>
        <div class="panel panel-3 small-unit">
            <h4>"${login.userName}"<p style="color:black;">님 반가워요</p></h4> <br><p style="color:black;">${login.userEmail}</p>
        </div>
        <div class="panel panel-4 small-unit"><button class="btn btn-default" onclick="location.href='/user/modifyUser'">정보변경</button></div>
        <div class="panel panel-5"></div>
        <div class="panel panel-6 small-unit"><button class="btn btn-default" onclick="location.href='/user/setPassAuthCheck'">패스워드 변경</button></div>
        <div class="panel panel-7">
            <p>“Naaah.”</p>
        </div>
        <div class="panel panel-8"></div>
        <div class="panel panel-9"></div>

    </section>


</div>
<script>
    $(document).ready(function () {
        $(".Account_information").addClass(" active");

        $("#profile").attr("src", getFileInfo("${login.userProfile}"));
    });
</script>


