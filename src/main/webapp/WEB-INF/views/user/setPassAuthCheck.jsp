
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/>

<script>
    var socialId=Boolean(${socialID});
    if(socialId){
        alert("소셜 아이디는 패스워드를 변경할 수 없습니다. \n해당 소셜 사이트에 접속하여 변경해 주세요.");
        self.location = '/test/myinfo';
    }

</script>

<link href="/resources/dist/css/login.css" rel="stylesheet">
<div  id="Password">
    <div class="wrapper fadeInDown text-center">

        <div class="card border-secondary mb-3 bd " style="max-width: 20rem;" id="formContent">

            <div class="card-header" style="background-color: black">
                <!-- Icon -->
                <div class="fadeIn first">
                    <img   style="width: 200px " src="/resources/images/password2.svg" id="icon" alt="User Icon" />
                    <%--<img src="/resources/images/main/mainB.png">--%>
                    <h1 class="hn text-white">패스워드 변경</h1>
                </div>
            </div>
            <div class="card-body text-secondary" id="formFooter">
                <form name="login" action="/user/setPassAuthCheck" method="post">

                    <input type="text" class="form-control" id="userEmail" name="userEmail" value="${login.userEmail}" readonly autofocus>
                    <input type="password" class="form-control" id="userPassword" name="userPassword" placeholder="Password를 입력해주세요" autofocus >
                    <input type="submit" class="form-control btn btn-primary" value="로그인"/>

                </form>
            </div>
        </div>
    </div>
</div>