<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/include/myinfoTab.jsp" flush="false"/>
<%--
  Created by IntelliJ IDEA.
  User: kwak
  Date: 2018. 1. 5.
  Time: AM 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


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
<div id="Account_information" class="tabcontent card mb-3 active">

    <section class="grid-1 big-area " style="margin-left: 5%;width:100%;">

        <div class="panel panel-title">
            <h1 class="bd">MyProfile</h1>
            <p>사용자 프로필을 수정하세요</p>
        </div>


        <div class="panel panel-8" style="background-color: #da7908"><img id="profile" align="left" class="small-unit rounded-circle"
                                        style="width:15rem;height:15rem;" src="" alt="Profile image example">
            <div class="panel panel-7 ">
                <p class="hn" style="font-size: 30px">"${login.userName}"님 반가워요~</p>
            </div>
            <p  class=" mt-3 bd" style="font-size: 30px">Email:<a class="ml-3" style="font-size:20px">${login.userEmail}</a></p>
            <p  class=" mt-1 bd" style="font-size: 30px">Name:<a class="hn ml-3" style="font-size:20px">${login.userName}</a></p>
            <button class="btn btn-primary text-white" onclick="location.href='/user/modifyUser'">정보변경
            </button>
            <button class="btn btn-primary  text-white"
                    onclick="location.href='/user/setPassAuthCheck'">패스워드 변경
            </button>
        </div>

    </section>

    <script>
        $(document).ready(function () {
            $(".Account_information").addClass(" active");

            $("#profile").attr("src", getFileInfo("${login.userProfile}"));
        });
    </script>
</div>

</div>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>


