<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/>
<script>
    var userId=Boolean(${login.userId});
    if(userId){
        alert("이미 로그인 되어있습니다. 로그아웃 해주세요");
        self.location = "/";
    }

</script>
<link href="/resources/dist/css/login.css" rel="stylesheet">
<div  id="login">
    <div class="wrapper fadeInDown text-center">

        <div class="card border-secondary mb-3" style="max-width: 20rem;" id="formContent">

            <div class="card-header" style="background-color: black">
                <!-- Icon -->
                <%--<div class="fadeIn first">--%>
                <%--<img src="http://danielzawadzki.com/codepen/01/icon.svg" id="icon" alt="User Icon" />--%>
                <%--</div>--%>
                <h1 class="text-white hn">Log in</h1>

            </div>
            <div class="card-body text-secondary" id="formFooter">

                <!-- Login Form -->
                <form name="login" action="/user/loginPost" method="post">


                    <%--<div class="panel-heading">--%>
                    <%--<div class="panel-title"><h1>Log in</h1></div>--%>
                    <%--</div>--%>
                    <input type="text" class="form-control" id="userEmail" name="userEmail" placeholder="가입한 Email을 입력해주세요" autofocus>
                    <input type="text" class="form-control" id="userPassword" name="userPassword" placeholder="Password를 입력해주세요" >
                    <input type="submit" class="form-control btn btn-primary" value="로그인"/>

                    <%--<a href="/user/naverLogin"><img width="100%" height="50" src="/resources/images/20171227_094328214.jpg"/></a>--%>
                </form>





                <%--<a href="/user/googleLogin"><img width="100%" height="50" src="/resources/images/google.png"/></a>--%>
                <div>
                    <%--<a href="/user/githubLogin">--%>
                    <%--<img width="100%" height="50" src="/resources/images/github.png"/>--%>
                    <%--</a>--%>
                    <a class="btn btn-block btn-social btn-google naver"  href="/user/naverLogin" onclick="_gaq.push(['_trackEvent', 'btn-social', 'click', 'btn-google']);">
                        <img class="naverImg ml-2" src="/resources/images/naver.png"/> Sign in with Naver
                    </a>
                    <a class="btn btn-block btn-social btn-google" href="/user/googleLogin" onclick="_gaq.push(['_trackEvent', 'btn-social', 'click', 'btn-google']);">
                        <span class="fa fa-google mt-1 ml-2"></span> Sign in with Google
                    </a>
                    <a class="btn btn-block btn-social btn-github" href="/user/githubLogin" onclick="_gaq.push(['_trackEvent', 'btn-social', 'click', 'btn-github']);">
                        <span class="fa fa-github mt-1 ml-2"></span> Sign in with GitHub
                    </a>
                </div>

                <button type="button" class="btn btn-block btn-social btn-tumblr" style="width:49%;margin-top: 4px;display: inline-block;text-align: center;padding-left: 0px;padding-right:0px;" onclick="location.href='/user/register'">회원가입</button>
                <button type="button" class="btn btn-block btn-social btn-tumblr" style="width:49%;margin-top: 4px;;display: inline-block;text-align: center;padding-left: 0px;padding-right:0px;" onclick="location.href='/user/findPassword'">비밀번호 찾기</button></div>


        </div>
    </div>

</div>


