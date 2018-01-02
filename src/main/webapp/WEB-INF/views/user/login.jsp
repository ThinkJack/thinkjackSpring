
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>

<html lang="en">

<head>
    <!--필수 -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!--w3schools-->
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <title>Thinkjack</title>

    <!--css파일 연결부분-->
    <link href="/resources/dist/css/common.css" rel="stylesheet">
    <link href="/resources/dist/css/main.css" rel="stylesheet">

    <!--sidenavbar-새로운 게시글 알림-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
    <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>

    <!--아이콘-->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="/resources/assets/css/bootstrap.css" rel="stylesheet">
    <link href="/resources/assets/css/font-awesome.css" rel="stylesheet">
    <link href="/resources/assets/css/docs.css" rel="stylesheet" >

    <link href="/resources/bootstrap-social.css" rel="stylesheet" >
    <style>

        .naver{
          background-color:#1EC800;
            margin-top: 5px;
        }
        .naverImg{
            background-color:#1EC800;
        }
        .naverImg:hover {
            /*box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);*/
            background-color: #39e600;
        }
        .naver:hover {
            /*box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);*/
            background-color: #39e600;
        }

    </style>
</head>
<body>
<div class="container text-center">

    <div class="row">
        <div class="col-sm-4"></div>

        <div class="col-sm-4">


            <form name="login" action="/user/loginPost" method="post">


                <div class="panel-heading">
                    <div class="panel-title"><h1>Log in</h1></div>
                </div>
                <input type="text" class="form-control" id="userEmail" name="userEmail" placeholder="가입한 Email을 입력해주세요" autofocus>
                <input type="text" class="form-control" id="userPassword" name="userPassword" placeholder="Password를 입력해주세요" >
                <input type="submit" class="form-control btn btn-primary" value="로그인"/>

                    <%--<a href="/user/naverLogin"><img width="100%" height="50" src="/resources/images/20171227_094328214.jpg"/></a>--%>



                <%--<a href="/user/googleLogin"><img width="100%" height="50" src="/resources/images/google.png"/></a>--%>
                <div>
                    <%--<a href="/user/githubLogin">--%>
                     <%--<img width="100%" height="50" src="/resources/images/github.png"/>--%>
                        <%--</a>--%>
                        <a class="btn btn-block btn-social btn-google naver"  href="/user/naverLogin" onclick="_gaq.push(['_trackEvent', 'btn-social', 'click', 'btn-google']);">
                            <img class="naverImg" src="/resources/images/Log in with NAVER_Icon_Green.PNG"/> Sign in with Naver
                        </a>
                        <a class="btn btn-block btn-social btn-google" href="/user/googleLogin" onclick="_gaq.push(['_trackEvent', 'btn-social', 'click', 'btn-google']);">
                            <span class="fa fa-google"></span> Sign in with Google
                        </a>
                        <a class="btn btn-block btn-social btn-github" href="/user/githubLogin" onclick="_gaq.push(['_trackEvent', 'btn-social', 'click', 'btn-github']);">
                            <span class="fa fa-github"></span> Sign in with GitHub
                        </a>
                </div>
                <button type="button" onclick="location.href='/user/register'">회원가입</button>
                <button type="button" onclick="location.href='/user/findPassword'">비밀번호 찾기</button>

             </form>
        </div>
    </div>

</div>

</body>
</html>