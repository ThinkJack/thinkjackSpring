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


    #profile-wrap {
        position: absolute;
        margin: 0 auto;
        top: 0; bottom: 0; left: 0; right: 0;
        text-align: center;
        height: 320px;
        width: 320px;
        z-index: 5;
    }
    .profile-overlay {
        position: absolute;
        margin: 0 auto;
        margin-top: 10px;
        top: 0; bottom: 0; left: 0; right: 0;
        z-index: 2;
        border-radius: 50%;
        display: block;
        width: 320px;
        height: 320px;
        -webkit-box-shadow: inset 0px 0px 10px 0px rgba(0, 0, 0, 0.4);
        -moz-box-shadow: inset 0px 0px 10px 0px rgba(0, 0, 0, 0.4);
        box-shadow: inset 0px 0px 10px 0px rgba(0, 0, 0, 0.4);
    }
    .profile-image {
        position: absolute;
        margin: 0 auto;
        margin-top: 10px;
        top: 0; bottom: 0; left: 0; right: 0;
        z-index: 0;
        display: block;
        height: 320px;
        width: 320px;
        border-radius: 50%;
        /*     background: url(http://goltermann.design/wp-content/themes/goltermann/images/jaschagoltermann.png) 0 -30px; */
        background-size: 100%;
        overflow: hidden;
        -webkit-box-shadow: 0 0 0px 15px rgba(0, 0, 0, .2);
        -moz-box-shadow: 0 0 0px 15px rgba(0, 0, 0, .2);
        box-shadow: 0 0 0px 15px rgba(0, 0, 0, .2);
        transition: all ease 0.3s;
    }
    #profile-wrap:hover .profile-image {
        background-position: 0 -29px;
        border-radius: 0;
        margin-top: 0px;
        height: 320px;
        width: 320px;
        z-index: 1;
        -webkit-box-shadow: 0 0 0px 15px rgba(0, 0, 0,.2),
        inset 0px -100px 100px -90px rgba(0, 0, 0, 1);
        -moz-box-shadow: 0 0 0px 15px rgba(0, 0, 0,.2),
        inset 0px -100px 100px -90px rgba(0, 0, 0, 1);
        box-shadow: 0 0 0px 15px rgba(0, 0, 0,.2),
        inset 0px -100px 100px -90px rgba(0, 0, 0, 1);
    }


    #profile-wrap:hover .pulse1{
        border: 2px solid rgba(255, 255, 255, 0);
        box-shadow: inset 0px 0px 15px 10px rgba(0, 0, 0, 0);
    }
    #profile-wrap:hover .pulse2{
        border: 10px solid rgba(0, 0, 0, 0);
        box-shadow: inset 0px 0px 12px 5px rgba(255, 255, 255, 0);
    }

    .pulse1 {
        position: absolute;
        width: 320px;
        height: 320px;
        margin: auto;
        top: 20px;
        left: 0;
        bottom: 0;
        right: 0;
        z-index: 2;
        opacity: 0;
        border: 2px solid rgba(255, 255, 255, .1);
        -webkit-animation: pulsejg1 4s linear infinite;
        animation: pulsejg1 4s linear infinite;
        -webkit-border-radius: 50%;
        -moz-border-radius: 50%;
        border-radius: 50%;
        box-shadow: inset 0px 0px 15px 10px rgba(0, 0, 0, .6);
        box-sizing: border-box;
        transition: all ease 0.8s;
    }
    .pulse2 {
        position: absolute;
        width: 320px;
        height: 320px;
        margin: auto;
        top: 20px;
        left: 0;
        bottom: 0;
        right: 0;
        z-index: 2;
        opacity: 0;
        border: 10px solid rgba(0, 0, 0, .4);
        -webkit-animation: pulsejg2 4s linear infinite;
        animation: pulsejg2 4s linear infinite;
        -webkit-border-radius: 50%;
        -moz-border-radius: 50%;
        border-radius: 50%;
        box-shadow: inset 0px 0px 12px 5px rgba(255, 255, 255, .8);
        box-sizing: border-box;
        transition: all ease 0.8s;
    }
    @-webkit-keyframes pulsejg1 {
        0% {
            -webkit-transform: scale(.6);
            opacity: 0
        }
        50% {
            -webkit-transform: scale(.6);
            opacity: 0
        }
        60% {
            -webkit-transform: scale(.9);
            opacity: .1
        }
        70% {
            -webkit-transform: scale(1.1);
            opacity: .25
        }
        80% {
            -webkit-transform: scale(1.25);
            opacity: .1
        }
        100% {
            -webkit-transform: scale(1.4);
            opacity: 0
        }
    }
    @keyframes pulsejg1 {
        0% {
            transform: scale(.6);
            opacity: 0
        }
        50% {
            transform: scale(.6);
            opacity: 0
        }
        60% {
            transform: scale(.9);
            opacity: .1
        }
        70% {
            transform: scale(1.1);
            opacity: .25
        }
        80% {
            transform: scale(1.25);
            opacity: .1
        }
        100% {
            transform: scale(1.4);
            opacity: 0
        }
    }
    @-webkit-keyframes pulsejg2 {
        0% {
            -webkit-transform: scale(.6);
            opacity: 0
        }
        40% {
            -webkit-transform: scale(.8);
            opacity: .05
        }
        50% {
            -webkit-transform: scale(1);
            opacity: .1
        }
        60% {
            -webkit-transform: scale(1.1);
            opacity: .3
        }
        80% {
            -webkit-transform: scale(1.2);
            opacity: .1
        }
        100% {
            -webkit-transform: scale(1.3);
            opacity: 0
        }
    }
    @keyframes pulsejg2 {
        0% {
            transform: scale(.6);
            opacity: 0
        }
        40% {
            transform: scale(.8);
            opacity: .05
        }
        50% {
            transform: scale(1);
            opacity: .1
        }
        60% {
            transform: scale(1.1);
            opacity: .3
        }
        80% {
            transform: scale(1.2);
            opacity: .1
        }
        100% {
            transform: scale(1.3);
            opacity: 0
        }
    }
</style>
<div id="Account_information" class="tabcontent card mb-3 active" >

    <section class="grid-1 big-area "  style="padding: 80px;margin-top: 0;">

        <div class="panel panel-title">
            <h1 class="bd" style="color:#FFAA3E;">MyProfile</h1>
            <p style="color: grey;">사용자 프로필을 수정하세요</p>
        </div>


        <div class="panel panel-8" >


            <div class="row">
                <div class="col-12">
                    <div class="panel panel-7 ">
                        <p class="hn" style="font-size: 25px" ><a >"${login.userName}" </a>님 반가워요~</p>
                    </div>
                </div>

                <div class="col-6" >


                    <div id="profile-wrap">
                        <div class="pulse1"></div>
                        <div class="pulse2"></div>
                        <%--<div class="profile-overlay"></div>--%>
                        <div class="profile-image">
                            <img id="profile" align="center" class="small-unit "
                                 style="width:100%;height:100%;" src="" alt="Profile image example">
                        </div>
                    </div>

                </div>
                <div class="col-6 mt-5">
                    <p  class=" mt-3 bd " style="font-size: 30px">Email:<a class="ml-3" style="font-size:20px;">${login.userEmail}</a></p>
                    <p  class=" mt-1 bd" style="font-size: 30px">Name:<a class="hn ml-3" style="font-size:20px;">${login.userName}</a></p>
                    <div class="row">
                        <button class="btn btn-primary text-white col-6 hn" onclick="location.href='/user/modifyUser'">정보변경
                        </button>
                        <button class="btn btn-primary  text-white col-6 hn"
                                onclick="location.href='/user/setPassAuthCheck'">패스워드 변경
                        </button>
                    </div>
                </div>

            </div>
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


