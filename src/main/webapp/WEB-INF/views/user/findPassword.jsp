<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
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
</head>
  <body>
  <div class="container text-center">
  <div class="row">
      <div class="col-sm-4"></div>
  <div class="col-sm-4">
      <div class="panel-heading">
          <div class="panel-title"><h1>Find Password</h1></div>
      </div>
  <form name="findPassword" action="/user/findPassword" method="post" onsubmit="return signinchk(this)">
    
      <input type="text" name="userEmail" id="userEmail" placeholder="이메일을 입력해 주세요"/>

      <input type="submit" id="authenticate" value="비밀번호 찾기"/>
      <input type="reset" value="취소"/>

  </form>
  </div>
  </div>
  </div>
  </body>
</html>