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

    <style>
        /*body {*/
            /*font-family: Arial;*/
        /*}*/

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
    </style>

<div id="Account_information" class="tabcontent card text-white bg-primary mb-3">

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

</div>
</div>

<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/>

<script src="/resources/dist/js/upload.js"></script>
<script>
    $(document).ready(function () {
        $(".Account_information").addClass(" active");

        $("#profile").attr("src", getFileInfo("${login.userProfile}"));
    });
</script>
