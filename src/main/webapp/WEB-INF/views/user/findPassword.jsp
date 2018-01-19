<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/>
<%--<link href="/resources/dist/css/common.css" rel="stylesheet">--%>
<%--<link href="/resources/dist/css/main.css" rel="stylesheet">--%>


<%--<!-- 합쳐지고 최소화된 최신 CSS -->--%>
<%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">--%>

<%--<!-- 부가적인 테마 -->--%>
<%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">--%>

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>--%>
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>--%>
<script>
    function signinchk(obj){
        if(!obj.userEmail.value || obj.userEmail.value.trim().length ==0){
            alert("이메일이 입력되지 않았습니다.");
            obj.userEmail.value ="";
            obj.userEmail.focus();
            return false;
        }
    }
    $(document).on('click','#authenticate',function() {

        var userEmail = $('#userEmail').val();
        var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;

        if (!userEmail || userEmail.trim().length == 0) {
            alert("이메일이 입력되지 않았습니다.");
            return false;
        }
        if (regex.test(userEmail) === false) {
            alert("잘못된 이메일 형식입니다.");
            return false;
        }
    });
</script>
<link href="/resources/dist/css/login.css" rel="stylesheet">
<div  id="findPassword">

    <div class="wrapper fadeInDown text-center">

        <div class="card border-secondary mb-3" style="max-width: 20rem;" id="formContent">


            <div class="card-header" style="background-color: black">

                <h1 class="text-white hn">Find Password</h1>
            </div>
            <div class="fadeIn first">
                <img class="mt-3 mb-3"   style="width: 150px " src="/resources/images/password2.svg" id="icon" alt="User Icon" />
            </div>

            <form name="findPassword" action="/user/findPassword" method="post" onsubmit="return signinchk(this)">

                <input type="text" class="form-control" name="userEmail" id="userEmail" placeholder="가입 시 사용한 이메일을 입력해 주세요"/>
                <input type="submit" class="form-control btn btn-primary" id="authenticate" value="비밀번호 찾기"/>

            </form>
        </div>
    </div>
</div>