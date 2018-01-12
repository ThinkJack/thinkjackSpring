
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>

<html lang="en">

<link href="/resources/assets/css/bootstrap.css" rel="stylesheet">
<link href="/resources/assets/css/font-awesome.css" rel="stylesheet">
<link href="/resources/assets/css/docs.css" rel="stylesheet" >
<link href="/resources/bootstrap-social.css" rel="stylesheet" >
<script>
    var socialId=Boolean(${socialID});
    if(socialId){
        self.location = '/user/modifyUser';
    }

</script>
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/>
<link href="/resources/dist/css/login.css" rel="stylesheet">
<div class="wrapper fadeInDown text-center">

    <div class="card border-secondary mb-3" style="max-width: 20rem;" id="formContent">

        <div class="card-header" style="background-color: black">
            <!-- Icon -->
            <%--<div class="fadeIn first">--%>
            <%--<img src="http://danielzawadzki.com/codepen/01/icon.svg" id="icon" alt="User Icon" />--%>
            <%--</div>--%>
            <h1 style="color: white">Log in</h1>

        </div>
        <div class="card-body text-secondary" id="formFooter">

            <form name="login" action="/user/modifyAuthCheck" method="post">


                <div class="panel-heading">
                    <div class="panel-title"><h1>회원 정보 변경</h1></div>
                </div>
                <input type="text" class="form-control" id="userEmail" name="userEmail" value="${login.userEmail}" readonly autofocus>
                <input type="text" class="form-control" id="userPassword" name="userPassword" placeholder="Password를 입력해주세요" autofocus >
                <input type="submit" class="form-control btn btn-primary" value="로그인"/>

                <%--<a href="/user/naverLogin"><img width="100%" height="50" src="/resources/images/20171227_094328214.jpg"/></a>--%>



                <%--<a href="/user/googleLogin"><img width="100%" height="50" src="/resources/images/google.png"/></a>--%>
                <div>
                    <%--<a href="/user/githubLogin">--%>
                    <%--<img width="100%" height="50" src="/resources/images/github.png"/>--%>
                    <%--</a>--%>

                </div>
            </form>
        </div>
    </div>
</div>
    </body>
</html>