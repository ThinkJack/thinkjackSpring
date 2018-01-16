<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: kwak
  Date: 2018. 1. 5.
  Time: AM 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>myInfo</title>
</head>
<jsp:include page="/WEB-INF/views/include/myinfoTab.jsp" flush="false"/>

<div role="tabpanel" class="tab-pane fade active in" id="Account_information" aria-labelledby="home-tab">
    <p style="text-align: left">사용자 프로필</p>
    <div class="big-area">
        <img id="profile" align="left" class="small-unit" style="width:200px;height:200px;" src=""
             alt="Profile image example"/>
        <div class="small-unit">
            <h4>"${login.userName}"<p style="color:black;">님 반가워요</p></h4>
            <br>
            <p style="color:black;">${login.userEmail}</p><br>
            <button class="btn btn-default" onclick="location.href='/user/modifyUser'">정보변경</button>
            <br>
            <button class="btn btn-default" onclick="location.href='/user/setPassAuthCheck'">패스워드 변경</button>
        </div>
        <div class="small-unit"></div>
        <div class="small-unit"></div>
    </div>

    <div class="big-area">
        <div class="small-unit"></div>
        <div class="small-unit"></div>
        <div class="small-unit"></div>
        <div class="small-unit"></div>
    </div>
</div>
</div>

<script src="/resources/dist/js/upload.js"></script>
<script>
    $(document).ready(function () {
        $(".Account_information").addClass(" active");
        var imgtest;
        var fullName = "${login.userProfile}";
        if (fullName !== "") {
            imgtest = getFileInfo(fullName);
            console.log(imgtest);
            str = imgtest;
        } else {
            str = "/resources/images/123.gif";
        }
        $("#profile").attr("src", str);
    });
</script>
