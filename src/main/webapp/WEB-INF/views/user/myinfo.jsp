<%--
  Created by IntelliJ IDEA.
  User: kwak
  Date: 2018. 1. 5.
  Time: AM 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <style>
        body {font-family: Arial;}

        /* Style the tab */
        .tab {
            overflow: hidden;
            border: 1px solid #ccc;
            background-color: #f1f1f1;
        }

        /* Style the buttons inside the tab */
        .tab button {
            background-color: inherit;
            float: left;
            border: none;
            outline: none;
            cursor: pointer;
            padding: 14px 16px;
            transition: 0.3s;
            font-size: 17px;
        }

        /* Change background color of buttons on hover */
        .tab button:hover {
            background-color: #ddd;
        }

        /* Create an active/current tablink class */
        .tab button.active {
            background-color: #ccc;
        }

        /* Style the tab content */
        .tabcontent {
            display: none;
            padding: 6px 12px;
            border: 1px solid #ccc;
            border-top: none;
        }

        .small-unit {
            float: left;
            width: 200px;
            height: 200px;
            color: black;
           /* background: #333;*/
            margin: 1px;
        }
        .big-area {
            float: left;
            width: 500px;
            margin: 0 10px 0 0;
            padding: 10px;
        /*    background: #999;*/
        }
    </style>

</head>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/>
<div class="tab">
    <button class="tablinks" show onclick="openCity(event, 'Account_information')" >Account information</button>
    <button class="tablinks" onclick="openCity(event, 'Board')">Board</button>
    <button class="tablinks" onclick="openCity(event, 'Source_code')">Source code</button>
</div>

<div id="Account_information" class="tabcontent">
    <p style="text-align: left">사용자 프로필</p>
    <div class="big-area">
        <img id="profile" align="left" class="small-unit" style="width:200px;height:200px;"  src="" alt="Profile image example"/>
        <div class="small-unit"><h1>${login.userEmail}</h1><br><p>${login.userName}</p><br><button onclick="location.href='/user/modifyUser'">정보변경</button><br><button onclick="location.href='/user/setPassAuthCheck'">패스워드 변경</button></div>
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

<div id="Board" class="tabcontent">

    게시판
</div>

<div id="Source_code" class="tabcontent">
    소스코드
</div>

<script>
    function openCity(evt, cityName) {
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }
        document.getElementById(cityName).style.display = "block";
        evt.currentTarget.className += " active";
    }
</script>
<script src="/resources/upload.js"></script>
<script>
    $(document).ready(function() {
        var imgtest;
        var fullName="${login.userProfile}";
        if(fullName!=="") {
            imgtest = getFileInfo(fullName);
            console.log(imgtest);
            str = imgtest;
        }else{
            str = "/resources/images/123.gif";
        }
        $("#profile").attr("src",str);
    });
</script>
</body>
</html>